import 'package:d_info/d_info.dart';
import 'package:flutter/material.dart';
import 'package:robot_tambak/config/app_asset.dart';
import 'package:robot_tambak/config/app_color.dart';

import '../config/app_route.dart';
import '../source/user_source.dart';

class SigninPage extends StatelessWidget {
  SigninPage({super.key});
  final controllerEmail = TextEditingController();
  final controllerPassword = TextEditingController();
  final formkey = GlobalKey<FormState>();
  login(BuildContext context) {
    if (formkey.currentState!.validate()) {
      UserSource.signIn(controllerEmail.text, controllerPassword.text)
          .then((response) {
        if (response['success']) {
          DInfo.dialogSuccess(context, response['message']);
          DInfo.closeDialog(context, actionAfterClose: () {
            Navigator.pushNamed(context, AppRoute.home);
          });
        } else {
          DInfo.toastError(response['message']);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(child: Container(
          child: LayoutBuilder(builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(AppAsset.login2),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text('Welcome',
                        style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins',
                            color: AppColor.secondary)),
                    Image.asset(
                      AppAsset.login_logo,
                      height: 250,
                      width: 323,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Login',
                            style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Poppins',
                                color: AppColor.secondary)),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Form(
                        key: formkey,
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: TextFormField(
                                controller: controllerEmail,
                                validator: (value) =>
                                    value == '' ? "Don't empty" : null,
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.email),
                                  filled: true,
                                  fillColor: Colors.white,
                                  isDense: true,
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 16),
                                  hintText: 'Email Address',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide: const BorderSide(
                                          color: AppColor.secondary)),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide: BorderSide.none),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: TextFormField(
                                controller: controllerPassword,
                                validator: (value) =>
                                    value == '' ? "Don't empty" : null,
                                obscureText: true,
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.password),
                                  filled: true,
                                  fillColor: Colors.white,
                                  isDense: true,
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 16),
                                  hintText: 'Password',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide: const BorderSide(
                                          color: AppColor.secondary)),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide: BorderSide.none),
                                ),
                              ),
                            ),
                          ],
                        )),
                    const SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                        style: ButtonStyle(
                            fixedSize: MaterialStateProperty.all<Size>(
                                const Size(250, 50)),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                AppColor.primary)),
                        onPressed: () {
                          login(context);
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(fontSize: 24),
                        )),
                  ],
                ),
              ),
            );
          }),
        )));
  }
}
