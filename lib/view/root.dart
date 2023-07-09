import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:los_app/design/color_schemes.g.dart';
import 'package:los_app/provider/user_provider.dart';
import 'package:los_app/view/home.dart';
import 'package:los_app/view/main_login_view.dart';
import 'package:los_app/view/routes.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<UserProvider>(
      create: (_) => UserProvider(),
      child: MaterialApp(
        title: "LOS",
        onGenerateRoute: initGeneratedRoutes,
        theme: ThemeData(
          colorScheme: lightColorScheme,
          useMaterial3: true,
        ),
        home: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const Home();
            }
            return const MainLoginView();
          },
        ),
      ),
    );
  }
}
