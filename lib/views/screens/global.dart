import 'package:flutter/material.dart';

class Global{
  static String? username;
  static String? email;
  static String? reEmail;
  static String? password;
  static String? rePassword;
  static String? confirmPassword;
  static TextEditingController passwordController = TextEditingController();
  static TextEditingController emailController = TextEditingController(text: email);
  static TextEditingController rePasswordController = TextEditingController(text: password);
}