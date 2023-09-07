import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:to_do_list/shared/theme.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key, this.drawer, this.bgcolor});

  final Widget? drawer;
  final Color? bgcolor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: purpleColor,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 40),
              child: Image.asset('assets/dlogo.png'),
            ),
            Expanded(
              child: Container(
                color: whiteColor2,
                child: Container(
                  margin: EdgeInsets.all(16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextButton(
                        onHover: (value) {
                          TextStyle(
                            color: value ? Colors.red : Colors.black,
                          );
                        },
                        onPressed: () {
                          exitApp();
                        },
                        child: Text(
                          'Exit',
                          style: blackTextStyle.copyWith(
                              fontSize: 34, fontWeight: semiBold),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void exitApp() {
    SystemNavigator.pop();
  }
}
