import 'package:chatbot/core/init/di.dart';
import 'package:chatbot/core/init/observer_init.dart';
import 'package:flutter/material.dart';
import 'chatbot.dart';

void main() async {
  setupGetIt();
  observerInit();

  runApp(Chatbot());
}
