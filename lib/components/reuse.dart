import 'package:flutter/material.dart';
import 'package:frontdesk_kliniku/color.dart';

class Dokter {
  final String nama;
  final String spesialis;
  final String tanggal;
  final String jam;
  final String kontak;

  Dokter(this.nama, this.spesialis, this.tanggal, this.jam, this.kontak);
}

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
      labelText: label,
      contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );
}
