import 'package:bicitrack/utilities/custom_theme.dart';
import 'package:bicitrack/widgets/header.dart';
import 'package:bicitrack/widgets/usage_history_item.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    List<UsageHistoryItemData> data = [
      const UsageHistoryItemData(
          isEntrance: true, nfc: '04 9C 64 D2 45 2B 80', date: '06/08/2023'),
      const UsageHistoryItemData(
          isEntrance: false, nfc: '04 9C 64 D2 45 2B 80', date: '06/08/2023'),
      const UsageHistoryItemData(
          isEntrance: true, nfc: '04 9C 64 D2 45 2B 80', date: '09/08/2023'),
      const UsageHistoryItemData(
          isEntrance: false, nfc: '04 9C 64 D2 45 2B 80', date: '09/08/2023'),
      const UsageHistoryItemData(
          isEntrance: true, nfc: '04 9C 64 D2 45 2B 80', date: '10/08/2023'),
      const UsageHistoryItemData(
          isEntrance: false, nfc: '04 9C 64 D2 45 2B 80', date: '10/08/2023'),
      const UsageHistoryItemData(
          isEntrance: true, nfc: '04 9C 64 D2 45 2B 80', date: '11/08/2023'),
      const UsageHistoryItemData(
          isEntrance: false, nfc: '04 9C 64 D2 45 2B 80', date: '11/08/2023'),
    ];

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
        title: SearchBar(
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
        backgroundColor: Colors.transparent,
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
                      dataSource: <ChartData>[
                        ChartData('Mon', 3),
                        ChartData('Tue', 5),
                        ChartData('Wed', 2),
                        ChartData('Thu', 3),
                        ChartData('Fri', 3),
                        ChartData('Sat', 1),
                        ChartData('Sun', 2),
                      ],
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
