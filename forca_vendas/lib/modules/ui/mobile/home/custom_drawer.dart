import 'dart:io';
import 'package:flutter/material.dart';
import 'package:forca_vendas/modules/domain/usecases/notify.dart';
import 'package:forca_vendas/modules/domain/usecases/sync_data.dart';
import 'package:forca_vendas/modules/infra/usecases/api/upload_costumer.dart';
import 'package:forca_vendas/modules/infra/usecases/api/upload_sale.dart';
import 'package:forca_vendas/modules/infra/usecases/api/upload_schedule.dart';
import 'package:forca_vendas/modules/ui/mobile/financial/financial_page.dart';
import 'package:forca_vendas/modules/ui/mobile/product/product_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'bottom_user_info.dart';
import 'custom_list_tile.dart';
import 'header.dart';

// ignore: must_be_immutable
class CustomDrawer extends StatefulWidget {
  final String headerTitle;
  final int idProduct;
  final String user;
  bool isCollapsed;
  CustomDrawer(
      {Key? key,
      required this.headerTitle,
      required this.user,
      required this.idProduct,
      required this.isCollapsed
      })
      : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  bool _isCollapsed = false;

  void goTo(page) {
    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => page),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AnimatedContainer(
        curve: Curves.easeInOutCubic,
        duration: const Duration(milliseconds: 500),
        width: _isCollapsed ? 300 : 70,
        margin: const EdgeInsets.only(bottom: 10, top: 10),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
          color: Color(0xdd01497c),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomDrawerHeader(
                  isColapsed: _isCollapsed, header: widget.headerTitle),
              const Divider(
                color: Colors.grey,
              ),
              CustomListTile(
                isCollapsed: _isCollapsed,
                icon: Icons.cloud_upload,
                title: 'Upload de Dados',
                infoCount: 0,
                onPressed: () => uploadDataDialog(),
              ),
              CustomListTile(
                isCollapsed: _isCollapsed,
                icon: Icons.download,
                title: 'Sincronizar',
                infoCount: 0,
                onPressed: () => syncDataDialog(),
              ),
              CustomListTile(
                isCollapsed: _isCollapsed,
                icon: Icons.storage,
                title: 'Consultar Produtos',
                infoCount: 0,
                onPressed: () => goTo(ProductPage(id: widget.idProduct)),
                //doHaveMoreOptions: Icons.arrow_forward_ios,
              ),
              CustomListTile(
                isCollapsed: _isCollapsed,
                icon: Icons.attach_money,
                title: 'Contas a Receber',
                infoCount: 0,
                onPressed: () => goTo(const FinancialPage()),
              ),
              const Divider(color: Colors.grey),
              const Spacer(),
              const SizedBox(height: 10),
              BottomUserInfo(
                isCollapsed: _isCollapsed,
                user: widget.user,
              ),
              Align(
                alignment: _isCollapsed
                    ? Alignment.bottomRight
                    : Alignment.bottomCenter,
                child: IconButton(
                  splashColor: Colors.transparent,
                  icon: Icon(
                    _isCollapsed
                        ? Icons.arrow_back_ios
                        : Icons.arrow_forward_ios,
                    color: Colors.white,
                    size: 16,
                  ),
                  onPressed: () {
                    setState(() {
                      _isCollapsed = !_isCollapsed;
                      logoutIcon == true ? wait() : logoutIcon = true;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void wait() async {
    await Future.delayed(const Duration(milliseconds: 500)).then((value) {
      setState(() {
        logoutIcon = false;
      });
    });
  }

  void uploadDataDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "Upload de dados",
            style: GoogleFonts.quicksand(fontWeight: FontWeight.w700),
          ),
          content: Text(
            "Deseja fazer upload dos dados?",
            style: GoogleFonts.quicksand(fontWeight: FontWeight.w500),
          ),
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
              child: Text("Fazer Upload",
                  style: GoogleFonts.quicksand(
                      fontWeight: FontWeight.w700,
                      color: const Color(0xff01497c))),
              onPressed: () {
                uploadData();
              },
            ),
          ],
        );
      },
    );
  }

  void uploadData() async {
    await UploadCostumer().post(context);
    await UploadSale().post(context);
    await UploadSchedule().post(context);
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        Navigator.pop(context);
        Notify().pop(context, 'Upload feito com sucesso!', Icons.check,
            Colors.green, 'Sucesso!');
      }
    } on SocketException catch (_) {
      Navigator.pop(context);
      Notify().pop(context, 'Erro ao realizar upload!', Icons.error, Colors.red,
          'Erro!');
    }
  }

  void syncDataDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Sincronizar dados",
              style: GoogleFonts.quicksand(fontWeight: FontWeight.w700)),
          content: Text("Deseja sincronizar o seu banco de dados?",
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
              child: Text("Sincronizar",
                  style: GoogleFonts.quicksand(
                      fontWeight: FontWeight.w700,
                      color: const Color(0xff01497c))),
              onPressed: () {
                setState(() {
                  Navigator.pop(context);
                  SyncData().sync(context);
                });
              },
            ),
          ],
        );
      },
    );
  }
}
