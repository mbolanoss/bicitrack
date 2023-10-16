import 'package:bicitrack/models/bike.dart';

class BikeOwner {
  final String name;
  final int idCard;
  final int phoneNumber;
  final String email;
  final List<Bike> bikes;

  BikeOwner({
    required this.name,
    required this.idCard,
    required this.phoneNumber,
    required this.email,
    required this.bikes,
  });

  static Map<String, dynamic> toJSON(BikeOwner owner) {
    return {
      'name': owner.name,
      'idCard': owner.idCard,
      'phoneNumber': owner.phoneNumber,
      'email': owner.email,
      'bikes': [for (Bike bike in owner.bikes) Bike.toJSON(bike)],
    };
  }
}
