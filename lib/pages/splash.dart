import 'package:flutter/material.dart';
import 'dart:async';

import 'package:to_do_list/shared/theme.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 2),
      () {
        Navigator.pushNamedAndRemoveUntil(
          context,
          '/menu',
          (route) => false,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: Duration(seconds: 2),
              width: 300,
              height: 300,
              curve: Curves.easeIn,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/logo.png'),
                ),
              ),
            ),
            Text(
              'ToDoList',
              style:
                  blackTextStyle.copyWith(fontSize: 70, fontWeight: semiBold),
            ),
          ],
        ),
      ),
    );
  }
}
