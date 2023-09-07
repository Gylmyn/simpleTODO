import 'package:flutter/material.dart';
import 'package:to_do_list/shared/shared_preferences.dart';
import 'package:to_do_list/shared/theme.dart';
import 'package:to_do_list/widgets/wprofile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Profile',
          style: blackTextStyle,
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/menu');
            },
            icon: Icon(
              Icons.arrow_back,
              color: blackColor,
            )),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          const SizedBox(
            height: 30,
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 22,
            ),
            decoration: BoxDecoration(
              color: purpleColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/avatar');
                  },
                  child: FutureBuilder(
                    future: SharedPrefUtils.readNameImage(),
                    builder: (context, snapshot) {
                      return Container(
                        margin: EdgeInsets.only(top: 20),
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: snapshot.data == null
                                ? const AssetImage('assets/dlogo.png')
                                : AssetImage(
                                    'assets/${snapshot.data}.png',
                                  ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                FutureBuilder(
                  future: SharedPrefUtils.readNama(),
                  builder: (context, snapshot) {
                    return Text(
                      '${snapshot.data}',
                      style: blackTextStyle.copyWith(
                        fontSize: 24,
                        fontWeight: medium,
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 5,
                ),
                FutureBuilder(
                  future: SharedPrefUtils.readEmail(),
                  builder: (context, snapshot) {
                    return Text(
                      '${snapshot.data}',
                      style: blackTextStyle.copyWith(
                        fontSize: 15,
                        color: whiteColor2,
                        fontWeight: medium,
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 40,
                ),
                FutureBuilder(
                  future: SharedPrefUtils.readTanggalGabung(),
                  builder: (context, snapshot) {
                    return ProfileMenuItem(
                      // iconUrl: 'assets/user.png',
                      title: 'Bergabung Sejak',
                      subTitle: snapshot.data.toString(),
                      tag: 1,
                    );
                  },
                ),
                ProfileMenuItem(
                  // iconUrl: 'assets/logout.png',
                  title: 'Log out',
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/sign-in', (route) => false);
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
