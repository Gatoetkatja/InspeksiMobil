import 'package:flutter/material.dart';
import 'package:pelatihan_kosong/identitas.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({super.key});

  @override
  State<SplashScreen> createState() {
    return _SplashScreenState();
  }
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => IdentitasPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final tinggi = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: Center(child: Image.asset('assets/images/logo_palapa2.png', width: 250))),
              Padding(
                padding: EdgeInsets.only(bottom: tinggi * 0.08),
                child: Image.asset('assets/images/cardano.png', width: 200),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
