import 'dart:async';
import 'package:flutter/material.dart';
import 'package:simple_connection_checker/simple_connection_checker.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  StreamSubscription? subscription;
  String _connection = "";

  @override
  void initState() {
    super.initState();
    SimpleConnectionChecker simpleConnectionChecker = SimpleConnectionChecker();
    simpleConnectionChecker.onConnectionChange.listen((connected) {
      setState(() {
        if (connected) {
          updateText("online");
        } else {
          updateText("offline");
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(_connection),
      ),
    );
  }

  void updateText(String text) {
    setState(() {
      _connection = text;
    });
  }


  @override
  void dispose() {
    subscription?.cancel();
    super.dispose();
  }
}
