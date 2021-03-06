import 'dart:io';
import 'package:permission_handler/permission_handler.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sim_data/sim_data.dart';
import '../database.dart';
import 'package:mobile_number/mobile_number.dart';



List<String> companies = ["mattel", "mauritel", "chinguitel"];
Future<Map<String, dynamic>> getSimInfo() async {
  List<List<String>> sims = [];
  await intializeDatabase();

 
    PermissionStatus state = await Permission.phone.status;
    if (!state.isGranted) {
      bool isGranted = await Permission.phone.request().isGranted;
      if (!isGranted) return {'sims': sims, 'per': false};
    }

    

    String nom = '';
    SimData simData = await SimDataPlugin.getSimData();
    var simCards = simData.cards;

    for (int i = 0; i < simCards.length; i++) {
      nom = simCards[i].carrierName.toLowerCase();

      String id = await getIdComp(
          nom == "T-Mobile" || nom == "Android" ? "mattel" : nom);
      print("-----------------------------");
      print(nom);
      print("id : $id");
      sims.add([nom, id]);
    }
    if (sims.isEmpty) {
      String id;
      for (String company in companies) {
        id = "";
        id = await getIdComp(
            nom == "T-Mobile" || nom == "Android" ? "mattel" : nom);
        sims.add([company, id]);
      }
    }
    return {'sims': sims, 'per': true};
  

}
