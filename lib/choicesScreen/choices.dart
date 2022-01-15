import 'package:flutter/material.dart';
import '../choicesScreen/Choicedialoge.dart';
import '../constant.dart';
import '../loading.dart';
import '../models.dart';

import '../database.dart';

class Choices extends StatefulWidget {
  @override
  _ChoicesState createState() => _ChoicesState();
}

class _ChoicesState extends State<Choices> {
  @override
  Widget build(BuildContext context) {
    Map? args = ModalRoute.of(context)!.settings.arguments as Map;

    TypeService choices = args['choices'];
    String nomsim = args['nomsim'];

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(tr("Choices")),
          backgroundColor: mycolor,
        ),
        body: StreamBuilder<List<Service>>(
            stream: getCompService(choices),
            builder: (context, snapshot) {
              return snapshot.hasData
                  ? ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return Center(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              choicedialoge(
                                  context, snapshot.data![index], nomsim);
                            },
                            child: Material(
                              elevation: 5.0,
                              borderRadius: BorderRadius.circular(7.0),
                              child: Container(
                                margin: EdgeInsets.all(12),
                                width: MediaQuery.of(context).size.width,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      flex: 3,
                                      child: Text(
                                        snapshot.data![index].nom!,
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Text(
                                        "${snapshot.data![index].prix}NUM",
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ));
                      })
                  : Loading();
            }));
  }
}
