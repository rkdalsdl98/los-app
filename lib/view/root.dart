import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:los_app/design/color_schemes.g.dart';
import 'package:los_app/provider/user_provider.dart';
import 'package:los_app/view/home.dart';
import 'package:los_app/view/main_login_view.dart';
import 'package:los_app/view/routes.dart';
import 'package:provider/provider.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLogined = false;

  @override
  void initState() {
    super.initState();
    isLogined = FirebaseAuth.instance.currentUser != null;
  }

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
        home: isLogined ? const Home() : const MainLoginView(),
      ),
    );
  }
}
