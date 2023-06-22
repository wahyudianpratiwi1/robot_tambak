import 'package:d_info/d_info.dart';
import 'package:flutter/material.dart';

import '../config/app_asset.dart';
import '../config/app_color.dart';
import '../config/app_route.dart';
import '../source/user_source.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});
  final email = TextEditingController();
  final password = TextEditingController();
  final namaLengkap = TextEditingController();
  final confirmpassword = TextEditingController();
  final formkey = GlobalKey<FormState>();

  String get emailText => email.text.trim();
  String get passwordText => password.text.trim();
  String get namaLengkapText => namaLengkap.text.trim();
  String get confirmpasswordText => confirmpassword.text.trim();

  register(BuildContext context) {
    if (formkey.currentState!.validate()) {
      if (passwordText == confirmpasswordText) {
        UserSource.signup(
                namaLengkapText, emailText, passwordText, confirmpasswordText)
            .then((response) {
          if (response['success']) {
            DInfo.dialogSuccess(context, response['message']);
            DInfo.closeDialog(context, actionAfterClose: () {
              Navigator.pushNamed(context, AppRoute.signin);
            });
          } else {
            DInfo.toastError(response['message']);
          }
        });
      } else {
        DInfo.toastError('Password not match');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(child:
            Container(child: LayoutBuilder(builder: (context, constraints) {
          return SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  Image.asset(AppAsset.login2),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text('Register',
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                          color: AppColor.secondary)),
                  const SizedBox(
                    height: 50,
                  ),
                  Form(
                    key: formkey,
                    child: Column(
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 10.0, right: 10.0),
                          child: TextFormField(
                            controller: namaLengkap,
                            validator: (value) =>
                                value == '' ? "Don't empty" : null,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.person),
                              filled: true,
                              fillColor: Colors.white,
                              isDense: true,
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 16),
                              hintText: 'Nama Lengkap',
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
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: TextFormField(
                            controller: email,
                            validator: (value) =>
                                value == '' ? "Don't empty" : null,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.email),
                              filled: true,
                              fillColor: Colors.white,
                              isDense: true,
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 16),
                              hintText: 'Email',
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
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: TextFormField(
                            controller: password,
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
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: TextFormField(
                            controller: confirmpassword,
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
                              hintText: 'Konfirmasi Password',
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
                          height: 30,
                        ),
                        ElevatedButton(
                            style: ButtonStyle(
                                fixedSize: MaterialStateProperty.all<Size>(
                                    const Size(250, 50)),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        AppColor.primary)),
                            onPressed: () {
                              register(context);
                            },
                            child: const Text(
                              'Register',
                              style: TextStyle(fontSize: 24),
                            )),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        }))));
  }
}
