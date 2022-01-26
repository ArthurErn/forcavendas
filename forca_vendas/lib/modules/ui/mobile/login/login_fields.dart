import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:forca_vendas/modules/domain/usecases/login_auth.dart';
import 'package:forca_vendas/modules/domain/usecases/persist_login.dart';
import 'package:forca_vendas/modules/ui/mobile/login/register_fields.dart';
import 'package:google_fonts/google_fonts.dart';

var loginController = TextEditingController(text: '');
var passwordController = TextEditingController(text: '');

class LoginFields extends StatefulWidget {
  const LoginFields({Key? key}) : super(key: key);

  @override
  _LoginFieldsState createState() => _LoginFieldsState();
}

class _LoginFieldsState extends State<LoginFields> {
  bool hidePassword = true;

  bool _switch = false;
  @override
  void initState() {
    PersistFields().loadCheckbox(_switch).then((value) {
      _switch = value;
      if (value == true) {
        PersistFields().loadLogin().then((value) {
          setState(() {
            loginController.text = loginControllerR ?? "";
            passwordController.text = passwordControllerR ?? "";
          });
        });
      }
    });
    PersistFields().buscaHost().then((value) {
      setState(() {
        ipController.text = ipControllerR ?? "";
        userIDController.text = userIDControllerR ?? "";
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * .75,
            child: TextField(
              controller: loginController,
              decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xff01497c), width: .6)),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Color(0xff01497c),
                          width: 1.2,
                          style: BorderStyle.solid)),
                  labelText: 'Usuário',
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
          const SizedBox(
            height: 25,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * .75,
            child: TextField(
              obscureText: hidePassword,
              controller: passwordController,
              decoration: InputDecoration(
                  enabledBorder: const UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xff01497c), width: .6)),
                  focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Color(0xff01497c),
                          width: 1.2,
                          style: BorderStyle.solid)),
                  labelText: 'Senha',
                  labelStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff01497c)),
                  suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          hidePassword = !hidePassword;
                        });
                      },
                      child: hidePassword == false
                          ? const Icon(FontAwesomeIcons.eyeSlash,
                              color: Color(0xff01497c))
                          : const Icon(FontAwesomeIcons.eye,
                              color: Color(0xff01497c))),
                  prefixIcon: const Icon(
                    Icons.lock,
                    color: Color(0xff01497c),
                    size: 32,
                  )),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Text(
                'Lembrar usuário',
                style: TextStyle(fontSize: 14, color: Color(0xff01497c)),
              ),
              Switch(
                  activeColor: const Color(0xff01497c).withOpacity(0.8),
                  value: _switch,
                  onChanged: (state) {
                    setState(() {
                      _switch = state;
                    });
                  }),
              const SizedBox(
                width: 40,
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                PersistFields().salvarCheckbox(_switch);
                PersistFields()
                    .salvarLogin(loginController.text, passwordController.text);
                LoginAuth().auth(
                    loginController.text, passwordController.text, context);
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
                  'Entrar',
                  style: GoogleFonts.quicksand(
                      fontSize: 17,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
        ],
      ),
    );
  }
}
