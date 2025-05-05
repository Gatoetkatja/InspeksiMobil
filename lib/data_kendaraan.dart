import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pelatihan_kosong/kelengkapan.dart';
import '../main.dart';

class DataKendaraan extends StatefulWidget {
  const DataKendaraan({super.key});

  @override
  State<DataKendaraan> createState() => _DataKendaraanState();
}

class _DataKendaraanState extends State<DataKendaraan> {
  final TextEditingController _merkController = TextEditingController();
  final TextEditingController _tipeController = TextEditingController();
  final TextEditingController _tahunController = TextEditingController();
  final TextEditingController _transmisiController = TextEditingController();
  final TextEditingController _warnaController = TextEditingController();
  final TextEditingController _odometerController = TextEditingController();
  final TextEditingController _kepemilikanController = TextEditingController();
  final TextEditingController _platController = TextEditingController();
  final TextEditingController _biayaPajakController = TextEditingController();
  DateTime? _pajak1TahunDate;
  DateTime? _pajak5TahunDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "2/9",
                  style: TextStyle(color: Colors.orange, fontSize: 28),
                ),
                SizedBox(height: 10),
                Text(
                  "Data Kendaraan",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                ),
                SizedBox(height: 20),

                // Merk Kendaraan
                kotak(
                  _merkController,
                  hint: "Masukkan merk kendaraan",
                  label: "Merk Kendaraan",
                ),

                // Tipe Kendaraan
                kotak(
                  _tipeController,
                  hint: "Masukkan tipe kendaraan",
                  label: "Tipe Kendaraan",
                ),

                // Tahun Kendaraan
                kotak(
                  _tahunController,
                  hint: "Masukkan tahun kendaraan",
                  label: "Tahun Kendaraan",
                ),

                // Transmisi
                kotak(
                  _transmisiController,
                  hint: "Masukkan transmisi kendaraan",
                  label: "Transmisi",
                ),

                //Warna Kendaraan
                kotak(
                  _warnaController,
                  hint: "Masukkan warna kendaraan",
                  label: "Warna Kendaraan",
                ),

                // Odometer
                kotak(
                  _odometerController,
                  hint: "Masukkan odometer kendaraan",
                  label: "Odometer",
                ),

                //Kepemilikan
                kotak(
                  _kepemilikanController,
                  hint: "Masukkan kepemilikan kendaraan",
                  label: "Kepemilikan",
                ),

                //Plat Nomor
                kotak(
                  _platController,
                  hint: "Masukkan plat nomor kendaraan",
                  label: "Plat Nomor",
                ),

                Text("Pajak 1 Tahun s.d."),
                SizedBox(height: 6),
                GestureDetector(
                  onTap: _pickDatePajak1Tahun,
                  child: AbsorbPointer(
                    child: TextField(
                      decoration: _inputDecoration2(
                        _pajak1TahunDate != null
                            ? DateFormat('dd/MM/yyyy').format(_pajak1TahunDate!)
                            : "Pilih tanggal",
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16),

                Text("Pajak 5 Tahun s.d."),
                SizedBox(height: 6),
                GestureDetector(
                  onTap: _pickDatePajak5Tahun,
                  child: AbsorbPointer(
                    child: TextField(
                      decoration: _inputDecoration2(
                        _pajak5TahunDate != null
                            ? DateFormat('dd/MM/yyyy').format(_pajak5TahunDate!)
                            : "Pilih tanggal",
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16),

                kotak(
                  _biayaPajakController,
                  hint: 'Masukkan Biaya Pajak',
                  label: 'Biaya Pajak',
                ),
                SizedBox(height: 30),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: ElevatedButton(onPressed: () {Navigator.pop(context);}, style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    padding: EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ), child: Text("Back", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => KelengkapanPage()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          padding: EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        ),
                        child: Text("Next", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ],
                ),
                Center(
                child: Text(
                  "copyright by Inspeksi Mobil Jogja",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration _inputDecoration2(String hintText) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(color: Colors.black),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.purple),
        borderRadius: BorderRadius.circular(10),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.purple),
        borderRadius: BorderRadius.circular(10),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      suffixIcon: Icon(Icons.arrow_drop_down, color: Colors.purple),
    );
  }

  void _pickDatePajak1Tahun() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _pajak1TahunDate ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        _pajak1TahunDate = picked;
      });
    }
  }

  void _pickDatePajak5Tahun() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _pajak5TahunDate ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        _pajak5TahunDate = picked;
      });
    }
  }
}
