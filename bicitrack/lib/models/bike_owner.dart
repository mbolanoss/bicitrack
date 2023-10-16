class BikeOwner {
  String? name;
  int? idCard;
  int? phoneNumber;
  String? email;

  BikeOwner({
    required this.name,
    required this.idCard,
    required this.phoneNumber,
    required this.email,
  });

  BikeOwner.fromJSON(Map<String, dynamic> json) {
    name = json['name'];
    idCard = json['idCard'];
    phoneNumber = json['phoneNumber'];
    email = json['email'];
  }

  Map<String, dynamic> toJSON() {
    return {
      'name': name,
      'idCard': idCard,
      'phoneNumber': phoneNumber,
      'email': email,
    };
  }
}
