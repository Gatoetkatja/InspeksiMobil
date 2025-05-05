import 'package:flutter/material.dart';
import 'package:pelatihan_kosong/inspeksi.dart';

class KelengkapanPage extends StatefulWidget {
  @override
  _KelengkapanPageState createState() => _KelengkapanPageState();
}

class _KelengkapanPageState extends State<KelengkapanPage> {
  final Map<String, bool?> items = {
    'Buku Service': null,
    'Kunci Serep': null,
    'Buku Manual': null,
    'Ban Serep': null,
    'BPKB': null,
    'Dongkrak': null,
    'Toolkit': null,
    'No Rangka': null,
    'No Mesin': null,
  };

  Widget buildToggle(String label) {
    final isActive = items[label];
    final activeColor = isActive == true
        ? Colors.lightBlue
        : isActive == false
            ? Colors.pinkAccent
            : Colors.grey.shade300;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
        const SizedBox(height: 4),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: activeColor),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Row(
            children: [
              // Lengkap
              Expanded(
                child: GestureDetector(
                  onTap: () => setState(() => items[label] = true),
                  child: Container(
                    decoration: BoxDecoration(
                      color: isActive == true ? Colors.lightBlue : Colors.white,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(6),
                        bottomLeft: Radius.circular(6),
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    alignment: Alignment.center,
                    child: Text('Lengkap',
                        style: TextStyle(
                          color: isActive == true ? Colors.white : Colors.grey,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                ),
              ),
              // Tidak
              Expanded(
                child: GestureDetector(
                  onTap: () => setState(() => items[label] = false),
                  child: Container(
                    decoration: BoxDecoration(
                      color: isActive == false ? Colors.pinkAccent : Colors.white,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(6),
                        bottomRight: Radius.circular(6),
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    alignment: Alignment.center,
                    child: Text('Tidak',
                        style: TextStyle(
                          color: isActive == false ? Colors.white : Colors.grey,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const Align(
                alignment: Alignment.topLeft,
                child: Text("3/9",
                    style: TextStyle(fontSize: 24, color: Colors.orange)),
              ),
              const Align(
                alignment: Alignment.topLeft,
                child: Text("Kelengkapan",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: items.keys.map((key) => buildToggle(key)).toList(),
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
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
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(context,
                          MaterialPageRoute(
                            builder: (context) => HasilInspeksiPage(),
                          ),
                        );
                      },
                      child: const Text("Next"),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Text(
                "copyright by Inspeksi Mobil Jogja",
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
