import 'package:flutter/material.dart';
import 'package:to_do_list/shared/shared_preferences.dart';
import 'package:to_do_list/shared/snackbar.dart';
import 'package:to_do_list/shared/theme.dart';
import 'package:to_do_list/widgets/wbutton.dart';
import 'package:to_do_list/widgets/wform.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  void login(BuildContext ctx, String email, String pass) async {
    if (email.isEmpty && pass.isEmpty) {
      CustomSnackBar.showToast(ctx, 'Inputan masih kosong!');
    } else {
      String pEmail = await SharedPrefUtils.readEmail();
      String pPassword = await SharedPrefUtils.readPassword();
      if (email == pEmail && pass == pPassword) {
        Navigator.pushNamedAndRemoveUntil(ctx, '/menu', (route) => false);
      } else {
        CustomSnackBar.showToast(ctx, 'Login Gagal!');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
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
            'Sign In Now',
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
                  title: 'Sign In',
                  onPressed: () {
                    login(
                      context,
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
            title: 'Dont have accound? Sign Up',
            onPressed: () {
              Navigator.pushNamed(context, '/sign-up');
            },
          )
        ],
      ),
    );
  }
}
