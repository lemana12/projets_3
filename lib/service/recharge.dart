import 'package:flutter/material.dart';
import 'package:projets_3/constant.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

void recharge(BuildContext context, String sim) {
  final _fromkey = GlobalKey<FormState>();
  String? _cardnum;
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          content: Container(
            width: MediaQuery.of(context).size.width,
            decoration: new BoxDecoration(
              shape: BoxShape.rectangle,
              color: const Color(0xFFFFFF),
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            child: Form(
                key: _fromkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.number,
                      style: TextStyle(fontSize: 18),
                      validator: (value) {
                        if (value!.length < 15)
                          return " ";
                        else
                          return null;
                      },
                      decoration: InputDecoration(labelText: "numero cart"),
                      onChanged: (val) => _cardnum = val,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Cancel',
                            style: TextStyle(fontSize: 18, color: Colors.red),
                          ),
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.white)),
                        ),
                        TextButton(
                          onPressed: () {
                            if (_fromkey.currentState!.validate())
                              FlutterPhoneDirectCaller.callNumber(
                                  "${chargecode[sim]}$_cardnum#");
                          },
                          child: Text(
                            'OK',
                            style: TextStyle(fontSize: 18, color: Colors.blue),
                          ),
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.white)),
                        ),
                      ],
                    )
                  ],
                )),
          ));
    },
  );
}
