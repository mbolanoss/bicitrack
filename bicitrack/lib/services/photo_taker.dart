import 'dart:typed_data';

import 'package:image_picker/image_picker.dart';

class PhotoTaker {
  Future<Uint8List?> takePhoto() async {
    final ImagePicker photoPicker = ImagePicker();

    XFile? photoFile = await photoPicker.pickImage(source: ImageSource.camera);

    if (photoFile != null) {
      return await photoFile.readAsBytes();
    }
    // No se tomo una foto
    return null;
  }
}
