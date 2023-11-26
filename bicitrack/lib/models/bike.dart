class Bike {
  String? serialNumber;
  int? ownerIdCard;

  Bike({
    required this.serialNumber,
  });

  Bike.fromJSON(Map<String, dynamic> json) {
    serialNumber = json['serialNumber'];
    ownerIdCard = json['ownerIdCard'];
  }

  Map<String, dynamic> toJSON(int ownerId) {
    return {
      'serialNumber': serialNumber,
      'ownerIdCard': ownerId,
    };
  }
}
