class Bike {
  String? serialNumber;

  Bike({
    required this.serialNumber,
  });

  Bike.fromJSON(Map<String, dynamic> json) {
    serialNumber = json['serialNumber'];
  }

  static Map<String, dynamic> toJSON(Bike bike) {
    return {
      'serialNumber': bike.serialNumber,
    };
  }
}
