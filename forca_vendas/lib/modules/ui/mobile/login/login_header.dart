import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginHeader extends StatefulWidget {
  final double _height;
  final bool _showIcon;
  final IconData _icon;

  const LoginHeader(this._height, this._showIcon, this._icon, {Key? key})
      : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  _LoginHeaderState createState() =>
      // ignore: no_logic_in_create_state
      _LoginHeaderState(_height, _showIcon, _icon);
}

class _LoginHeaderState extends State<LoginHeader> {
  final double _height;
  final bool _showIcon;
  // ignore: unused_field
  final IconData _icon;

  _LoginHeaderState(this._height, this._showIcon, this._icon);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return SizedBox(
      child: Stack(
        children: [
          ClipPath(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      const Color(0xff01497c).withOpacity(0.4),
                      const Color(0xff014f86).withOpacity(0.4),
                    ],
                    begin: const FractionalOffset(0.0, 0.0),
                    end: const FractionalOffset(1.0, 0.0),
                    stops: const [0.0, 1.0],
                    tileMode: TileMode.clamp),
              ),
            ),
            clipper: ShapeClipper([
              Offset(width / 5, _height),
              Offset(width / 10 * 5, _height - 60),
              Offset(width / 5 * 4, _height + 20),
              Offset(width, _height - 18)
            ]),
          ),
          ClipPath(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      const Color(0xff01497c).withOpacity(0.4),
                      const Color(0xff014f86).withOpacity(0.4),
                    ],
                    begin: const FractionalOffset(0.0, 0.0),
                    end: const FractionalOffset(1.0, 0.0),
                    stops: const [0.0, 1.0],
                    tileMode: TileMode.clamp),
              ),
            ),
            clipper: ShapeClipper([
              Offset(width / 3, _height + 20),
              Offset(width / 10 * 8, _height - 60),
              Offset(width / 5 * 4, _height - 60),
              Offset(width, _height - 20)
            ]),
          ),
          ClipPath(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Color(0xff01497c),
                      Color(0xff014f86),
                    ],
                    begin: FractionalOffset(0.0, 0.0),
                    end: FractionalOffset(1.0, 0.0),
                    stops: [0.0, 1.0],
                    tileMode: TileMode.clamp),
              ),
            ),
            clipper: ShapeClipper([
              Offset(width / 5, _height),
              Offset(width / 2, _height - 40),
              Offset(width / 5 * 4, _height - 80),
              Offset(width, _height - 20)
            ]),
          ),
          Visibility(
            visible: _showIcon,
            child: SizedBox(
              height: _height - 40,
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("LOTUS ERP",
                      style: GoogleFonts.quicksand(
                          fontSize: 29,
                          letterSpacing: 1.2,
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                  Text("FORÇA DE VENDAS",
                      style: GoogleFonts.quicksand(
                          fontSize: 15,
                          letterSpacing: .2,
                          color: Colors.white,
                          fontWeight: FontWeight.w500)),
                ],
              )),
            ),
          ),
        ],
      ),
    );
  }
}

class ShapeClipper extends CustomClipper<Path> {
  // ignore: prefer_final_fields
  List<Offset> _offsets;
  ShapeClipper(this._offsets);
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0.0, size.height - 20);

    // path.quadraticBezierTo(size.width/5, size.height, size.width/2, size.height-40);
    // path.quadraticBezierTo(size.width/5*4, size.height-80, size.width, size.height-20);

    path.quadraticBezierTo(
        _offsets[0].dx, _offsets[0].dy, _offsets[1].dx, _offsets[1].dy);
    path.quadraticBezierTo(
        _offsets[2].dx, _offsets[2].dy, _offsets[3].dx, _offsets[3].dy);

    // path.lineTo(size.width, size.height-20);
    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
