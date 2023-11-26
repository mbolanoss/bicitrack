import 'package:bicitrack/utilities/custom_theme.dart';
import 'package:flutter/material.dart';

class OwnerData extends StatefulWidget {
  final List<OwnerDataUnit> data;
  final bool isEditMode;

  const OwnerData({super.key, required this.data, required this.isEditMode});

  @override
  State<StatefulWidget> createState() => _OwnerDataState();
}

class _OwnerDataState extends State<OwnerData> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    List<Widget> rows = [];

    for (int i = 0; i < widget.data.length; i++) {
      rows.add(Row(
        children: [
          Icon(
            widget.data[i].icon,
            size: 32,
          ),
          SizedBox(width: screenSize.width * 0.03),
          Text(
            widget.data[i].content,
            style: const TextStyle(
                color: seablue, fontWeight: FontWeight.bold, fontSize: 18),
          )
        ],
      ));

      rows.add(SizedBox(height: screenSize.height * 0.02));
    }

    return Column(
      children: rows,
    );
  }
}

class OwnerDataUnit {
  IconData icon;
  String content;
  TextEditingController controller = TextEditingController();

  OwnerDataUnit({required this.icon, required this.content});
}
