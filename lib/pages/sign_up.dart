import 'package:flutter/material.dart';
import 'package:to_do_list/shared/date_timenow.dart';
import 'package:to_do_list/shared/shared_preferences.dart';
import 'package:to_do_list/shared/snackbar.dart';
import 'package:to_do_list/shared/theme.dart';
import 'package:to_do_list/widgets/wbutton.dart';
import 'package:to_do_list/widgets/wform.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  void register(
    BuildContext ctx,
    String nama,
    String email,
    String pass,
  ) {
    SharedPrefUtils.saveNama(nama);
    SharedPrefUtils.saveEmail(email);
    SharedPrefUtils.savePassword(pass);
    SharedPrefUtils.saveTanggalGabung(DateTimeNow.now());

    CustomSnackBar.showToast(ctx, 'Berhasil simpan!');
    Navigator.pushNamed(ctx, '/sign-in');
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController namaCotroller = TextEditingController();
    final TextEditingController emailCotroller = TextEditingController();
    final TextEditingController passwordCotroller = TextEditingController();

    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          Container(
            width: 200,
            height: 200,
            margin: const EdgeInsets.only(
              top: 60,
            ),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/dlogo.png'),
              ),
            ),
          ),
          Text(
            'Sign Up',
            style: blackTextStyle.copyWith(
              fontSize: 20,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: whiteColor),
            child: Column(
              children: [
                CustomFormField(
                  title: 'Nama',
                  controller: namaCotroller,
                ),
                const SizedBox(
                  height: 8,
                ),
                CustomFormField(
                  title: 'Alamat Email',
                  controller: emailCotroller,
                ),
                const SizedBox(
                  height: 8,
                ),
                CustomFormField(
                  title: 'Password',
                  obscureText: true,
                  controller: passwordCotroller,
                ),
                const SizedBox(
                  height: 38,
                ),
                CustomFillButton(
                  title: 'Register',
                  onPressed: () {
                    register(
                      context,
                      namaCotroller.text,
                      emailCotroller.text,
                      passwordCotroller.text,
                    );
                  },
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          CustomTextButton(
            title: 'Sign In',
            onPressed: () {
              Navigator.pushNamed(context, '/sign-in');
            },
          )
        ],
      ),
    );
  }
}
