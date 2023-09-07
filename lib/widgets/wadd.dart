import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/database/todolist_provider.dart';
import 'package:to_do_list/model/todo.dart';
import 'package:to_do_list/shared/theme.dart';
import 'package:uuid/uuid.dart';

class Add extends StatelessWidget {
  const Add({Key? key, this.todo, required this.title}) : super(key: key);

  final TodoData? todo;
  final String title;

  @override
  Widget build(BuildContext context) {
    TextEditingController _titleControl = TextEditingController();
    TextEditingController _taskControl = TextEditingController();
    bool isChecked = false;

    if (todo != null) {
      _titleControl.text = todo!.todo;
      _taskControl.text = todo!.todo2;
      isChecked = todo!.isChecked;
    }
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.elliptical(30, 80),
            bottomRight:
                Radius.elliptical(40, 80)), // Menentukan sudut melengkung
      ),
      title: Text(
        title,
        style: blackTextStyle,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5), // Warna bayangan
                  spreadRadius: 2, // Jarak penyebaran bayangan
                  blurRadius: 5, // Jarak blur bayangan
                  offset: Offset(0, 3), // Posisi bayangan (x, y)
                ),
              ],
            ),
            child: TextFormField(
              style: blackTextStyle,
              controller: _titleControl,
              decoration: InputDecoration(
                fillColor: whiteColor2,
                filled: true,
                hintText: 'Title .....',
                hintStyle: greyTextStyle.copyWith(fontSize: 20),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: blackColor),
                ),
                // enabledBorder: OutlineInputBorder(
                //   borderRadius: BorderRadius.circular(20),
                //   borderSide: BorderSide(color: blackColor),
                // ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5), // Warna bayangan
                  spreadRadius: 2, // Jarak penyebaran bayangan
                  blurRadius: 5, // Jarak blur bayangan
                  offset: Offset(0, 3), // Posisi bayangan (x, y)
                ),
              ],
            ),
            child: TextFormField(
              controller: _taskControl,
              style: blackTextStyle,
              maxLines: 3,
              decoration: InputDecoration(
                fillColor: whiteColor2,
                filled: true,
                hintText: 'Enter Your Task .....',
                hintStyle: greyTextStyle.copyWith(fontSize: 20),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: blackColor),
                ),
                // enabledBorder: OutlineInputBorder(
                //   borderRadius: BorderRadius.circular(20),
                //   borderSide: BorderSide(color: blackColor),
                // ),
              ),
            ),
          ),
        ],
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Close',
                style:
                    blackTextStyle.copyWith(fontSize: 20, fontWeight: semiBold),
              ),
            ),
            TextButton(
              onPressed: () {
                if (_titleControl.text.isEmpty && _taskControl.text.isEmpty) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Error'),
                        content: Text('Inputan Masih Kosong'),
                      );
                    },
                  );
                } else {
                  if (todo != null) {
                    Provider.of<TodoList>(context, listen: false).updateTodo(
                        TodoData(
                            id: todo!.id,
                            isChecked: isChecked,
                            todo: _titleControl.text,
                            todo2: _taskControl.text));
                  } else {
                    const uuid = Uuid();
                    Provider.of<TodoList>(context, listen: false).addTodo(
                        TodoData(
                            isChecked: isChecked,
                            id: uuid.v4(),
                            todo: _titleControl.text,
                            todo2: _taskControl.text));
                  }
                  Navigator.pop(context);
                }
              },
              child: Text(
                'Save',
                style:
                    blackTextStyle.copyWith(fontSize: 20, fontWeight: semiBold),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
