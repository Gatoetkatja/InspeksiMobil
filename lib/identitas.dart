import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../main.dart';
import '../data_kendaraan.dart';

class IdentitasPage extends StatefulWidget {
  @override
  _IdentitasPageState createState() => _IdentitasPageState();
}

class _IdentitasPageState extends State<IdentitasPage> {
  final TextEditingController _inspektorController = TextEditingController();
  final TextEditingController _costumerController = TextEditingController();
  final TextEditingController _cabangController = TextEditingController();
  DateTime? _selectedDate;

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
              Text("1/9", style: TextStyle(color: Colors.orange, fontSize: 28)),
              SizedBox(height: 10),
              Text("Identitas", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28)),
              SizedBox(height: 20),

              // Nama Inspektor
              kotak(_inspektorController, hint: "Masukkan nama inspektor", label: "Nama Inspektor"),

              // Nama Costumer
              kotak(_costumerController, hint: "Masukkan nama costumer", label: "Nama Costumer"),

              // Cabang Inspeksi
              kotak(_cabangController, hint: "Masukkan cabang inspeksi", label: "Cabang Inspeksi"),

              // Tanggal Inspeksi
              Text("Tanggal Inspeksi"),
              SizedBox(height: 6),
              GestureDetector(
                onTap: _pickDate,
                child: AbsorbPointer(
                  child: TextField(
                    decoration: _inputDecoration2(
                      _selectedDate != null
                          ? DateFormat('dd/MM/yyyy').format(_selectedDate!)
                          : "Pilih tanggal",
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),

              // Tombol Next
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DataKendaraan()),
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
              SizedBox(height: 24),

              // Copyright
              Center(
                child: Text(
                  "copyright by Inspeksi Mobil Jogja",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ),
            ],
          )
          ) ,
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

  void _pickDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }
}
