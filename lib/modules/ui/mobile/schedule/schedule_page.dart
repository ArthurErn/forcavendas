import 'package:flutter/material.dart';
import 'package:forca_vendas/modules/domain/usecases/general_query.dart';
import 'package:forca_vendas/modules/domain/usecases/notify.dart';
import 'package:forca_vendas/modules/extensions/string_extension.dart';
import 'package:forca_vendas/modules/infra/usecases/database/store/post_schedule_db.dart';
import 'package:forca_vendas/modules/ui/mobile/home/home_page.dart';
import 'package:forca_vendas/modules/ui/mobile/schedule/schedule_costumer.dart';
import 'package:forca_vendas/modules/ui/mobile/schedule/schedule_costumer_list.dart';
import 'package:forca_vendas/modules/ui/mobile/schedule/schedule_list.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({Key? key}) : super(key: key);

  @override
  _SchedulePageState createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  var scheduleList = [];
  var loading = true;
  TextEditingController observacaoC = TextEditingController();
  TextEditingController pickedDateC = TextEditingController(text: 'Nenhuma');
  TextEditingController pickedCostumerC =
      TextEditingController(text: 'Nenhum cliente selecionado');

  @override
  void initState() {
    loadingItems();
    GeneralQuery().query('clientes_visitas', 'id', 'id').then((value) {
      setState(() {
        scheduleList = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffe0f5f9),
      appBar: AppBar(
        actions: [
          GestureDetector(
              onTap: () {
                scheduleCostumer("", 'Nenhuma', 0, 'Nenhum cliente selecionado',
                    null, 'criado');
              },
              child: const Icon(Icons.schedule, color: Color(0xff01497c))),
          const SizedBox(width: 16)
        ],
        leading: GestureDetector(
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const HomePage()));
            },
            child: const Icon(Icons.arrow_back, color: Color(0xff01497c))),
        toolbarHeight: 65,
        backgroundColor: Colors.white,
        title: Text('AGENDAMENTOS',
            style: GoogleFonts.quicksand(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                letterSpacing: .2,
                color: const Color(0xff01497c))),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(6),
              height: 30,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 12,
                    spreadRadius: 2)
              ], color: Colors.white, borderRadius: BorderRadius.circular(16)),
              child: Center(
                child: Text('Visitas Marcadas',
                    style: GoogleFonts.quicksand(
                        fontWeight: FontWeight.w600, fontSize: 18)),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height - 135,
              color: Colors.transparent,
              child: scheduleList.isNotEmpty
                  ? Scrollbar(
                      child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: scheduleList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    scheduleCostumer(
                                        scheduleList[index]['observacao'],
                                        scheduleList[index]['data'],
                                        scheduleList[index]['id_pessoa'],
                                        scheduleList[index]['nome_pessoa'],
                                        scheduleList[index]['id'],
                                        "editado");
                                  });
                                },
                                child: ScheduleList(
                                    items: scheduleList, index: index));
                          }),
                    )
                  : loading == false
                      ? Center(
                          child: Text(
                            'Não foi possível encontrar nenhuma informação.',
                            style: GoogleFonts.quicksand(
                                fontSize: 15, color: const Color(0xff01497c)),
                          ),
                        )
                      : const Center(
                          child: SizedBox(
                            height: 50,
                            width: 50,
                            child: CircularProgressIndicator(
                              color: Color(0xff01497c),
                            ),
                          ),
                        ),
            )
          ],
        ),
      ),
    );
  }

  scheduleCostumer(observacao, data, idPessoa, costumer, id, texto) {
    pickedDateC.text = data;
    pickedCostumerC.text = costumer;
    observacaoC.text = observacao;
    costumerIDSchedule = idPessoa;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Marcar Agendamento",
              style: GoogleFonts.quicksand(fontWeight: FontWeight.w700)),
          content: SizedBox(
              height: 296,
              width: 250,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 230,
                      height: 45,
                      child: TextField(
                        controller: observacaoC,
                        decoration: InputDecoration(
                            hintText: "Observação",
                            hintStyle: GoogleFonts.quicksand()),
                      ),
                    ),
                    const SizedBox(height: 15),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2020),
                                  lastDate: DateTime(2030))
                              .then((value) {
                            setState(() {
                              pickedDateC.text = DateFormat('yyyy-MM-dd')
                                  .format(value!)
                                  .toString();
                            });
                          });
                        });
                      },
                      child: Container(
                        height: 50,
                        width: 230,
                        decoration: BoxDecoration(
                            color: const Color(0xff01497c),
                            borderRadius: BorderRadius.circular(12)),
                        child: Center(
                          child: Text(
                            "Escolher Data",
                            style: GoogleFonts.quicksand(
                                fontSize: 17,
                                color: Colors.white,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      "Data selecionada: ",
                      style: GoogleFonts.quicksand(
                          fontSize: 17,
                          color: Colors.black,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 50,
                      child: TextField(
                        decoration:
                            const InputDecoration(border: InputBorder.none),
                        readOnly: true,
                        controller: pickedDateC,
                      ),
                    ),
                    const Divider(thickness: 1),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ScheduleCostumerList()))
                            .then((value) {
                          setState(() {
                            pickedCostumerC.text = costumerNameSchedule!;
                          });
                        });
                      },
                      child: Container(
                        height: 50,
                        width: 230,
                        decoration: BoxDecoration(
                            color: const Color(0xff01497c),
                            borderRadius: BorderRadius.circular(12)),
                        child: Center(
                          child: Text(
                            "Escolher Cliente",
                            style: GoogleFonts.quicksand(
                                fontSize: 17,
                                color: Colors.white,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 3),
                    SizedBox(
                      height: 40,
                      child: TextField(
                        decoration:
                            const InputDecoration(border: InputBorder.none),
                        readOnly: true,
                        controller: pickedCostumerC,
                      ),
                    ),
                  ],
                ),
              )),
          actions: <Widget>[
            TextButton(
              child: Text("Confirmar",
                  style: GoogleFonts.quicksand(
                      fontWeight: FontWeight.w700,
                      color: const Color(0xff01497c))),
              onPressed: () {
                setState(() {
                  if (observacaoC.text != "" &&
                      pickedCostumerC.text != 'Nenhum cliente selecionado' &&
                      pickedDateC.text != 'Nenhuma') {
                    PostScheduleDatabase().post(
                        context,
                        costumerIDSchedule,
                        pickedDateC.text.inverseDate(),
                        observacaoC.text,
                        pickedCostumerC.text,
                        id,
                        texto);
                  } else {
                    Notify().pop(context, 'Preencha todos os campos!',
                        Icons.error, Colors.red, 'Erro');
                  }
                });
              },
            ),
          ],
        );
      },
    );
  }

  loadingItems() async {
    await Future.delayed(const Duration(seconds: 3)).then((value) {
      if (scheduleList.isEmpty) {
        setState(() {
          loading = false;
        });
      }
    });
  }
}
