import 'package:flutter/widgets.dart';
import 'package:todo_app/auth.dart';
import 'package:todo_app/pages/home_page.dart';
import 'package:todo_app/pages/login_register_page.dart';
import 'package:flutter/material.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(stream: Auth().authStateChanges, builder: (context, snapshot){
      if(snapshot.hasData) {
        return const HomePage();
      } else {
        return const LoginPage();
      }
    },
    );
  }
}