import 'package:flutter/cupertino.dart';

import 'package:jarnama_app/add_product/page/add_product.dart';

class DataTimeservice {
  static Future<void> showeDataTimePicker(
      BuildContext context, void Function(DateTime) onchanged) {
    return showCupertinoModalPopup<DateTime>(
      context: context,
      builder: (
        BuildContext builder,
      ) =>
          Container(
        height: MediaQuery.of(context).copyWith().size.height * 0.25,
        color: Colors.white,
        child: CupertinoDatePicker(
          maximumDate: DateTime(2025),
          mode: CupertinoDatePickerMode.date,
          onDateTimeChanged: onchanged,
          // (value) {
          //   _dateTime.text = DateFormat(
          //     'd MMM,y',
          //   ).format(value);
          //   //_dateTime.text = value.toString();
          // },
          initialDateTime: DateTime.now(),
          minimumYear: 2000,
          maximumYear: 3000,
        ),
      ),
    );
  }
}
