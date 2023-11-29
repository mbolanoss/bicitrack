import 'package:bicitrack/services/bike_service.dart';
import 'package:bicitrack/utilities/custom_theme.dart';
import 'package:bicitrack/widgets/header.dart';
import 'package:bicitrack/widgets/usage_history_item.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool isLoading = true;
  List<UsageHistoryItemData> data = [];
  List<ChartData> chartData = [];

  final firestoreService = BikeService();

  void initState(){
    super.initState();
    fetchBikeData(context);
  }

  void fetchBikeData(BuildContext context) async {
    Map<int, int> count = {};
    try{
     final rawInNOuts = await firestoreService.getAllInNOuts();
     data = [];

    final today = DateTime.now();
    final difference = today.weekday - 1;

     final start = today.subtract(Duration(days: difference));
     final end = start.add(const Duration(days: 7));

     for (final el in rawInNOuts){
       if (el.date != null && el.date!.toDate().isAfter(start) && el.date!.toDate().isBefore(end)){
         final currentDate = el.date!.toDate();

         if (!count.containsKey(currentDate.weekday)) {
           count[currentDate.weekday] = 1;
         } else {
           count[currentDate.weekday] = count[currentDate.weekday]! + 1;
         }
       }

       data.add(
          UsageHistoryItemData(
             isEntrance: (el.type == 'enter') || false,
             nfc: el.serialNumber!,
             date: el.date!.toDate().toString(),
         )
       );
     }
    }catch (e){
      // TODO: Throw error
    }

    chartData = [];
    final dateNames = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];
    for (var i = 1; i <= 7; i++){
      var c = count.containsKey(i) ? count[i] : 0;

      chartData.add(
        ChartData(
          dateNames[i],
          c as double,
        )
      );
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    if (isLoading) {
      return Scaffold(
        body: Center(
            child: LoadingAnimationWidget.waveDots(color: purple, size: 100)
        ),
      );
    }

    List<Widget> history = [];
    for (int i = 0; i < data.length; i++) {
      history.add(UsageHistoryItem(
          isEntrance: data[i].isEntrance,
          nfc: data[i].nfc,
          date: data[i].date));
      history.add(SizedBox(height: screenSize.height * 0.005));
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        /*title: SearchBar(
            hintText: 'Search...',
            hintStyle: MaterialStateProperty.all<TextStyle>(const TextStyle(
              color: transSeablue,
            )),
            backgroundColor:
                MaterialStateProperty.all<Color>(Colors.transparent),
            surfaceTintColor:
                MaterialStateProperty.all<Color>(Colors.transparent),
            overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
            shadowColor: MaterialStateProperty.all<Color>(Colors.transparent),
            shape: MaterialStateProperty.all<OutlinedBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
                side: const BorderSide(color: seablue, width: 2),
              ),
            )),
        centerTitle: true,
       backgroundColor: Colors.transparent,*/
      ),
      body: ListView(children: [
        Column(
          children: [
            SizedBox(height: screenSize.height * 0.03),
            const Header(text: 'Estadísticas de Semana'),
            Center(
              child: Container(
                height: 250,
                decoration: BoxDecoration(
                  color: Colors.white, // Set the background color
                  borderRadius:
                      BorderRadius.circular(20), // Set the border radius
                ),
                padding: EdgeInsets.fromLTRB(screenSize.width * 0.02,
                    screenSize.height * 0.03, screenSize.width * 0.02, 0),
                margin: EdgeInsets.all(screenSize.width * 0.04),
                child: SfCartesianChart(
                  primaryXAxis: CategoryAxis(),
                  primaryYAxis: NumericAxis(),
                  series: <ChartSeries>[
                    StackedLineSeries<ChartData, String>(
                      dataSource: chartData,
                      /*dataSource: <ChartData>[
                        ChartData('Mon', 3),
                        ChartData('Tue', 5),
                        ChartData('Wed', 2),
                        ChartData('Thu', 3),
                        ChartData('Fri', 3),
                        ChartData('Sat', 1),
                        ChartData('Sun', 2),
                      ],*/
                      xValueMapper: (ChartData data, _) => data.month,
                      yValueMapper: (ChartData data, _) => data.value,
                      name: 'Week',
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: screenSize.height * 0.01),
            const Header(text: 'Historial'),
            Container(
              margin: const EdgeInsets.all(24),
              child: Column(children: history),
            ),
            SizedBox(height: screenSize.height * 0.03),
          ],
        )
      ]),
    );
  }
}

class ChartData {
  final String month;
  final double value;

  ChartData(this.month, this.value);
}
