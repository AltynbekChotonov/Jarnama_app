// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import 'package:jarnama_app/components/custom_text_field.dart';
import 'package:jarnama_app/service/data_time_service.dart';
import 'package:jarnama_app/service/image_picker_service.dart';

import 'add_product.dart';

// ignore: must_be_immutable
class AddProductPage extends StatelessWidget {
  AddProductPage({super.key});

  // ignore: non_constant_identifier_names
  final _Title = TextEditingController();
  final _description = TextEditingController();
  final _dateTime = TextEditingController();
  final _phoneNumber = TextEditingController();
  final _userName = TextEditingController();
  final _addess = TextEditingController();
  final _prise = TextEditingController();
  List<XFile> images = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('AddProductPage'),
      ),
      body: ListView(
          padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
          children: [
            CustomtextField(
              controller: _Title,
              hinText: 'Title',
            ),
            const SizedBox(height: 12),
            CustomtextField(
                maxLines: 5, controller: _description, hinText: 'description'),
            const SizedBox(height: 12),
            imageContainer(
              images: images,
              onPicked: (value) => images = value,
            ),
            const SizedBox(height: 12),
            CustomtextField(
                controller: _dateTime,
                hinText: 'dateTime',
                focusNode: FocusNode(),
                prefixIcon: const Icon(Icons.calendar_month),
                onTap: () async {
                  await DataTimeservice.showeDataTimePicker(
                    context,
                    (value) => _dateTime.text = DateFormat(
                      'd MMM,y',
                    ).format(value),
                  );
                }),
            CustomtextField(controller: _phoneNumber, hinText: 'phoneNumber'),
            const SizedBox(height: 12),
            CustomtextField(controller: _userName, hinText: 'userName'),
            const SizedBox(height: 12),
            CustomtextField(controller: _addess, hinText: 'address'),
            const SizedBox(height: 12),
            CustomtextField(controller: _prise, hinText: 'pris'),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.publish),
              label: const Text('Add Firestore'),
            ),
          ]),
    );
  }
}

// ignore: must_be_immutable
class imageContainer extends StatefulWidget {
  imageContainer({
    Key? key,
    required this.images,
    required this.onPicked,
  }) : super(key: key);

  List<XFile> images;
  final void Function(List<XFile> images) onPicked;

  @override
  State<imageContainer> createState() => _imageContainerState();
}

class _imageContainerState extends State<imageContainer> {
  final service = ImagePickerService();

  @override
  Widget build(BuildContext context) {
    print('----->');
    return Container(
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(20),
      ),
      child: widget.images.isNotEmpty
          ? Wrap(
              children: widget.images
                  .map((e) => Expanded(child: Image.file(File(e.path))))
                  .toList(),
            )
          : Center(
              child: IconButton(
                icon: const Icon(
                  Icons.camera_enhance,
                  size: 50,
                ),
                onPressed: () async {
                  final value = await service.pickImages();
                  if (value != null) {
                    widget.onPicked(value);
                    widget.images = value;
                    setState(() {});
                  }
                },
              ),
            ),
    );
  }
}
