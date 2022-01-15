import 'dart:io';

import 'package:flutter/material.dart';

const mycolor = Colors.blue;

const Map<String, String> chargecode = {
  'MATTEL': "*133*",
  "mauritel": "*123*",
  "mauritani": "*122*"
};

const Map<String, dynamic> consult = {
  "mattel": [
    ["solde", "*130#"],
    ["internet", "*160*0#"],
  ],
  "mauritel": [
    ["solde", "#123#"]
  ],
  "mauritani": [
    ["solde", '*222#']
  ],
  'chiguitel': [
    ['credit', '*222#']
  ]
};

Map<String, String> simsInAr = {
  "MATTEL": "ماتل",
  "mauritel": "موريتل",
  "mauritani": "موريتاني"
};
const Map<String, String> arabic_tr = {
  "MATTEL": "ماتل",
  "mauritel": "موريتل",
  "mauritani": "موريتاني",
  "Welcome": "مرحبا",
  "Home": "الصفحة الرئسية",
  "service": "الخدمات",
  "about": 'حول',
  "recharge": "شحن الرصيد",
  "Consultation": "مشاورة",
  "Recomander": "توصيات",
  "Choices": "الخيارات",
  "Les types des service": "أنواع الخدمات",
  "prix": "السعر",
  "Duree": "المجدة",
  "Activer": "تفعيل",
  "Cancel": "إلغاء"
};

String tr(String word) {
  String lang = Platform.localeName;
  lang = lang[0] + lang[1];

  if (lang == 'ar') return arabic_tr[word] ?? word;
  return word;
}
