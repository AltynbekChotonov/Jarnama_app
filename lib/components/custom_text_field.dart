import 'package:jarnama_app/add_product/page/add_product.dart';

class CustomtextField extends StatelessWidget {
  const CustomtextField({
    Key? key,
    this.hinText,
    this.controller,
    this.maxLines,
    this.onTap,
    this.focusNode,
    this.prefixIcon,
    this.suffixIcon,
  }) : super(key: key);

  final String? hinText;
  final TextEditingController? controller;
  final int? maxLines;
  final void Function()? onTap;
  final FocusNode? focusNode;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      focusNode: focusNode,
      onTap: onTap,
      decoration: InputDecoration(
          label: Text(hinText ?? ''),
          hintText: hinText,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          )),
    );
  }
}
