import 'package:flutter/material.dart';
import 'login_page.dart';
class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color(0xffB81736),
              Color(0xff281537),
            ]),
          ),
          child: const Padding(
            padding: EdgeInsets.only(top: 60.0, left: 22),
            child: Text(
              'Create\nYour Account!',
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 200.0),
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40), topRight: Radius.circular(40)),
              color: Colors.white,
            ),
            height: double.infinity,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(left: 18.0, right: 18),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const TextField(
                    decoration: InputDecoration(
                        label: Text(
                      'Display Name',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xffB81736),
                      ),
                    )),
                  ),
                  const TextField(
                    decoration: InputDecoration(
                        label: Text(
                      'Email',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xffB81736),
                      ),
                    )),
                  ),
                  const TextField(
                    decoration: InputDecoration(
                        label: Text(
                      'Password',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xffB81736),
                      ),
                    )),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  Container(
                    height: 55,
                    width: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      gradient: const LinearGradient(colors: [
                        Color(0xffB81736),
                        Color(0xff281537),
                      ]),
                    ),
                    child: const Center(
                      child: Text(
                        'REGISTER',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          "Have an account?",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.grey),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                          "Sign In",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              color: Colors.black),
                        ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
