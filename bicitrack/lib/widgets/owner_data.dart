import 'package:flutter/material.dart';

class OwnerData extends StatefulWidget {
  final List<OwnerDataUnit> data;

  const OwnerData({super.key, required this.data});

  @override
  State<StatefulWidget> createState() => _OwnerDataState();
}

class _OwnerDataState extends State<OwnerData> {
  @override
  Widget build(BuildContext context) {
    List<Widget> rows = [];

    for (int i = 0; i < widget.data.length; i++) {
      rows.add(Row(
        children: [
          Icon(
            widget.data[i].icon,
            size: 32,
          ),
          const SizedBox(width: 8),
          Text(
            widget.data[i].content,
            style: TextStyle(
                color: Colors.blue.shade700,
                fontWeight: FontWeight.bold,
                fontSize: 18),
          ),
        ],
      ));

      rows.add(const SizedBox(height: 20));
    }

    return Column(
      children: rows,
    );
  }
}

class OwnerDataUnit {
  final IconData icon;
  final String content;

  const OwnerDataUnit({required this.icon, required this.content});
}
