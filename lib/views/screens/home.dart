import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MY APPLICATION"),
        centerTitle: true,
        leading: Container(),
        actions: [
          GestureDetector(
              onTap: () {
                setState(() {
                  Navigator.pushNamed(context, 'sign');
                });
              },
              child: const Icon(Icons.power_settings_new_sharp)),
        ],
      ),
      body: Center(
        child: Text("Hii"),
      ),
    );
  }
}
