import 'package:flutter/widgets.dart';
import 'package:todo_app/services/auth_service.dart';
import 'package:todo_app/route/auth_route.dart';
import 'package:todo_app/pages/home/home_page.dart';
import 'package:flutter/material.dart';

class HomeRoute extends StatefulWidget {
  const HomeRoute({super.key});

  @override
  State<HomeRoute> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<HomeRoute> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(stream: Auth().authStateChanges, builder: (context, snapshot){
      if(snapshot.hasData) {
        return const HomePage();
      } else {
        return const AuthPage();
      }
    },
    );
  }
}