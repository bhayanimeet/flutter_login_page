import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'global.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const SizedBox(height: 100),
                const Text(
                  "Sign up",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 100),
                TextFormField(
                  controller: Global.emailController,
                  textInputAction: TextInputAction.next,
                  onSaved: (val) {
                    setState(() {
                      Global.reEmail = val;
                    });
                  },
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Enter email";
                    } else {
                      return null;
                    }
                  },
                  cursorColor: Colors.grey,
                  enabled: true,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10)),
                    enabled: true,
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    hintText: "Enter Email",
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                    labelText: "email",
                    labelStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  obscureText: true,
                  controller: Global.rePasswordController,
                  onSaved: (val) {
                    setState(() {
                      Global.rePassword = val;
                    });
                  },
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Enter password";
                    } else {
                      return null;
                    }
                  },
                  cursorColor: Colors.grey,
                  enabled: true,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10)),
                    enabled: true,
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    hintText: "Enter password",
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                    labelText: "password",
                    labelStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(height: 100),
                GestureDetector(
                  onTap: () {
                    setState(() async {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        SharedPreferences prefs = await SharedPreferences.getInstance();
                        await prefs.setBool('isSignup',true);
                        Navigator.pushReplacementNamed(
                          context,
                          'home',
                        );
                      }
                    });
                  },
                  child: Container(
                    height: 45,
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.green.shade700,
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      "Sign up",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
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
