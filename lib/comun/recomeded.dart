import 'package:flutter/material.dart';
import 'package:projets_3/choicesScreen/Choicedialoge.dart';
import 'package:projets_3/models.dart';

import '../constant.dart';
import '../database.dart';

class Recomended extends StatefulWidget {
  final idSim;
  final nomsim;
  Recomended({this.idSim, this.nomsim});

  @override
  _RecomendedState createState() => _RecomendedState();
}

class _RecomendedState extends State<Recomended> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Service>>(
        stream: getrecomandedServices(widget.nomsim),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data!.length > 0) {
            snapshot.data!.removeWhere((element) => element == null);
            return SizedBox(
              child: Scaffold(
                backgroundColor: Colors.grey[100],
                body: SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 8.0),
                        child: Text(
                          tr("Recomander"),
                          style: TextStyle(fontSize: 28),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.18,
                        child: ListView.builder(
                            itemCount: snapshot.data!.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              print("-------------------");
                              print(snapshot.data);
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                      shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                      ),
                                      elevation: MaterialStateProperty.all(10),
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.white)),
                                  child: Container(
                                    width: MediaQuery.of(context).size.height *
                                        0.13,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          snapshot.data![index].nom!,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                  ),
                                  onPressed: () async {
                                    choicedialoge(context, snapshot.data![index],
                                        widget.nomsim);
                                  },
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
          return Container();
        });
  }
}
