import 'package:flutter/material.dart';
import 'bottom_navbar.dart';
import 'input_validation.dart';
import 'advanced_form.dart';
// ===============================
// FUNGSI UTAMA
// ===============================
// Fungsi ini dijalankan pertama kali saat aplikasi dimulai
void main() {
  runApp(const MyApp());
}

// ===============================
// WIDGET UTAMA (Stateless)
// ===============================
// Widget ini hanya membungkus struktur dasar aplikasi Flutter
// dan menampilkan halaman DynamicBottomNavbar
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(useMaterial3: false), // Gunakan tema Material lama
      home: const AdvancedForm(), // Halaman utama menggunakan bottom navigation bar
    );
  }
}

// ===============================
// WIDGET DENGAN STATE (MyInput)
// ===============================
// Widget ini berisi semua komponen input dan interaksi pengguna
class MyInput extends StatefulWidget {
  const MyInput({super.key});

  @override
  State<MyInput> createState() => _MyInputState();
}

// ===============================
// STATE UNTUK MyInput
// ===============================
// Di sinilah data dan logika UI disimpan dan diubah
class _MyInputState extends State<MyInput> {
  // Controller untuk membaca teks dari TextField
  TextEditingController _controller = TextEditingController();

  // Variabel untuk menyimpan status dari Switch (nyala/mati)
  bool lightOn = false;

  // Variabel untuk menyimpan status dari Checkbox (setuju/tidak)
  bool agree = false;

  // Variabel untuk menyimpan bahasa yang dipilih (Radio Button)
  String? language;

  // ===============================
  // FUNGSI: Menampilkan Snackbar untuk Radio Button
  // ===============================
  void showRadioSnackbar() {
    if (language != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('You selected: $language'),
          duration: const Duration(seconds: 1),
        ),
      );
    }
  }

  // ===============================
  // FUNGSI: Menampilkan Snackbar untuk Checkbox
  // ===============================
  void showCheckboxSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        // Teks berubah sesuai status centang
        content: Text(agree
            ? 'You agreed to the terms and conditions'
            : 'You disagreed with the terms'),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Input Widget')), // Judul di atas layar
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // =======================
            // TEXTFIELD (Input Nama)
            // =======================
            TextField(
              controller: _controller, // Hubungkan controller untuk baca teks
              decoration: const InputDecoration(
                hintText: 'Write your name here...',
                labelText: 'Your Name',
              ),
            ),

            const SizedBox(height: 20),

            // =======================
            // TOMBOL SUBMIT
            // =======================
            ElevatedButton(
              child: const Text('Submit'),
              onPressed: () {
                // Saat tombol ditekan, tampilkan dialog popup
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: Text('Hello ${_controller.text}'),
                    );
                  },
                );
              },
            ),

            const SizedBox(height: 20),

            // =======================
            // SWITCH UNTUK "LIGHT ON/OFF"
            // =======================
            Switch(
              value: lightOn,
              onChanged: (bool value) {
                setState(() {
                  lightOn = value; // Perbarui status switch
                });

                // Tampilkan snackbar sesuai status switch
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(lightOn ? 'Light On' : 'Light Off'),
                    duration: const Duration(seconds: 1),
                  ),
                );
              },
            ),

            const SizedBox(height: 20),

            // =======================
            // RADIO BUTTON PILIHAN BAHASA
            // =======================
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                RadioListTile<String>(
                  title: const Text('Dart'),
                  value: 'Dart',
                  groupValue: language,
                  onChanged: (String? value) {
                    setState(() {
                      language = value;
                      showRadioSnackbar(); // Panggil fungsi untuk tampilkan snackbar
                    });
                  },
                ),
                RadioListTile<String>(
                  title: const Text('Kotlin'),
                  value: 'Kotlin',
                  groupValue: language,
                  onChanged: (String? value) {
                    setState(() {
                      language = value;
                      showRadioSnackbar();
                    });
                  },
                ),
                RadioListTile<String>(
                  title: const Text('Swift'),
                  value: 'Swift',
                  groupValue: language,
                  onChanged: (String? value) {
                    setState(() {
                      language = value;
                      showRadioSnackbar();
                    });
                  },
                ),
              ],
            ),

            const SizedBox(height: 20),

            // =======================
            // CHECKBOX UNTUK "AGREE TO TERMS"
            // =======================
            CheckboxListTile(
              title: const Text('I agree to the terms and conditions'),
              value: agree, // Nilai boolean untuk menentukan centang/tidak
              onChanged: (bool? value) {
                setState(() {
                  agree = value ?? false; // Jika null, default ke false
                  showCheckboxSnackbar(); // Panggil snackbar saat berubah
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

// ===============================
// BOTTOM NAVIGATION BAR
// ===============================
// Komponen ini menampilkan dua tab (Latihan dan Form Validation)
class DynamicBottomNavbar extends StatefulWidget {
  const DynamicBottomNavbar({super.key});

  @override
  State<DynamicBottomNavbar> createState() => _DynamicBottomNavbarState();
}

class _DynamicBottomNavbarState extends State<DynamicBottomNavbar> {
  // Indeks halaman aktif (tab yang sedang dipilih)
  int _currentPageIndex = 0;

  // Daftar halaman (bisa diganti sesuai kebutuhan)
  final List<Widget> _pages = <Widget>[
    const MyInput(), // Tab pertama
    const MyInput(), // Tab kedua
  ];

  // Fungsi untuk mengganti halaman ketika tab ditekan
  void onTabTapped(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Tampilkan halaman sesuai tab yang aktif
      body: _pages[_currentPageIndex],
      // Navigasi bawah
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentPageIndex,
        onTap: onTabTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.task_alt_outlined),
            label: 'Latihan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.input_outlined),
            label: 'Form Validation',
          ),
        ],
        backgroundColor: Colors.blueAccent,
        selectedItemColor: Colors.yellow,
        unselectedItemColor: Colors.white,
      ),
    );
  }
}
