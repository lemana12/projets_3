import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../loading.dart';
import '../models.dart';
import '../database.dart';

class Services extends StatefulWidget {
  final String? nomSim;
  final String? idsim;
  final String? lang;
  const Services({Key? key, this.nomSim, this.idsim, this.lang})
      : super(key: key);
  @override
  _ServicesState createState() => _ServicesState();
}

Map<String, dynamic> icons = {
  "internet": Icons.network_wifi,
  "voix": Icons.keyboard_voice_outlined,
  'message': Icons.message_outlined
};

class _ServicesState extends State<Services> {
  List<Widget> servicesList(List<TypeService> children) {
    List<Widget> buttons = [];
    String textservice = "Les types des service";
    if (widget.lang == "ar") textservice = "أنواع الخدمات";
    Widget button;
    buttons.add(Text(
      textservice,
      style: TextStyle(fontSize: 25),
    ));
    for (TypeService l in children) {
      print("--------------------------");
      print(l.id);
      button = ElevatedButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            ),
            elevation: MaterialStateProperty.all(10),
            backgroundColor: MaterialStateProperty.all(Colors.white)),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icons[l.nom] ?? Icons.network_wifi,
                color: Colors.blue,
              ),
              Text(
                l.nom!,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
        onPressed: () => Navigator.pushNamed(context, "choices", arguments: {
          "choices": l,
          "nomsim": widget.nomSim,
          "lang": widget.lang
        }),
      );
      buttons.add(button);
    }
    return buttons;
  }

  List<Widget> mylist = [];
  @override
  Widget build(BuildContext context) {
    print(widget.idsim);
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(
        children: [
          StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream: getCompTypeService(widget.nomSim!, widget.idsim!),
              builder: (context, snapshot) {
                print('-----------------------------');
                print("conntion : ${snapshot.connectionState}");
                print("conntion : ${snapshot.error.toString()}");
                print("hase data  ${snapshot.hasData}");
                if (snapshot.hasData)
                  mylist = servicesList(snapshot.data!.docs.map((e) {
                    return TypeService(
                        nom: e.data()['nom'] != null
                            ? e.data()['nom']
                            : "service",
                        idComp: widget.idsim!,
                        id: e.id);
                  }).toList());
                return snapshot.hasData &&
                    snapshot.connectionState == ConnectionState.active
                    ? Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: StaggeredGridView.countBuilder(
                          crossAxisCount: 6,
                          mainAxisSpacing: 30,
                          crossAxisSpacing: 30,
                          padding: EdgeInsets.only(
                              bottom: 10, left: 20, right: 20, top: 20),
                          itemBuilder: (context, index) => mylist[index],
                          itemCount: mylist.length,
                          staggeredTileBuilder: (index) =>
                              StaggeredTile.count((index == 0) ? 6 : 3,
                                  (index == 0) ? 1.1 : 3),
                        ),
                      ),
                    ],
                  ),
                )
                    : Expanded(child: Loading());
              }),
        ],
      ),
    );
  }
}
