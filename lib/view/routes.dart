import 'package:flutter/material.dart';
import 'package:los_app/view/home.dart';
import 'package:los_app/view/main_login_view.dart';
import 'package:los_app/view/post_detail.dart';
import 'package:los_app/view/posts.dart';

Route<dynamic>? initGeneratedRoutes(RouteSettings settings) {
  final args =
      (settings.arguments ?? <String, dynamic>{}) as Map<String, dynamic>;

  switch (settings.name) {
    case '/login':
      return MaterialPageRoute(builder: (_) => const MainLoginView());
    case '/home':
      return MaterialPageRoute(builder: (_) => const Home());
    case '/posts':
      return MaterialPageRoute(builder: (_) => const Posts());
    case '/postdetail':
      return MaterialPageRoute(builder: (_) => const PostDetail());
    default:
      return null;
  }
}
