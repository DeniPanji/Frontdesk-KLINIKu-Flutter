import 'package:flutter/material.dart';
import 'package:frontdesk_kliniku/color.dart';
import 'package:frontdesk_kliniku/components/JadwalDokter.dart';
import 'package:frontdesk_kliniku/components/ListPasien.dart';
import 'package:frontdesk_kliniku/components/reuse.dart';

class InputJadwalDokter extends StatefulWidget {
  const InputJadwalDokter({Key? key}) : super(key: key);

  @override
  State<InputJadwalDokter> createState() => Input_JadwalDokterState();
}

class Input_JadwalDokterState extends State<InputJadwalDokter> {
  final _formKey = GlobalKey<FormState>();

  //controller
  final _nameController = new TextEditingController();
  final _spesialisController = new TextEditingController();
  final _tglKerja = new TextEditingController();
  final _jamKerja = new TextEditingController();
  final _kontak = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final submitBtn = ElevatedButton(
      onPressed: () {},
      child: Text(
        'Submit',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w400,
        ),
      ),
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all(darkerColor),
        backgroundColor: MaterialStateProperty.all(primaryColor),
        foregroundColor: MaterialStateProperty.all(Colors.white),
        minimumSize: MaterialStateProperty.all(const Size(200, 40)),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );

    final cancleBtn = ElevatedButton(
      onPressed: () {},
      child: Text(
        'Cancel',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w400,
        ),
      ),
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all(Colors.red[900]),
        foregroundColor: MaterialStateProperty.all(Colors.white),
        backgroundColor: MaterialStateProperty.all(Colors.red[400]),
        minimumSize: MaterialStateProperty.all(const Size(200, 40)),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );

    final listJadwalBtn = ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => JadwalDokter()),
        );
      },
      child: Text(
        'Jadwal Dokter',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w400,
        ),
      ),
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all(Colors.blue[800]),
        backgroundColor: MaterialStateProperty.all(Colors.blue),
        foregroundColor: MaterialStateProperty.all(Colors.white),
        minimumSize: MaterialStateProperty.all(const Size(200, 40)),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );

    final pasienBtn = ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ListPasien()),
        );
      },
      child: Text(
        'Jadwal Pasien',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w400,
        ),
      ),
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all(Colors.blue[800]),
        backgroundColor: MaterialStateProperty.all(Colors.blue),
        foregroundColor: MaterialStateProperty.all(Colors.white),
        minimumSize: MaterialStateProperty.all(const Size(200, 40)),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: secondaryColor,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(36),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    Text(
                      "Input Jadwal Dokter",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 6, 59, 8),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Silahkan Input Jadwal Dokter Dibawah Ini",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 6, 59, 8),
                      ),
                    ),
                    SizedBox(height: 20),
                    formTextField("Nama", _nameController),
                    SizedBox(height: 20),
                    formTextField("Spesialis", _spesialisController),
                    SizedBox(height: 20),
                    formTextField("Tanggal Kerja", _tglKerja),
                    SizedBox(height: 20),
                    formTextField("Jam Kerja", _jamKerja),
                    SizedBox(height: 20),
                    formTextField("Kontak", _kontak),
                    SizedBox(height: 20),
                    submitBtn,
                    SizedBox(height: 10),
                    cancleBtn,
                    SizedBox(height: 10),
                    listJadwalBtn,
                    SizedBox(height: 10),
                    pasienBtn,
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
