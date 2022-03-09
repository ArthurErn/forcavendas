import 'package:shared_preferences/shared_preferences.dart';

String? userIDControllerR;
String? ipControllerR;

String? loginControllerR;
String? passwordControllerR;

class PersistFields {
  //SALVA OS ULTIMOS CAMPOS DE CONEXAO DA API
  Future actionSalvar(ipController, userIDController) async {
    String usuarioAPI = userIDController;
    String ipAPI = ipController;
    final pref = await SharedPreferences.getInstance();
    pref.setString('usuarioAPI', usuarioAPI);
    pref.setString('ipAPI', ipAPI);
  }

  //RETORNA OS ULTIMOS CAMPOS
  Future buscaHost() async {
    final pref = await SharedPreferences.getInstance();
    String? usuarioAPI = pref.getString("usuarioAPI");
    String? ipAPI = pref.getString("ipAPI");
    userIDControllerR = usuarioAPI ?? "";
    ipControllerR = ipAPI ?? "";
  }

  Future salvarLogin(loginController, passwordController) async {
    String usuarioLogin = loginController;
    String senhaLogin = passwordController;
    final pref = await SharedPreferences.getInstance();
    pref.setString('usuario', usuarioLogin);
    pref.setString('senha', senhaLogin);
  }

  Future loadLogin() async {
    final pref = await SharedPreferences.getInstance();
    String? usuarioLogin = pref.getString("usuario");
    String? senhaLogin = pref.getString("senha");
    passwordControllerR = senhaLogin;
    loginControllerR = usuarioLogin;
  }

  Future salvarCheckbox(lembrar) async {
    var lembrarPersist = lembrar;
    final pref = await SharedPreferences.getInstance();
    pref.setBool('lembrar', lembrarPersist);
  }

  Future loadCheckbox(lembrar) async {
    final pref = await SharedPreferences.getInstance();
    var lembrarPersist = pref.getBool('lembrar');
    lembrar = lembrarPersist ?? false;
    return lembrar;
  }
}
