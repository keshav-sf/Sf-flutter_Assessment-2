// ignore_for_file: body_might_complete_normally_nullable, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:sf_assessment2/user.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<StatefulWidget> createState() {
    return _RegisterState();
  }
}

class _RegisterState extends State<Register> {
  var passwordHide = true;
  var confirmPasswordHide = true;
  String? passwordValue;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: double.infinity,
          leading: const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                // IconButton(
                //   onPressed: () {
                //     Navigator.pop(context);
                //   },
                //   icon: const Icon(Icons.arrow_back_ios),
                // ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Register",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Create your account",
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
          ),
          // toolbarHeight: 160,
          toolbarHeight: 100,
          foregroundColor: Colors.white,
          backgroundColor: const Color.fromARGB(255, 96, 5, 55),
        ),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  TextFormField(
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      labelText: 'Name',
                      hintText: 'Enter Your Name',
                    ),
                    validator: (value) {
                      if (value!.isEmpty || value == null) {
                        return 'Name cannot be blank';
                      } else if (!RegExp('[a-zA-Z]').hasMatch(value)) {
                        return "Name Should Conatain only character.";
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      labelText: 'Email',
                      hintText: 'Enter Your Email',
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
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    obscureText: passwordHide,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
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
                      // suffixIcon: Icon(Icons.remove_red_eye_outlined),
                      border: const OutlineInputBorder(
                          borderSide: BorderSide(width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      labelText: 'Password',
                      hintText: 'Enter the Password',
                    ),
                    validator: (value) {
                      setState(() {
                        passwordValue = value;
                      });
                      if (value!.isEmpty || value == null) {
                        return 'Password cannot be blank';
                      } else if (!RegExp(
                              r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                          .hasMatch(value)) {
                        return "Password Should Contain 8 Letters, \nUpper case, Lower case,Number and\nSpecial Character( ! @ # \$ & * ~ )";
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    obscureText: confirmPasswordHide,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              confirmPasswordHide = !confirmPasswordHide;
                            });
                          },
                          icon: confirmPasswordHide
                              ? const Icon(Icons.visibility_off_outlined)
                              : const Icon(Icons.remove_red_eye_outlined)),
                      border: const OutlineInputBorder(
                          borderSide: BorderSide(width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      labelText: 'Confirm Password',
                      hintText: 'Enter the Password Again',
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                    ),
                    validator: (value) {
                      if (value!.isEmpty || value == null) {
                        return 'Confirm Password cannot be blank';
                      } else if (passwordValue != value) {
                        return 'Password & Confirm Password doesn\'t match ';
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.yellow,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      minimumSize: const Size(double.infinity, 45),
                    ),
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
                                      size: MediaQuery.of(context).size.width *
                                          0.25,
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    const Text(
                                      "Registration is SuccessFull!",
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
                                      builder: (context) => const UserAccount(),
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
                    child: const Text(
                      'Register',
                      style: TextStyle(
                          fontSize: 17,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("I have an account?"),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "Login",
                          style: TextStyle(color: Colors.yellow),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
