import 'package:flutter/material.dart';
import 'package:frontdesk_kliniku/color.dart';
import 'package:frontdesk_kliniku/components/reuse.dart';

class JadwalDokter extends StatefulWidget {
  const JadwalDokter({Key? key}) : super(key: key);

  @override
  State<JadwalDokter> createState() => _JadwalDokterState();
}

class _JadwalDokterState extends State<JadwalDokter> {
  List<Dokter> _dokter = [
    Dokter('Dr. Asep', 'Spesialis Anak', 'Senin, 10-12', '08.00-12.00',
        '0812121212'),
    Dokter('Dr. joni', 'Spesialis jantung', 'Senin, 10-12', '08.00-12.00',
        '0812121212'),
    Dokter('Dr. shin', 'Spesialis jantung', 'Senin, 10-12', '08.00-12.00',
        '0812121212'),
  ];

  List<Dokter> _foundDokter = [];
  void initState() {
    super.initState();
    setState(() {
      _foundDokter = _dokter;
    });
  }

  onSearch(String value) {
    print(value);
    setState(() {
      _foundDokter = _dokter
          .where((dokter) =>
              dokter.nama.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      appBar: AppBar(
        backgroundColor: secondaryColor,
        elevation: 0, //menghilangkan shadow pada elevation
        title: Container(
          height: 38,
          child: TextField(
            onChanged: (value) => onSearch(value),
            decoration: InputDecoration(
              filled: true,
              fillColor: primaryColor,
              contentPadding: EdgeInsets.all(0),
              prefixIcon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none,
              ),
              hintStyle: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
              hintText: 'cari dokter',
            ),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(right: 20, left: 20),
        child: ListView.builder(
          itemCount: _foundDokter.length,
          itemBuilder: (context, index) {
            return DokterComponent(dokter: _foundDokter[index]);
          },
        ),
      ),
    );
  }
}

DokterComponent({required Dokter dokter}) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.white60,
    ),
    margin: EdgeInsets.only(bottom: 20),
    padding: EdgeInsets.only(top: 10, bottom: 10, left: 20),
    child: Row(
      children: [
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  dokter.nama,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  dokter.spesialis,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  dokter.tanggal,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  dokter.jam,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  dokter.kontak,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 90),
          child: ElevatedButton(
            onPressed: () {},
            child: Text(
              'delete',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w200,
              ),
            ),
            style: ButtonStyle(
              overlayColor: MaterialStateProperty.all(Colors.red[900]),
              foregroundColor: MaterialStateProperty.all(Colors.white),
              backgroundColor: MaterialStateProperty.all(Colors.red[400]),
              minimumSize: MaterialStateProperty.all(const Size(30, 20)),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
