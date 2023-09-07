import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do_list/database/todolist_provider.dart';
import 'package:to_do_list/model/todo.dart';
import 'package:to_do_list/pages/sign_in..dart';
import 'package:to_do_list/shared/shared_preferences.dart';
import 'package:to_do_list/shared/theme.dart';
import 'package:to_do_list/widgets/wadd.dart';
import 'package:to_do_list/widgets/wjam.dart';
import 'package:to_do_list/widgets/wtextvertical.dart';
import 'package:to_do_list/widgets/wtodo.dart';

class MyMenu extends StatefulWidget {
  const MyMenu({super.key});

  @override
  State<MyMenu> createState() => _MyMenuState();
}

class _MyMenuState extends State<MyMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          width: 300,
          backgroundColor: purpleColor,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                child: Image.asset('assets/dlogo.png'),
              ),
              Expanded(
                child: Container(
                  color: whiteColor2,
                  width: double.infinity,
                  child: Container(
                    margin: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SignInPage(),
                                ),
                                (route) => false);
                          },
                          child: Text(
                            'Logout',
                            style: blackTextStyle.copyWith(
                                fontSize: 26, fontWeight: semiBold),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            exitApp();
                          },
                          child: Text(
                            'Exit',
                            style: blackTextStyle.copyWith(
                                fontSize: 26, fontWeight: semiBold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          actions: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/profile');
              },
              child: FutureBuilder(
                future: SharedPrefUtils.readNameImage(),
                builder: (context, snapshot) {
                  return Container(
                    width: 60,
                    height: 60,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image:
                          DecorationImage(image: AssetImage('assets/logo.png')),
                    ),
                  );
                },
              ),
            ),
          ],
          title: Text(
            'ToDoList',
            style: blackTextStyle.copyWith(fontSize: 40, fontWeight: semiBold),
          ),
        ),
        body: Consumer<TodoList>(
          builder: (
            context,
            todoProvider,
            child,
          ) {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 165,
                      width: 165,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/jam.png'))),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 100),
                      child: const ClockWidget(),
                    )
                  ],
                ),
                Expanded(
                  child: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/Pola.png'),
                            fit: BoxFit.fill),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 100),
                        child: ListView(
                            children: todoProvider.todoList.isNotEmpty
                                ? todoProvider.todoList.map((todo) {
                                    return Dismissible(
                                      key: Key(todo.id),
                                      background: Container(
                                        color: purpleColor2,
                                        child: Center(
                                            child: Text(
                                          'Hapus?',
                                          style: whiteTextStyle.copyWith(
                                              fontSize: 30),
                                        )),
                                      ),
                                      child: Card(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 10),
                                        child: ListTile(
                                          shape: RoundedRectangleBorder(
                                              side: BorderSide(
                                            color: blackColor,
                                            width: 2,
                                          )),
                                          onTap: () {
                                            showDialog(
                                              context: context,
                                              builder: (context) {
                                                return Add(
                                                  title: 'Edit Todo',
                                                  todo: todo,
                                                );
                                              },
                                            );
                                          },
                                          // isThreeLine: true,
                                          // contentPadding: EdgeInsets.only(
                                          //     bottom: 30, left: 30,),
                                          leading: todo.isChecked
                                              ? Icon(
                                                  Icons.content_paste_off,
                                                  size: 36,
                                                  color: purpleColor2,
                                                )
                                              : Icon(
                                                  Icons.paste_rounded,
                                                  size: 36,
                                                  color: purpleColor2,
                                                ),
                                          title: Text(
                                            todo.todo,
                                            style: todo.isChecked
                                                ? blackTextStyle.copyWith(
                                                    decoration: TextDecoration
                                                        .lineThrough,
                                                    decorationThickness: 4.0,
                                                  )
                                                : blackTextStyle,
                                          ),
                                          subtitle: todo.isChecked
                                              ? Text(
                                                  'finished',
                                                  style: greyTextStyle,
                                                )
                                              : Text(
                                                  todo.todo2,
                                                  style: greyTextStyle,
                                                ),
                                          trailing: Checkbox(
                                            activeColor: purpleColor2,
                                            value: todo.isChecked,
                                            onChanged: (bool? value) {
                                              setState(() {
                                                todo.isChecked = value ?? false;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                      onDismissed: (direction) {
                                        Provider.of<TodoList>(
                                          context,
                                          listen: false,
                                        ).removeTodo(todo);
                                      },
                                    );
                                  }).toList()
                                : [
                                    SizedBox(
                                      height: 200,
                                      child: Center(
                                        child: Text(
                                          'Todo Kosong',
                                          style: whiteTextStyle.copyWith(
                                              fontSize: 30,
                                              fontWeight: semiBold),
                                        ),
                                      ),
                                    ),
                                  ]),
                      )),
                )
              ],
            );
          },
        ),
        floatingActionButton: Container(
          height: 80,
          width: 80,
          margin: const EdgeInsets.only(right: 10),
          child: FloatingActionButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const Add(
                    title: 'Tambah Todo',
                  );
                },
              );
            },
            backgroundColor: purpleColor,
            child: Icon(
              Icons.add,
              size: 50,
              color: blackColor,
            ),
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: blackColor,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(60),
            ),
          ),
        ));
  }

  void exitApp() {
    SystemNavigator.pop();
  }
}
