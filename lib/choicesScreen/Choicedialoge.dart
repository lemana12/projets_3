import 'package:flutter/material.dart';
import 'package:projets_3/recommandation/reco.dart';
import '../constant.dart';
import '../models.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

void choicedialoge(BuildContext context, Service s, String nomsim) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
          contentPadding: EdgeInsets.fromLTRB(0, 20.0, 0, 0),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          content: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("${s.nom}",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    )),
                Text(
                  "${tr("prix")}: ${s.prix}",
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  "${tr("Duree")}: ${s.duree} ",
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Divider(
                  color: Colors.black,
                  height: 0.0,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: TextButton(
                    onPressed: () async {
                      Navigator.pop(context);
                      await incremant(s, nomsim);
                      await FlutterPhoneDirectCaller.callNumber(s.code!);
                    },
                    child: Text(
                      tr('Activer'),
                      style: TextStyle(fontSize: 18, color: Colors.blue),
                    ),
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all(EdgeInsets.zero),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white)),
                  ),
                ),
                Divider(
                  color: Colors.black,
                  height: 0.0,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      tr('Cancel'),
                      style: TextStyle(fontSize: 18, color: Colors.red),
                    ),
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all(EdgeInsets.zero),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white)),
                  ),
                ),
              ],
            ),
          ));
    },
  );
}
