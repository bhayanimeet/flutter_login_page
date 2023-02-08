import 'package:flutter/material.dart';
import 'package:login_screen/views/screens/global.dart';
import 'package:login_screen/views/screens/home.dart';
import 'package:login_screen/views/screens/signup.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool? isLogged = prefs.getBool('isLogged') ?? false;
  bool? isSigned = prefs.getBool('isSignup') ?? false;

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: (isLogged == true)
          ? 'sign'
          : (isSigned == true)
              ? 'home'
              : '/',
      routes: {
        '/': (context) => const LoginScreen(),
        'home': (context) => const HomePage(),
        'sign': (context) => const Signup(),
      },
    ),
  );
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                  "Registration",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 100),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  onSaved: (val) {
                    setState(() {
                      Global.username = val;
                    });
                  },
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Enter username";
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
                    hintText: "Enter username",
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                    labelText: "Username",
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
                  onSaved: (val) {
                    setState(() {
                      Global.email = val;
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
                  // obscureText: true,
                  controller: Global.passwordController,
                  onChanged: (val) {
                    setState(() {
                      Global.password = val;
                    });
                  },
                  onSaved: (val) {
                    setState(() {
                      Global.password = val;
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
                const SizedBox(height: 30),
                TextFormField(
                  // obscureText: true,
                  onSaved: (val) {
                    setState(() {
                      Global.confirmPassword = val;
                    });
                  },
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Enter username";
                    } else if (val == Global.password) {
                      return null;
                    } else {
                      return "Enter proper password";
                    }
                  },
                  cursorColor: Colors.grey,
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
                    hintText: "Enter confirm password",
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                    labelText: "confirm password",
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
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        await prefs.setBool('isLogged', true);
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
                      "Login",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
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
