import 'package:flutter/material.dart';
import '../aboutScreen.dart';
import '../comun/comunServices.dart';
import '../constant.dart';
import '../service/Services.dart';
import '../service/recharge.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? nomSim;
  String? idsim;
  int? _activeScreen = 0;
  String? _title = "Home";

  Map? args;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext? context) {
    Map? args = ModalRoute.of(context!)!.settings.arguments as Map;
    nomSim = args['nomSim'];
    idsim = args['id']!;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: mycolor,
        title: Text(tr(_title!)),
        centerTitle: true,
        actions: [
          PopupMenuButton(onSelected: (val) {
            print("val == $val");
            if (val == 'Changer le sim')
              Navigator.pushReplacementNamed(context, "firstScreen");
          }, itemBuilder: (context) {
            return [
              PopupMenuItem(
                  value: 'Changer le sim', child: Text('Changer le sim'))
            ];
          })
        ],
      ),
      body: _activeScreen == 0
          ? ComunServices(
              nomSim: nomSim,
              idsim: idsim,
            )
          : _activeScreen == 2
              ? About()
              : _activeScreen == 1
                  ? Services(
                      nomSim: nomSim!,
                      idsim: idsim!,
                    )
                  : Container(),
      floatingActionButton: FloatingActionButton.extended(
        key: null,
        backgroundColor: mycolor,
        onPressed: () => recharge(context, nomSim!),
        icon: Icon(Icons.add),
        label: Text(tr("recharge")),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _activeScreen!,
        items: [
          BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.home,
                color: Colors.green,
              ),
              icon: Icon(
                Icons.home,
              ),
              label: tr("Home")),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.power_input_sharp,
              color: Colors.green,
              size: 30,
            ),
            icon: Icon(
              Icons.power_input_sharp,
            ),
            label: tr("service"),
          ),
          BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.feedback_outlined,
                color: Colors.green,
              ),
              icon: Icon(
                Icons.feedback_outlined,
              ),
              label: tr('about'))
        ],
        onTap: (val) async {
          switch (val) {
            case 1:
              {
                setState(() {
                  _activeScreen = 1;
                  _title = "service";
                });
              }

              break;

            case 0:
              setState(() {
                _activeScreen = 0;
                _title = "Home";
              });

              break;
            case 2:
              setState(() {
                _activeScreen = 2;
                _title = 'about';
              });
              break;
          }
        },
      ),
    );
  }
}
