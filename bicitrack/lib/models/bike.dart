import 'package:bicitrack/models/bike_owner.dart';

class Bike {
  final String serialNumber;

  Bike({
    required this.serialNumber,
  });

  static Map<String, dynamic> toJSON(Bike bike) {
    return {
      'serialNumber': bike.serialNumber,
    };
  }
}
