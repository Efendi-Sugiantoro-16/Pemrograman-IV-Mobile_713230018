import 'package:flutter/material.dart';

class AppMaterial extends StatefulWidget {
  const AppMaterial({super.key});

  @override
  State<AppMaterial> createState() => _MyWidgetState();
}
class _MyWidgetState extends State<AppMaterial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        backgroundColor: Colors.green,
      ),
      body: Center(child: Center(child: Text('ini adalah Material App'))),
    );
  }
}