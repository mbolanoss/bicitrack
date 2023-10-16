import 'package:bicitrack/models/bike.dart';

class BikeOwner {
  String? name;
  int? idCard;
  int? phoneNumber;
  String? email;
  List<Bike>? bikes;

  BikeOwner({
    required this.name,
    required this.idCard,
    required this.phoneNumber,
    required this.email,
    required this.bikes,
  });

  BikeOwner.fromJSON(Map<String, dynamic> json) {
    name = json['name'];
    idCard = json['idCard'];
    phoneNumber = json['phoneNumber'];
    email = json['email'];
    bikes = [];
  }

  static Map<String, dynamic> toJSON(BikeOwner owner) {
    return {
      'name': owner.name,
      'idCard': owner.idCard,
      'phoneNumber': owner.phoneNumber,
      'email': owner.email,
    };
  }
}
