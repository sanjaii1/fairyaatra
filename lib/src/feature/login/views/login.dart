import 'package:fairyaatra/src/feature/login/widget/loginWidget.dart';
import 'package:fairyaatra/src/feature/login/widget/signupWidget.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin = true; 

  void showLogin() {
    setState(() {
      isLogin = true;
    });
  }

  void showSignup() {
    setState(() {
      isLogin = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 0, 2, 4),
              Color.fromARGB(255, 17, 17, 17),
              Color.fromARGB(255, 72, 5, 5),
            ],
            stops: [0.0, 0.5, 1.0],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Header
                    RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: "Rare, ",
                            style: TextStyle(
                                fontSize: 26,
                                color: Color.fromARGB(255, 183, 20, 9),
                                fontFamily: 'Pacifico',
                                fontWeight: FontWeight.normal,
                                fontStyle: FontStyle.italic),
                          ),
                          TextSpan(
                            text: "Like Your ",
                            style: TextStyle(
                                fontSize: 22,
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                                fontFamily: 'Pacifico',
                                fontStyle: FontStyle.italic),
                          ),
                          TextSpan(
                            text: "Adventures",
                            style: TextStyle(
                                fontSize: 22,
                                color: Colors.white,
                                fontFamily: 'Pacifico',
                                fontWeight: FontWeight.normal,
                                fontStyle: FontStyle.italic),
                          ),
                        ],
                      ),
                    ),
                    // const SizedBox(height: 15),
                    const Text(
                      "Compare the best prices",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 30),
                    // Toggle Tabs
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFF5F5F5),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: showLogin,
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Text(
                                  "Login",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: isLogin ? Colors.blue : Colors.grey,
                                    fontWeight: isLogin
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: showSignup,
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Text(
                                  "Signup",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: isLogin ? Colors.grey : Colors.blue,
                                    fontWeight: isLogin
                                        ? FontWeight.normal
                                        : FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    // AnimatedSwitcher with Fade + Scale Transition
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 250),
                      switchInCurve: Curves.easeInOut,
                      switchOutCurve: Curves.easeInOut,
                      transitionBuilder:
                          (Widget child, Animation<double> animation) {
                        return FadeTransition(
                          opacity: animation,
                          child: ScaleTransition(
                            scale: Tween<double>(begin: 0.95, end: 1.0)
                                .animate(animation),
                            child: child,
                          ),
                        );
                      },
                      child: isLogin
                          ? const LoginPage(
                              key: ValueKey('LoginPage'),
                            )
                          : const SignupPage(
                              key: ValueKey('SignupPage'),
                            ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
