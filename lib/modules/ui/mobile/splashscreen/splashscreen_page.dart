import 'package:flutter/material.dart';
import 'package:forca_vendas/modules/ui/mobile/login/login_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 3500)).then((value) =>
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginPage())));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff01497c),
      body: Center(
        child: SizedBox(
          height: 100,
          width: MediaQuery.of(context).size.width * .65,
          child: Image.asset('assets/logo.png'),
        ),
      ),
    );
  }
}
