import 'package:chatbot/core/di/service_locator.dart';
import 'package:chatbot/core/init/observer_init.dart';
import 'package:flutter/material.dart';
import 'chatbot.dart';

void main()async {
  observerInit();
  await configureDependencies();
  runApp(Chatbot());
}
