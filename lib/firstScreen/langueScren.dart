// import 'package:flutter/material.dart';

// import '../constant.dart';
// import 'Sim.dart';
// import 'package:permission_handler/permission_handler.dart';

// class LangueSreen extends StatefulWidget {
//   final Function func;
//   final Function change;
//   const LangueSreen({Key key, this.func, this.change}) : super(key: key);

//   @override
//   _LangueSreenState createState() => _LangueSreenState();
// }

// class _LangueSreenState extends State<LangueSreen> {
//   int _val = 0;
//   String lang = 'fr';
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: FutureBuilder(
//           future: getpermition(),
//           builder: (context, snapshot) {
//             return Padding(
//               padding: const EdgeInsets.only(bottom: 70),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   SizedBox(
//                     width: MediaQuery.of(context).size.width,
//                   ),
//                   Text(
//                     "choisire language",
//                     style: TextStyle(
//                         color: Colors.blue,
//                         fontWeight: FontWeight.w600,
//                         fontSize: 19),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   FloatingActionButton.extended(
//                     heroTag: null,
//                     backgroundColor: mycolor,
//                     onPressed: () {
//                       setState(() {
//                         _val = 1;
//                         lang = "fr";
//                       });
//                       widget.change(lang);
//                     },
//                     label: Row(
//                       children: [
//                         Text("Francai"),
//                         Radio(
//                             overlayColor:
//                                 MaterialStateProperty.all(Colors.white),
//                             fillColor: MaterialStateProperty.all(Colors.white),
//                             value: 1,
//                             groupValue: _val,
//                             onChanged: (val) {
//                               print(val);
//                               setState(() {
//                                 _val = val;
//                                 lang = "fr";
//                               });
//                               widget.change(lang);
//                             }),
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     height: 8,
//                   ),
//                   FloatingActionButton.extended(
//                     heroTag: null,
//                     backgroundColor: mycolor,
//                     onPressed: () async {
//                       await openAppSettings();
//                       setState(() {
//                         _val = 2;
//                         lang = 'ar';
//                       });
//                       widget.change(lang);
//                     },
//                     label: Row(
//                       children: [
//                         Text("العربية", style: TextStyle(fontSize: 20)),
//                         Radio(
//                             overlayColor:
//                                 MaterialStateProperty.all(Colors.white),
//                             fillColor: MaterialStateProperty.all(Colors.white),
//                             value: 2,
//                             groupValue: _val,
//                             onChanged: (val) {
//                               print(val);
//                               setState(() {
//                                 _val = val;
//                                 lang = "ar";
//                               });
//                               widget.change(lang);
//                             }),
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   FloatingActionButton.extended(
//                     heroTag: null,
//                     backgroundColor: mycolor,
//                     onPressed: () {
//                       if (lang != null) widget.func(lang);
//                     },
//                     label: Row(
//                       children: [
//                         Text("Suivant"),
//                         Icon(Icons.arrow_forward_rounded)
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           }),
//     );
//   }
// }
