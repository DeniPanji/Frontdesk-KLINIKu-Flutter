import 'package:flutter/material.dart';
import 'package:frontdesk_kliniku/color.dart';

TextFormField formTextField(
  String label,
  TextEditingController controller,
) {
  return TextFormField(
    autofocus: false,
    controller: controller,
    // validator: (){},
    onSaved: (value) {
      controller.text = value!;
    },
    textInputAction: TextInputAction.next,
    decoration: InputDecoration(
      contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );
}
