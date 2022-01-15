import 'package:flutter/material.dart';
import 'package:projets_3/comun/comun.dart';
import 'recomeded.dart';

class ComunServices extends StatefulWidget {
  final String? nomSim;
  final String? idsim;

  const ComunServices({Key? key, this.nomSim, this.idsim}) : super(key: key);

  @override
  _ComunServicesState createState() => _ComunServicesState();
}

class _ComunServicesState extends State<ComunServices> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.30,
            child: Comun(
              nomSim: widget.nomSim,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.30,
            child: Recomended(
              idSim: widget.idsim,
              nomsim: widget.nomSim,
            ),
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
