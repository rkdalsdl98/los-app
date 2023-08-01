import 'package:flutter/material.dart';
import 'package:los_app/view/chat.dart';
import 'package:los_app/view/find_team.dart';
import 'package:los_app/view/home.dart';
import 'package:los_app/view/main_login_view.dart';
import 'package:los_app/view/persornal_reminder.dart';
import 'package:los_app/view/post_detail.dart';
import 'package:los_app/view/posts.dart';
import 'package:los_app/view/register_team.dart';
import 'package:los_app/view/write_post.dart';

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
    case '/register-team':
      return MaterialPageRoute(builder: (_) => const RegisterTeam());
    case '/chat':
      return MaterialPageRoute(builder: (_) => const Chat());
    case '/find-team':
      return MaterialPageRoute(builder: (_) => const FindTeam());
    case '/persornal-reminder':
      return MaterialPageRoute(
          builder: (_) => PersornalReminder(alerts: args['alerts']));
    case '/write-post':
      return MaterialPageRoute(builder: (_) => const WritePost());
    default:
      return null;
  }
}
