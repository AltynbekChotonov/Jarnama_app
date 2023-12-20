// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'add_product.dart';

class AddProductPage extends StatelessWidget {
  AddProductPage({super.key});

  final _Title = TextEditingController();
  final _description = TextEditingController();
  final _dateTime = TextEditingController();
  final _phoneNumber = TextEditingController();
  final _userName = TextEditingController();
  final _addess = TextEditingController();
  final _prise = TextEditingController();

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
          CustomtextField(controller: _description, hinText: 'description'),
          CustomtextField(controller: _dateTime, hinText: 'dateTime'),
          CustomtextField(controller: _phoneNumber, hinText: 'phoneNumber'),
          CustomtextField(controller: _userName, hinText: 'userName'),
          CustomtextField(controller: _addess, hinText: 'address'),
          CustomtextField(controller: _prise, hinText: 'pris'),
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.publish),
            label: const Text('Add Firestore'),
          ),
        ],
      ),
    );
  }
}

class CustomtextField extends StatelessWidget {
  const CustomtextField({
    Key? key,
    this.hinText,
    this.controller,
    this.maxLines,
    this.onTap,
  }) : super(key: key);

  final String? hinText;
  final TextEditingController? controller;
  final int? maxLines;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      onTap: onTap,
      decoration: InputDecoration(
          hintText: hinText,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          )),
    );
  }
}
