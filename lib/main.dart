import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/database/todolist_provider.dart';
import 'package:to_do_list/pages/menu_page.dart';
import 'package:to_do_list/pages/profile.dart';
import 'package:to_do_list/pages/sign_in..dart';
import 'package:to_do_list/pages/sign_up.dart';
import 'package:to_do_list/pages/splash.dart';

import 'package:to_do_list/shared/theme.dart';

void main(List<String> args) {
  runApp(const Todo());
}

class Todo extends StatefulWidget {
  const Todo({super.key});

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => TodoList(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: AppBarTheme(
              iconTheme: IconThemeData(color: blackColor),
              centerTitle: true,
              backgroundColor: whiteColor,
              elevation: 0),
        ),
        routes: {
          '/': (context) => const Splash(),
          '/sign-in': (context) => const SignInPage(),
          '/sign-up': (context) => const SignUpPage(),
          '/menu': (context) => const MyMenu(),
          '/profile': (context) => const ProfilePage(),
        },
      ),
    );
  }
}
