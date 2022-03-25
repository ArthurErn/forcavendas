import 'package:flutter/material.dart';
import 'package:forca_vendas/modules/ui/mobile/login/login_page.dart';

class LoginConfigAuthentication extends StatefulWidget {
  const LoginConfigAuthentication({Key? key}) : super(key: key);

  @override
  State<LoginConfigAuthentication> createState() =>
      _LoginConfigAuthenticationState();
}

class _LoginConfigAuthenticationState extends State<LoginConfigAuthentication> {
  TextEditingController loginController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Color.fromARGB(0, 255, 255, 255),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Color.fromARGB(255, 241, 241, 241),
          ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 200,
                  child: TextFormField(
                      controller: loginController,
                      decoration: InputDecoration(label: Text('Login'))),
                ),
                SizedBox(
                  width: 200,
                  child: TextFormField(
                      controller: passwordController,
                      decoration: InputDecoration(label: Text('Senha'))),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()));
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: 80,
                        height: 40,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 6, 56, 87),
                            borderRadius: BorderRadius.circular(10)),
                        child: const Text("Cancelar",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400)),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        if (loginController.text == "vistaadm" &&
                            passwordController.text == "vistatec") {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      LoginPage(isLogin: false)));
                        } else {
                          print("Dados Incorretos!");
                        }
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: 80,
                        height: 40,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 6, 56, 87),
                            borderRadius: BorderRadius.circular(10)),
                        child: const Text("Autenticar",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400)),
                      ),
                    ),
                  ],
                ),
              ]),
          width: 300,
          height: 200,
        ),
      ),
    );
  }
}
