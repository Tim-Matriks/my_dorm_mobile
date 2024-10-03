import 'package:flutter/material.dart';
import 'package:my_dorm/components/gradient_button.dart';
import 'package:my_dorm/components/login_textfield.dart';
import 'package:my_dorm/constant/constant.dart';
import 'package:my_dorm/screens/auth/pilih_role.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 200,
              alignment: Alignment.bottomCenter,
              decoration: const BoxDecoration(gradient: kGradientMain),
              child: SafeArea(
                  bottom: false,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset('images/bg-asrama-wide.png',
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'images/dorm-logo-bg-remove.png',
                      width: 80,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Login',
                      style: kBoldTextStyle.copyWith(fontSize: 30),
                    ),
                    const SizedBox(
                      height: 55,
                    ),
                    LoginTextField(
                        label: 'Username',
                        controller: _usernameController,
                        isPassword: false),
                    const SizedBox(
                      height: 20,
                    ),
                    LoginTextField(
                        label: 'Password',
                        controller: _passwordController,
                        isPassword: true),
                    const SizedBox(
                      height: 70,
                    ),
                    GradientButton(
                      title: 'Login',
                      ontap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const PIlihRole()));
                      },
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
