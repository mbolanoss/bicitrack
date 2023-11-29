import 'package:bicitrack/screens/bicycle_view.dart';
import 'package:bicitrack/utilities/custom_theme.dart';
import 'package:flutter/material.dart';

class UsageHistoryItem extends StatelessWidget {
  final bool isEntrance;
  final String nfc;
  final String date;

  const UsageHistoryItem(
      {super.key,
      required this.isEntrance,
      required this.nfc,
      required this.date});

  void goToNfc(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return BicycleScreen(serialNumber: nfc);
        }
    ));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){ goToNfc(context); },
      child: Container(
        decoration: BoxDecoration(
          color: seablue, // Set the background color
          borderRadius: BorderRadius.circular(15), // Set the border radius
        ),
        padding: const EdgeInsets.all(8),
        child: Flex(
            direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.circle,
                color: isEntrance ? green : red,
                size: 18,
              ),
              Text(
                isEntrance ? 'ENT' : 'SAL',
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              Text(nfc,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w400)),
              Text(date,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w400)),
            ]),
      ),
    );
  }
}

class UsageHistoryItemData {
  final bool isEntrance;
  final String nfc;
  final String date;

  const UsageHistoryItemData(
      {required this.isEntrance, required this.nfc, required this.date});
}
