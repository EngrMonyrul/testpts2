// ignore_for_file: use_build_context_synchronously

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testpts/views/homePage/home_page_view.dart';
import 'package:testpts/views/homePage/providers/home_page_provider.dart';
import 'package:testpts/views/registrationPage/subViews/loginPage/providers/login_page_provider.dart';
import 'package:testpts/views/registrationPage/subViews/signupPage/signup_page_view.dart';

class LoginPageView extends StatefulWidget {
  const LoginPageView({super.key});

  @override
  State<LoginPageView> createState() => _LoginPageViewState();
}

class _LoginPageViewState extends State<LoginPageView> {
  void SignInPressed() async {
    final loginPageProvider =
        Provider.of<LoginPageProvider>(context, listen: false);
    final homePageProvider =
        Provider.of<HomePageProvider>(context, listen: false);
    // await loginPageProvider.setSignIn().then((value) async {
    //   if(loginPageProvider.canNavigate){
    //     await homePageProvider.getAllData(userToken: loginPageProvider.logInSuccessModel.data!.token!);
    //     Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePageView()));
    //   }
    // });
    bool success = await loginPageProvider.getLogin(
        name: 'a222@gmail.com', password: '123456');
    if (success) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const HomePageView()));
    } else {}
  }

  void SignUpPressed() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const SignUpPageView()));
  }

  @override
  Widget build(BuildContext context) {
    final loginPageProvider = Provider.of<LoginPageProvider>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * .2),
                const Text(
                  'Sign In',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?"),
                    const SizedBox(width: 5),
                    GestureDetector(
                      onTap: SignUpPressed,
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * .1),
                TextField(
                  controller: loginPageProvider.name,
                  decoration: InputDecoration(
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    hintText: 'Email/Username',
                    filled: true,
                    fillColor: Colors.grey.shade200,
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: loginPageProvider.password,
                  decoration: InputDecoration(
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    hintText: 'Password',
                    filled: true,
                    fillColor: Colors.grey.shade200,
                  ),
                ),
                Row(
                  children: [
                    CupertinoCheckbox(
                      value: loginPageProvider.rememberMe,
                      onChanged: (value) {
                        loginPageProvider.setRememberMe(value: value!);
                      },
                    ),
                    const Text('Remember Me'),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {},
                      child: const Text(
                        'Forget Password?',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: SignInPressed,
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: CupertinoColors.activeBlue,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: const Text(
                      'Sign In',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Text(
                    'Or use',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 1,
                      child: GestureDetector(
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          decoration: const BoxDecoration(
                            color: CupertinoColors.activeBlue,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.facebook,
                                color: Colors.white,
                              ),
                              SizedBox(width: 5),
                              Text(
                                'Facebook',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Flexible(
                      flex: 1,
                      child: GestureDetector(
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 7),
                          decoration: const BoxDecoration(
                            color: Colors.deepOrangeAccent,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.g_mobiledata,
                                color: Colors.white,
                                size: 30,
                              ),
                              SizedBox(width: 5),
                              Text(
                                'Google',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
