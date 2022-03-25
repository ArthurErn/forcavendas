import 'dart:io';

import 'package:flutter/material.dart';
import 'package:forca_vendas/modules/external/database/database_connection.dart';
import 'package:forca_vendas/modules/ui/mobile/login/login_config_authentication.dart';
import 'package:forca_vendas/modules/ui/mobile/login/login_fields.dart';
import 'package:forca_vendas/modules/ui/mobile/login/register_fields.dart';
import 'package:google_fonts/google_fonts.dart';
import 'login_fields.dart';
import 'login_header.dart';

class LoginPage extends StatefulWidget {
  bool isLogin;
  LoginPage({Key? key, this.isLogin = true}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLogin = true;

  @override
  void initState() {
    DatabaseConnection().get();
    setState(() {
      isLogin = widget.isLogin;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffe0f5f9),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                  height: 250,
                  child: LoginHeader(250, true, Icons.login_rounded)),
              isLogin == true ? const LoginFields() : const RegisterFields(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      exitDialog();
                    },
                    child: const Icon(Icons.meeting_room,
                        color: Color(0xff01497c), size: 35),
                  ),
                  const SizedBox(
                    width: 80,
                  ),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return LoginConfigAuthentication();
                              });
                          isLogin == true
                              ? showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return LoginConfigAuthentication();
                                  })
                              : isLogin = true;
                        });
                      },
                      child: const Icon(Icons.settings,
                          color: Color(0xff01497c), size: 35)),
                ],
              )
            ],
          ),
        ));
  }

  exitDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Sair do sistema",
              style: GoogleFonts.quicksand(fontWeight: FontWeight.w700)),
          content: Text("Deseja mesmo sair do sistema?",
              style: GoogleFonts.quicksand(fontWeight: FontWeight.w500)),
          actions: <Widget>[
            TextButton(
              child: Text("Cancelar",
                  style: GoogleFonts.quicksand(
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff01497c))),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text("Sair",
                  style: GoogleFonts.quicksand(
                      fontWeight: FontWeight.w700,
                      color: const Color(0xff01497c))),
              onPressed: () {
                setState(() {
                  exit(0);
                });
              },
            ),
          ],
        );
      },
    );
  }
}
