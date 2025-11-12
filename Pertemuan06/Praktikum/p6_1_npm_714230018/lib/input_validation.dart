import 'package:flutter/material.dart';

// Widget utama untuk halaman Form Validation
class MyFormValidation extends StatefulWidget {
  const MyFormValidation({super.key});

  @override
  State<MyFormValidation> createState() => _MyFormValidationState();
}

class _MyFormValidationState extends State<MyFormValidation> {
  // GlobalKey digunakan untuk mengontrol dan memvalidasi form
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Controller untuk mengambil input dari TextFormField
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  // FocusNode digunakan untuk mengatur fokus dan visibilitas keyboard
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _nameFocus = FocusNode();

  @override
  void dispose() {
    // Selalu bersihkan controller dan focus node untuk mencegah memory leak
    _emailController.dispose();
    _nameController.dispose();
    _emailFocus.dispose();
    _nameFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Validation Example'),
      ),
      body: GestureDetector(
        // Menutup keyboard jika pengguna mengetuk area kosong di luar TextField
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey, // Hubungkan Form dengan GlobalKey
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ==================== FIELD EMAIL ====================
                TextFormField(
                  controller: _emailController, // Ambil input email
                  focusNode: _emailFocus, // Fokus untuk kontrol keyboard
                  keyboardType: TextInputType.emailAddress, // Keyboard tipe email
                  textInputAction: TextInputAction.next, // Ganti fokus ke field berikutnya
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                    hintText: 'Enter your email',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    // Regex sederhana untuk memvalidasi format email
                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                  // Saat user menekan tombol "Next" di keyboard, fokus pindah ke field Name
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_nameFocus);
                  },
                ),

                const SizedBox(height: 20),

                // ==================== FIELD NAME ====================
                TextFormField(
                  controller: _nameController,
                  focusNode: _nameFocus,
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.done, // "Done" akan menutup keyboard
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(),
                    hintText: 'Enter your name',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    if (value.length < 3) {
                      return 'Name must be at least 3 characters long';
                    }
                    return null;
                  },
                  // Ketika tombol “Done” ditekan → keyboard disembunyikan
                  onFieldSubmitted: (_) => FocusScope.of(context).unfocus(),
                ),

                const SizedBox(height: 30),

                // ==================== TOMBOL SUBMIT ====================
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      // Sembunyikan keyboard saat submit
                      FocusScope.of(context).unfocus();

                      // Jalankan validasi form
                      if (_formKey.currentState!.validate()) {
                        // Jika valid → tampilkan SnackBar
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Processing Data...')),
                        );

                        // Lalu tampilkan hasil input dalam AlertDialog
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Input Data'),
                              content: Text(
                                'Email: ${_emailController.text}\n'
                                'Name: ${_nameController.text}',
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context); // Tutup dialog
                                  },
                                  child: const Text('OK'),
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                    child: const Text('Submit'),
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
