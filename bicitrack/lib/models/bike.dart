class Bike {
  String? serialNumber;

  Bike({
    required this.serialNumber,
  });

  Bike.fromJSON(Map<String, dynamic> json) {
    serialNumber = json['serialNumber'];
  }

  Map<String, dynamic> toJSON(int ownerId) {
    return {
      'serialNumber': serialNumber,
      'ownerIdCard': ownerId,
    };
  }
}
