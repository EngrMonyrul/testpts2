import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testpts/views/homePage/home_page_view.dart';
import 'package:testpts/views/registrationPage/subViews/loginPage/login_page_view.dart';
import 'package:testpts/views/registrationPage/subViews/signupPage/providers/signup_page_provider.dart';
import 'package:testpts/views/registrationPage/subViews/signupPage/signup_page_view.dart';

import '../../../homePage/providers/home_page_provider.dart';

class SignUpPageView extends StatefulWidget {
  const SignUpPageView({super.key});

  @override
  State<SignUpPageView> createState() => _SignUpPageViewState();
}

class _SignUpPageViewState extends State<SignUpPageView> {
  void tappedSignUp() async {
    final signupPageProvider =
        Provider.of<SignupPageProvider>(context, listen: false);
    final homePageProvider =
        Provider.of<HomePageProvider>(context, listen: false);
    await signupPageProvider.setSignUp().then((value) async {
      if (signupPageProvider.canNavigate) {
        await homePageProvider.getAllData(
            userToken: signupPageProvider.logInSuccessModel.data!.token!);
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const HomePageView()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final signupPageProvider = Provider.of<SignupPageProvider>(context);
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
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account?"),
                    const SizedBox(width: 5),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginPageView()));
                      },
                      child: const Text(
                        'Sign In',
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
                  controller: signupPageProvider.name,
                  decoration: InputDecoration(
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    hintText: 'Username',
                    filled: true,
                    fillColor: Colors.grey.shade200,
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: signupPageProvider.email,
                  decoration: InputDecoration(
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    hintText: 'Email',
                    filled: true,
                    fillColor: Colors.grey.shade200,
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: signupPageProvider.password,
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
                const SizedBox(height: 10),
                TextField(
                  controller: signupPageProvider.confirmPassword,
                  decoration: InputDecoration(
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    hintText: 'Confirm Password',
                    filled: true,
                    fillColor: Colors.grey.shade200,
                  ),
                ),
                Row(
                  children: [
                    CupertinoCheckbox(
                      value: false,
                      onChanged: (value) {},
                    ),
                    const Text('I agree to the'),
                    const Text(
                      ' Terms & Conditions',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: tappedSignUp,
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: CupertinoColors.activeBlue,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
