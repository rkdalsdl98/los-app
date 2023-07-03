import 'package:flutter/material.dart';
import 'package:los_app/view/home.dart';
import 'package:los_app/view/main_login_view.dart';

Route<dynamic>? initGeneratedRoutes(RouteSettings settings) {
  final args =
      (settings.arguments ?? <String, dynamic>{}) as Map<String, dynamic>;

  switch (settings.name) {
    case '/login':
      return MaterialPageRoute(builder: (_) => const MainLoginView());
    case '/home':
      return MaterialPageRoute(builder: (_) => Home());
    default:
      return null;
  }
}
