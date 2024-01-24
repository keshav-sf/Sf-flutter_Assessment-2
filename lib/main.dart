import 'package:flutter/material.dart';
import 'package:sf_assessment2/login.dart';
import 'package:sf_assessment2/register.dart';

void main() {
  runApp(const MaterialApp(
    home: SafeArea(
      child: Scaffold(
        backgroundColor: Colors.purple,
        body: Login(),
      ),
    ),
  ));
}
