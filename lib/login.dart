// ignore_for_file: body_might_complete_normally_nullable, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:sf_assessment2/register.dart';
import 'package:sf_assessment2/user.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LoginState();
  }
}

class _LoginState extends State<Login> {
  var passwordHide = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35.0),
            child: Column(
              children: [
                Icon(
                  Icons.flutter_dash,
                  size: MediaQuery.of(context).size.height * 0.3,
                  color: Colors.green,
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          offset: Offset(0, 10),
                          blurRadius: 20,
                          spreadRadius: -5,
                        )
                      ],
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 30, horizontal: 20),
                    child: Column(
                      children: [
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.zero,
                            filled: true,
                            fillColor: Colors.grey[200],
                            prefixIcon: const Icon(
                              Icons.person,
                              color: Colors.grey,
                            ),
                            hintText: 'Email',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(35),
                                borderSide: BorderSide.none),
                          ),
                          validator: (value) {
                            if (value!.isEmpty || value == null) {
                              return 'Email cannot be blank';
                            } else if (!RegExp(
                                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                                .hasMatch(value)) {
                              return "Invalid Email! ";
                            }
                          },
                        ),
                        const SizedBox(height: 10),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          obscureText: passwordHide,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.zero,
                            filled: true,
                            fillColor: Colors.grey[200],
                            prefixIcon: const Icon(
                              Icons.lock,
                              color: Colors.grey,
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  passwordHide = !passwordHide;
                                });
                              },
                              icon: passwordHide
                                  ? const Icon(Icons.visibility_off_outlined)
                                  : const Icon(Icons.remove_red_eye_outlined),
                            ),
                            hintText: 'Password',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(35),
                                borderSide: BorderSide.none),
                          ),
                          validator: (value) {
                            if (value!.isEmpty || value == null) {
                              return 'Password cannot be blank';
                            } else if (!RegExp(
                                    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                                .hasMatch(value)) {
                              return "Password Should Contain 8 Letters, \nUpper case, Lower case,Number and\nSpecial Character( ! @ # \$ & * ~ )";
                            }
                          },
                        ),
                        const SizedBox(height: 20),

                        TextButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    content: SingleChildScrollView(
                                      child: ListBody(
                                        children: [
                                          Icon(
                                            Icons.refresh_outlined,
                                            color: Colors.red[300],
                                            size: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.25,
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          const Text(
                                            "Coming Soon",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 15,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    actions: [
                                      FilledButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text("Ok"),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            child: const Text(
                              "Forgot Password?",
                              style: TextStyle(
                                  color: Colors.black38, fontSize: 16),
                            )),
                        FilledButton(
                          style: FilledButton.styleFrom(
                              shadowColor: Colors.purple, elevation: 5),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    content: SingleChildScrollView(
                                      child: ListBody(
                                        children: [
                                          Icon(
                                            Icons.check_circle_outline,
                                            color: Colors.green,
                                            size: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.25,
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          const Text(
                                            "Login SuccessFull!",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 15,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    actions: [
                                      FilledButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                          Navigator.of(context)
                                              .push(MaterialPageRoute(
                                            builder: (context) =>
                                                const UserAccount(),
                                          ));
                                        },
                                        child: const Text("Ok"),
                                      ),
                                    ],
                                  );
                                },
                              );
                            }
                          },
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              "LOGIN",
                              style: TextStyle(fontWeight: FontWeight.normal),
                            ),
                          ),
                        ),
                        // SizedBox(height: 20),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx) => const Register(),
                            ));
                          },
                          child: const Text(
                            "SIGNUP",
                            style: TextStyle(fontSize: 17),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
