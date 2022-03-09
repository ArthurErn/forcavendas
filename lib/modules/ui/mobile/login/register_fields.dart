import 'package:flutter/material.dart';
import 'package:forca_vendas/modules/domain/usecases/persist_login.dart';
import 'package:forca_vendas/modules/infra/usecases/database/store/user_store_database.dart';
import 'package:google_fonts/google_fonts.dart';

var ipController = TextEditingController(text: '');
var userIDController = TextEditingController(text: '');

class RegisterFields extends StatefulWidget {
  const RegisterFields({Key? key}) : super(key: key);

  @override
  _RegisterFieldsState createState() => _RegisterFieldsState();
}

class _RegisterFieldsState extends State<RegisterFields> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Column(
        children: [
          const SizedBox(height: 15),
          SizedBox(
            width: MediaQuery.of(context).size.width * .75,
            child: TextField(
              controller: ipController,
              decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xff01497c), width: .6)),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Color(0xff01497c),
                          width: 1.2,
                          style: BorderStyle.solid)),
                  labelText: 'IP',
                  labelStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff01497c)),
                  prefixIcon: Icon(
                    Icons.wifi,
                    color: Color(0xff01497c),
                    size: 32,
                  )),
            ),
          ),
          const SizedBox(height: 25),
          SizedBox(
            width: MediaQuery.of(context).size.width * .75,
            child: TextField(
              controller: userIDController,
              decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xff01497c), width: .6)),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Color(0xff01497c),
                          width: 1.2,
                          style: BorderStyle.solid)),
                  labelText: 'Código do Usuário',
                  labelStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff01497c)),
                  prefixIcon: Icon(
                    Icons.person,
                    color: Color(0xff01497c),
                    size: 32,
                  )),
            ),
          ),
          const SizedBox(height: 45),
          GestureDetector(
            onTap: () {
              setState(() {
                PersistFields()
                    .actionSalvar(ipController.text, userIDController.text);
                UserStoreDatabase()
                    .store(ipController.text, userIDController.text, context);
              });
            },
            child: Container(
              width: MediaQuery.of(context).size.width * .75,
              height: 55,
              decoration: BoxDecoration(
                  color: const Color(0xff01497c),
                  borderRadius: BorderRadius.circular(35)),
              child: Center(
                child: Text(
                  'Conectar',
                  style: GoogleFonts.quicksand(
                      fontSize: 17,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
          const SizedBox(height: 45),
        ],
      ),
    );
  }
}
