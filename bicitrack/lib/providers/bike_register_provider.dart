import 'dart:typed_data';

import 'package:flutter/material.dart';

class BikeRegisterProvider with ChangeNotifier {
  Uint8List? ownerPhotoFile;
  Uint8List? bikePhotoFile;

  BikeRegisterProvider({this.ownerPhotoFile, this.bikePhotoFile});

  void changeOwnerPhoto(Uint8List newPhoto) {
    ownerPhotoFile = newPhoto;
    notifyListeners();
  }

  void changeBikePhoto(Uint8List newPhoto) {
    bikePhotoFile = newPhoto;
    notifyListeners();
  }

  void resetOwnerPhoto() {
    ownerPhotoFile = null;
    notifyListeners();
  }

  void resetBikePhoto() {
    bikePhotoFile = null;
    notifyListeners();
  }
}
