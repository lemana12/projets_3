import 'package:projets_3/loading.dart';

import '../constant.dart';

import 'sim.dart';
import 'package:flutter/material.dart';

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tr('Welcome')),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.18,
          ),
          Center(
            child: FutureBuilder<Map<String,dynamic>?>(
              future: getSimInfo(),
              builder: (context, sims) {
                var data  = sims.data ?? {};
                if (sims.hasData) {
                  if (data['per']) return Text('no permitions');
                  if (data['sims'].length == 0)
                    return Text('no sim cards found');
                  print("----------------------");
                  print(data['sims'][0][0]);
                  print(data['sims'][0][1]);
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        height: MediaQuery.of(context).size.width * 0.4,
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
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.sim_card, color: Colors.blue),
                                Text(
                                  data['sims'][0][0] == "T-Mobile"
                                      ? tr("MATTEL")
                                      : tr(data['sims'][0][0]),
                                  style: TextStyle(
                                      color: Colors.blueAccent, fontSize: 25),
                                ),
                              ],
                            ),
                          ),
                          onPressed: () => Navigator.pushReplacementNamed(
                              context, "home",
                              arguments: {
                                "nomSim": data['sims'][0][0] == "T-Mobile"
                                    ? "MATTEL"
                                    : data['sims'][0][0],
                                'id': data['sims'][0][1],
                              }),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      data['sims'].length == 2
                          ? SizedBox(
                              width: MediaQuery.of(context).size.width * 0.6,
                              height: MediaQuery.of(context).size.width * 0.4,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                    ),
                                    elevation: MaterialStateProperty.all(10),
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.white)),
                                child: Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.sim_card,
                                        color: Colors.blue,
                                      ),
                                      Text(
                                        data['sims'][1][0] == "T-Mobile"
                                            ? tr("MATTEL")
                                            : tr(data['sims'][1][0]),
                                        style: TextStyle(
                                            color: Colors.blue, fontSize: 25),
                                      ),
                                    ],
                                  ),
                                ),
                                onPressed: () => Navigator.pushReplacementNamed(
                                    context, "home",
                                    arguments: {
                                      "nomSim":
                                          data['sims'][1][0] == "T-Mobile"
                                              ? "MATTEL"
                                              : data['sims'][1][0],
                                      'id': data['sims'][1][1],
                                    }),
                              ),
                            )
                          : Container()
                    ],
                  );
                }
                return Loading();
              },
            ),
          ),
        ],
      ),
    );
  }
}
