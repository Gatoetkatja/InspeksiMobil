import 'package:flutter/material.dart';
import '../main.dart';

class HasilInspeksiPage extends StatefulWidget {
  const HasilInspeksiPage({super.key});

  @override
  State<HasilInspeksiPage> createState() => _HasilInspeksiPageState();
}

class _HasilInspeksiPageState extends State<HasilInspeksiPage> {
  Map<String, int> rating = {
    "Interior": 1,
    "Eksterior": 1,
    "Kaki-kaki": 1,
    "Mesin": 1,
    "Keseluruhan": 1,
  };

  Map<String, String> toggleStates = {
    "Tabrakan": "Tidak ada",
    "Banjir": "Terdeteksi",
    "Odometer": "Tidak ada",
  };

  final posisiBanController = TextEditingController();
  final merkController = TextEditingController();
  final velgController = TextEditingController();
  final ketebalanController = TextEditingController();

  List<Map<String, TextEditingController>> estimasiPerbaikan = [
    {
      "judul": TextEditingController(text: "Tie Rod Kanan Kiri"),
      "harga": TextEditingController(text: "700.000")
    },
    {
      "judul": TextEditingController(text: "Spooring"),
      "harga": TextEditingController(text: "500.000")
    }
  ];

  void tambahPerbaikan() {
    setState(() {
      estimasiPerbaikan.add({
        "judul": TextEditingController(),
        "harga": TextEditingController()
      });
    });
  }

  void hapusPerbaikan(int index) {
    setState(() {
      estimasiPerbaikan.removeAt(index);
    });
  }

  Widget buildRatingBar(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        Row(
          children: List.generate(10, (index) {
            int val = index + 1;
            bool selected = rating[title] == val;
            return GestureDetector(
              onTap: () {
                setState(() {
                  rating[title] = val;
                });
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 2),
                width: 28,
                height: 28,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: selected ? Color(0xFF00BFFF) : Colors.transparent,
                  border: Border.all(color: Color(0xFF00BFFF)),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  "$val",
                  style: TextStyle(
                    color: selected ? Colors.white : Colors.black,
                    fontSize: 12,
                  ),
                ),
              ),
            );
          }),
        ),
        const SizedBox(height: 6),
        TextField(
          maxLines: 3,
          decoration: InputDecoration(
            hintText: "Keterangan $title",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Color(0xFF00BFFF), width: 1),
            ),
          ),
        ),
        const SizedBox(height: 12),
      ],
    );
  }

  Widget buildToggle(String label, String key) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label),
        Container(
          height: 36,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: toggleStates[key] == "Terdeteksi"
                  ? Color(0xFFFF7BAC)
                  : Color(0xFF00BFFF),
            ),
          ),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    toggleStates[key] = "Tidak ada";
                  });
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: toggleStates[key] == "Tidak ada"
                        ? Color(0xFF00BFFF)
                        : Colors.transparent,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      bottomLeft: Radius.circular(8),
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "Tidak ada",
                    style: TextStyle(
                      color: toggleStates[key] == "Tidak ada"
                          ? Colors.white
                          : Colors.grey,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    toggleStates[key] = "Terdeteksi";
                  });
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: toggleStates[key] == "Terdeteksi"
                        ? Color(0xFFFF7BAC)
                        : Colors.transparent,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "Terdeteksi",
                    style: TextStyle(
                      color: toggleStates[key] == "Terdeteksi"
                          ? Colors.white
                          : Colors.grey,
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget buildPerbaikanItem(int index) {
    final item = estimasiPerbaikan[index];
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Color(0xFFF5ECFF),
        border: Border.all(color: Color(0xFFB88AFF)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: item["judul"],
              decoration: const InputDecoration(
                hintText: 'Tipe Perbaikan',
                border: InputBorder.none,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: item["harga"],
              decoration: const InputDecoration(
                hintText: 'Masukkan harga',
                border: InputBorder.none,
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          GestureDetector(
            onTap: () => hapusPerbaikan(index),
            child: const Icon(Icons.close, color: Color(0xFFB88AFF)),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("4/9", style: TextStyle(color: Colors.orange, fontSize: 18)),
              const SizedBox(height: 8),
              const Text("Hasil Inspeksi", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),

              const SizedBox(height: 16),
              buildRatingBar("Interior"),
              buildRatingBar("Eksterior"),
              buildRatingBar("Kaki-kaki"),
              buildRatingBar("Mesin"),
              buildRatingBar("Keseluruhan"),

              buildToggle("Indikasi Tabrakan", "Tabrakan"),
              const SizedBox(height: 12),
              buildToggle("Indikasi Banjir", "Banjir"),
              const SizedBox(height: 12),
              buildToggle("Indikasi Odometer Reset", "Odometer"),
              const SizedBox(height: 12),

              kotak(posisiBanController, hint: "Posisi Ban", label: "Posisi Ban"),
              kotak(merkController, hint: "Merk Ban", label: "Merk Ban"),
              kotak(velgController, hint: "Merk Velg", label: "Merk Velg"),
              kotak(ketebalanController, hint: "Ketebalan Ban", label: "Ketebalan Ban"),
              

              const SizedBox(height: 20),
              const Text("Estimasi Perbaikan", style: TextStyle(fontWeight: FontWeight.bold)),
              ...List.generate(estimasiPerbaikan.length, (i) => buildPerbaikanItem(i)),

              const SizedBox(height: 8),
              GestureDetector(
                onTap: tambahPerbaikan,
                child: Row(
                  children: const [
                    Icon(Icons.add, color: Color(0xFFB88AFF)),
                    SizedBox(width: 4),
                    Text(
                      "Tambah List",
                      style: TextStyle(
                        color: Color(0xFFB88AFF),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Back"),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                      ),
                      onPressed: () {},
                      child: const Text("Next"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
