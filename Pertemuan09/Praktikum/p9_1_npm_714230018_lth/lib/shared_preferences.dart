import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

//definisikan stateful widget
class MyShared extends StatefulWidget {
  const MyShared({super.key});
  @override
  State<MyShared> createState() {
    return _MySharedState();
  }
}
//definisikan state untuk MyShared
class _MySharedState extends State<MyShared> {

  late SharedPreferences prefs;//deklarasi vaiabel prefs
  final TextEditingController _dataAja = TextEditingController();//controller untuk textfield
  String name = "";

//Override method dispose untuk membersihkan controller
  @override
  void dispose() {
    _dataAja.dispose();
    super.dispose();
  }

  save() async {
    prefs = await SharedPreferences.getInstance();//dapatkan instance
    prefs.setString('Inidata', _dataAja.text);//simpan data
    _dataAja.text = "";// kosongkan kembali textfield
  }

  retrieve() async {
    prefs = await SharedPreferences.getInstance();//dapatkan instance
    name = prefs.getString('Inidata') ?? "";//jika null, beri nilai ""
    setState(() {});//hanya trigger build ulang
  }

  delete() async {
    prefs = await SharedPreferences.getInstance();
    prefs.remove('Inidata');//hapus data
    name = "";
    setState(() {});//hanya trigger build ulang
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shared Preferences"),
      ),
      body: Container(
          margin: const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: _dataAja,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Masukkan sesuatu",
                ),
              ),
              ElevatedButton(
                child: const Text("Save"),
                onPressed: (
                ) {
                  save(); 
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: TextEditingController(text: name),
                readOnly: true,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: name,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                child: const Text("Get Value"),
                onPressed: () {
                  retrieve();
                },
              ),
              ElevatedButton(
                child: const Text("Delete Value"),
                onPressed: () {
                  delete();
                },
              )
            ],
          )),
    );
  }
}