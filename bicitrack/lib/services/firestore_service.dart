import 'dart:typed_data';

import 'package:bicitrack/models/bike_owner.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../models/bike.dart';

class FirestoreService {
  final _storage = FirebaseStorage.instance;
  final _firestore = FirebaseFirestore.instance;

  Future<List<BikeOwner>> getAllBikeOwners() async {
    final ownersList = List<BikeOwner>.empty(growable: true);
    final ownersRaw = await _firestore.collection('bike_owners').get();

    ownersRaw.docs.forEach((owner) {
      ownersList.add(BikeOwner.fromJSON(owner.data()));
    });

    return ownersList;
  }

  Future<void> registerOwnerAndBike(BikeOwner owner, Bike bike) async {
    final ownerJSON = owner.toJSON();
    await _firestore.collection('bike_owners').add(ownerJSON);

    final bikeJSON = bike.toJSON(owner.idCard!);
    await _firestore.collection('bikes').add(bikeJSON);
  }

  Future<void> registerBike(BikeOwner owner, Bike bike) async {
    final bikeJSON = bike.toJSON(owner.idCard!);
    await _firestore.collection('bikes').add(bikeJSON);
  }

  Future<bool> checkOwnerExists(int ownerId) async {
    final ownerResult = await _firestore
        .collection('bike_owners')
        .where('idCard', isEqualTo: ownerId)
        .get();

    return ownerResult.size == 1;
  }

  Future<void> uploadPhoto({
    required Uint8List file,
    required String folder,
    required String name,
  }) async {
    final ref = _storage.ref().child(folder).child(name);
    await ref.putData(file);
  }

  Future<Uint8List?> downloadPhoto({
    required String folder,
    required String name,
  }) async {
    final ref = _storage.ref().child(folder).child(name);
    return await ref.getData();
  }
}
