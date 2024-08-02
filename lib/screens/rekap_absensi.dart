import 'package:flutter/material.dart';

class RekapAbsensiPage extends StatefulWidget {
  @override
  _RekapAbsensiPageState createState() => _RekapAbsensiPageState();
}

class _RekapAbsensiPageState extends State<RekapAbsensiPage> {
  String selectedTahunAjaran = '2022/2023';
  String selectedSemester = 'Ganjil';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Aksi untuk kembali ke halaman sebelumnya
          },
        ),
        title: Text('Rekap Absensi'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                DropdownButton<String>(
                  value: selectedTahunAjaran,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedTahunAjaran = newValue!;
                    });
                  },
                  items: <String>['2022/2023', '2021/2022', '2020/2021']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                DropdownButton<String>(
                  value: selectedSemester,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedSemester = newValue!;
                    });
                  },
                  items: <String>['Ganjil', 'Genap']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columnSpacing: 16, // Tambahkan spasi antar kolom
                  columns: <DataColumn>[
                    DataColumn(
                      label: Text('Hari'),
                      // Tambahkan border pada kolom
                      tooltip: 'Hari',
                    ),
                    DataColumn(
                      label: Text('1'),
                      // Tambahkan border pada kolom
                      tooltip: 'Column 1',
                    ),
                    DataColumn(
                      label: Text('2'),
                      // Tambahkan border pada kolom
                      tooltip: 'Column 2',
                    ),
                    DataColumn(
                      label: Text('3'),
                      // Tambahkan border pada kolom
                      tooltip: 'Column 3',
                    ),
                    DataColumn(
                      label: Text('4'),
                      // Tambahkan border pada kolom
                      tooltip: 'Column 4',
                    ),
                    DataColumn(
                      label: Text('5'),
                      // Tambahkan border pada kolom
                      tooltip: 'Column 5',
                    ),
                    DataColumn(
                      label: Text('6'),
                      // Tambahkan border pada kolom
                      tooltip: 'Column 6',
                    ),
                    DataColumn(
                      label: Text('7/UTS'),
                      // Tambahkan border pada kolom
                      tooltip: 'Column 7/UTS',
                    ),
                    DataColumn(
                      label: Text('8'),
                      // Tambahkan border pada kolom
                      tooltip: 'Column 8',
                    ),
                    DataColumn(
                      label: Text('9'),
                      // Tambahkan border pada kolom
                      tooltip: 'Column 9',
                    ),
                    DataColumn(
                      label: Text('10'),
                      // Tambahkan border pada kolom
                      tooltip: 'Column 10',
                    ),
                    DataColumn(
                      label: Text('11'),
                      // Tambahkan border pada kolom
                      tooltip: 'Column 11',
                    ),
                    DataColumn(
                      label: Text('12'),
                      // Tambahkan border pada kolom
                      tooltip: 'Column 12',
                    ),
                    DataColumn(
                      label: Text('13'),
                      // Tambahkan border pada kolom
                      tooltip: 'Column 13',
                    ),
                    DataColumn(
                      label: Text('14/UAS'),
                      // Tambahkan border pada kolom
                      tooltip: 'Column 14/UAS',
                    ),
                    DataColumn(
                      label: Text('15'),
                      // Tambahkan border pada kolom
                      tooltip: 'Column 15',
                    ),
                    DataColumn(
                      label: Text('16'),
                      // Tambahkan border pada kolom
                      tooltip: 'Column 16',
                    ),
                  ],
                  rows: List<DataRow>.generate(
                    6, // Diganti menjadi 6 untuk nama hari Senin - Sabtu
                        (index) => DataRow(
                      cells: <DataCell>[
                        DataCell(Text(getHari(index))), // Mengambil nama hari
                        DataCell(Text('0')),
                        DataCell(Text('0')),
                        DataCell(Text('0')),
                        DataCell(Text('0')),
                        DataCell(Text('0')),
                        DataCell(Text('0')),
                        DataCell(Text('0')),
                        DataCell(Text('0')),
                        DataCell(Text('0')),
                        DataCell(Text('0')),
                        DataCell(Text('0')),
                        DataCell(Text('0')),
                        DataCell(Text('0')),
                        DataCell(Text('0')),
                        DataCell(Text('0')),
                        DataCell(Text('0')),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String getHari(int index) {
    // Fungsi untuk mendapatkan nama hari sesuai dengan index
    switch (index) {
      case 0:
        return 'Senin';
      case 1:
        return 'Selasa';
      case 2:
        return 'Rabu';
      case 3:
        return 'Kamis';
      case 4:
        return 'Jumat';
      case 5:
        return 'Sabtu';
      default:
        return '';
    }
  }
}
