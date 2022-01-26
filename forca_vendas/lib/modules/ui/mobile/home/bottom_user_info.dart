import 'package:flutter/material.dart';
import 'package:forca_vendas/modules/ui/mobile/login/login_page.dart';
import 'package:google_fonts/google_fonts.dart';

bool logoutIcon = true;

class BottomUserInfo extends StatefulWidget {
  final bool isCollapsed;
  final String user;

  const BottomUserInfo(
      {Key? key, required this.isCollapsed, required this.user})
      : super(key: key);

  @override
  State<BottomUserInfo> createState() => _BottomUserInfoState();
}

class _BottomUserInfoState extends State<BottomUserInfo> {
  void onClick() {
    exitDialog();
  }

  void wait() async {
    await Future.delayed(const Duration(milliseconds: 1000)).then((value) {
      setState(() {
        logoutIcon = true;
      });
    });
  }

  @override
  void initState() {
    wait();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 390),
      height: widget.isCollapsed ? 70 : 100,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(20),
      ),
      child: !logoutIcon
          ? Center(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 10),
                    child: Flex(
                      direction: Axis.vertical,
                      children: [Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                widget.user,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.clip,
                              ),
                            ),
                          ],
                        ),
                      ),
                      ]),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: IconButton(
                      onPressed: () {
                        onClick();
                      },
                      icon: const Icon(
                        Icons.logout,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(top: 10),
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: const Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: IconButton(
                    onPressed: () {
                      onClick();
                    },
                    icon: const Icon(
                      Icons.logout,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                ),
              ],
            ),
    );
  }

  void exitDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Encerrar sessão",
              style: GoogleFonts.quicksand(fontWeight: FontWeight.w700)),
          content: Text("Deseja mesmo encerrar a sessão atual?",
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
                Navigator.of(context).pop();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const LoginPage()));
              },
            ),
          ],
        );
      },
    );
  }
}
