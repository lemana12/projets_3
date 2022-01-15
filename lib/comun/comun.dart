import 'package:flutter/material.dart';
import 'package:projets_3/loading.dart';
import 'package:projets_3/models.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import '../constant.dart';

class Comun extends StatefulWidget {
  final String? nomSim;
  final lang;

  Comun({this.nomSim, this.lang});

  @override
  _ComunState createState() => _ComunState();
}

class _ComunState extends State<Comun> {
  List<Service>? _comumnServicse = [];
  void initialize() {
    List<List<String>> c = consult[widget.nomSim!.toLowerCase()];
    _comumnServicse = [];
    for (List<String> l in c) {
      Service s = Service();
      s.nom = l[0];
      s.code = l[1];

      _comumnServicse!.add(s);
    }
  }

  @override
  Widget build(BuildContext context) {
    initialize();
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              tr("Consultation"),
              style: TextStyle(fontSize: 28),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.18,
            child: ListView.builder(
                itemCount: _comumnServicse!.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 15),
                    child: ElevatedButton(
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                          ),
                          elevation: MaterialStateProperty.all(10),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white)),
                      child: Container(
                        width: MediaQuery.of(context).size.height * 0.13,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              _comumnServicse![index].nom!,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                      onPressed: () async {
                        await FlutterPhoneDirectCaller.callNumber(
                            _comumnServicse![index].code!);
                      },
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
