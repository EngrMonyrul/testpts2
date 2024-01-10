import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertServices {
  late GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey;
  static AlertServices alertServices = AlertServices();

  AlertServices() {
    scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
  }

  toggleSms({required String msg, required Color color}) {
    scaffoldMessengerKey.currentState!.showSnackBar(
      SnackBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        content: Container(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          child: Text(
            msg,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            maxLines: 5,
            style: const TextStyle(fontSize: 15),
          ),
        ),
      ),
    );
  }
}
