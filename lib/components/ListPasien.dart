import 'package:flutter/material.dart';
import 'package:frontdesk_kliniku/color.dart';
import 'package:frontdesk_kliniku/components/reuse.dart';

class ListPasien extends StatefulWidget {
  const ListPasien({Key? key}) : super(key: key);

  @override
  State<ListPasien> createState() => _ListPasienState();
}

class _ListPasienState extends State<ListPasien> {
  List<Pasien> _pasien = [
    Pasien('jojo', 'senin, 10-12', '08.00-12.00', 'selesai', true),
    Pasien('joni', 'senin, 10-12', '08.00-12.00', 'panding', false),
    Pasien('jono', 'senin, 10-12', '08.00-12.00', 'panding', false),
    Pasien('jimi', 'senin, 10-12', '08.00-12.00', 'panding', false),
  ];

  List<Pasien> _foundPasien = [];
  void initState() {
    super.initState();
    setState(() {
      _foundPasien = _pasien;
    });
  }

  onSearch(String value) {
    print(value);
    setState(() {
      _foundPasien = _pasien
          .where((pasien) =>
              pasien.nama.toLowerCase().contains(value.toLowerCase()))
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
          itemCount: _foundPasien.length,
          itemBuilder: (context, index) {
            return PasienComponent(pasien: _foundPasien[index]);
          },
        ),
      ),
    );
  }
}

PasienComponent({required Pasien pasien}) {
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
                  pasien.nama,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  pasien.tanggal,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  pasien.jam,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  pasien.status,
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
          padding: const EdgeInsets.only(left: 50),
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.red,
            ),
            child: IconButton(
              icon: Icon(
                Icons.delete,
              ),
              onPressed: () {
                print("click");
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.yellow,
            ),
            child: IconButton(
              icon: Icon(Icons.add_alert),
              onPressed: () {
                print("click");
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.green,
            ),
            child: IconButton(
              icon: Icon(Icons.check),
              onPressed: () {
                print("click");
              },
            ),
          ),
        ),
      ],
    ),
  );
}
