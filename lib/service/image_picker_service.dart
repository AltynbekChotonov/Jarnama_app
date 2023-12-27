import 'package:image_picker/image_picker.dart';

class ImagePickerService {
  final ImagePicker _picker = ImagePicker();

  Future<List<XFile>?> pickImages() async {
    final images = await _picker.pickMultiImage(imageQuality: 3);
    return images;
  }
}
