import 'package:bicitrack/models/InNOut.dart';
import 'package:bicitrack/models/bike_owner.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../models/bike.dart';

class BikeOwnerAndBike {
  BikeOwner bikeOwner;
  Bike bike;

  BikeOwnerAndBike(this.bikeOwner, this.bike);
}

class BikeService {
  final _storage = FirebaseStorage.instance;
  final _firestore = FirebaseFirestore.instance;

  Future<Bike> getBikeBySerialNumber(String serialNumber) async {
    final bikesThatMatchSerialNumberRaw = await _firestore
        .collection('bikes')
        .where('serialNumber', isEqualTo: serialNumber)
        .get();

    if (bikesThatMatchSerialNumberRaw.size == 0) throw Exception('Bike not found!');

    return Bike.fromJSON(bikesThatMatchSerialNumberRaw.docs[0].data());
  }

  Future<BikeOwnerAndBike> getBikeAndOwnerBySerialNumber(String serialNumber) async {
    final bike = await getBikeBySerialNumber(serialNumber);

    final bikeOwnersThatMatchSerialNumberRaw = await _firestore
      .collection('bike_owners')
      .where('idCard', isEqualTo: bike.ownerIdCard)
      .get();

    if (bikeOwnersThatMatchSerialNumberRaw.size == 0) throw Exception('Bike owner not found!');

    final bikeOwner = BikeOwner.fromJSON(bikeOwnersThatMatchSerialNumberRaw.docs[0].data());

    return BikeOwnerAndBike(bikeOwner, bike);
  }

  Future<void> updateBike(BikeOwner bikeOwner) async {
    final bikeOwnersThatMatchIdCardRaw = await _firestore
      .collection('bike_owners')
      .where('idCard', isEqualTo: bikeOwner.idCard)
      .get();

    if (bikeOwnersThatMatchIdCardRaw.size == 0) throw Exception('Bike owner not found!');

    await bikeOwnersThatMatchIdCardRaw.docs[0].reference.update(bikeOwner.toJSON());
  }

  Future<bool> checkBikeExistsBySerialNumber(String serialNumber) async {
    final bikesThatMatchSerialNumber = await _firestore
        .collection('bikes')
        .where('serialNumber', isEqualTo: serialNumber)
        .get();

    return bikesThatMatchSerialNumber.size == 1;
  }

  Future<void> deleteBike(String serialNumber) async{
    final bikesThatMatchSerialNumberRaw = await _firestore
        .collection('bikes')
        .where('serialNumber', isEqualTo: serialNumber)
        .get();

    bikesThatMatchSerialNumberRaw.docs.forEach((doc) {
      doc.reference.delete();
    });
  }
  
  Future<Iterable<InNOut>> getAllInNOuts() async {
    final allInNOuts = await _firestore
        .collection('in_n_out')
        .get();

    return allInNOuts.docs.map((e) => InNOut.fromJSON(e.data()));
  }
}
