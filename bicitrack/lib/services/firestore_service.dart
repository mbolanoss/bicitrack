import 'package:bicitrack/models/bike_owner.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

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
}
