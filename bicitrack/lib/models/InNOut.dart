import 'package:cloud_firestore/cloud_firestore.dart';

class InNOut {
  String? serialNumber;
  Timestamp? date;
  String? type;

  InNOut({
    required this.serialNumber,
    required this.date,
    required this.type,
  });

  InNOut.fromJSON(Map<String, dynamic> json) {
    serialNumber = "undefined";
    date = Timestamp(0, 0);
    type = "undefined";

    serialNumber = json['serialNumber'];
    date = json['date'] ;
    type = json['type'];
  }

  Map<String, dynamic> toJSON() {
    return {
      'serialNumber': serialNumber,
      'date': date,
      'type': type,
    };
  }
}
