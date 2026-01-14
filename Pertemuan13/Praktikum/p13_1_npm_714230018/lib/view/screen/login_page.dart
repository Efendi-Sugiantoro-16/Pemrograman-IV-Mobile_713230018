import 'package:flutter/material.dart';
import 'package:p13_1_npm_714230018/model/login_model.dart';
import 'package:p13_1_npm_714230018/services/api_services.dart';
import 'package:p13_1_npm_714230018/services/auth_manager.dart';
import 'package:p13_1_npm_714230018/view/screen/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Key untuk validasi form
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Controller untuk input user
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  // Service API
  final ApiServices _dataService = ApiServices();

  // ================= LIFECYCLE =================
  @override
  void initState() {
    super.initState();
    checkLogin(); // cek auto-login saat halaman dibuka
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // ================= VALIDATOR =================
  String? _validateUsername(String? value) {
    if (value != null && value.length < 4) {
      return 'Masukkan minimal 4 karakter';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value != null && value.length < 3) {
      return 'Masukkan minimal 3 karakter';
    }
    return null;
  }

  // ================= AUTO LOGIN =================
  void checkLogin() async {
    bool isLoggedIn = await AuthManager.isLoggedIn();
    if (isLoggedIn && mounted) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
        (route) => false,
      );
    }
  }

  // ================= LOGIN PROCESS =================
  void handleLogin() async {
    final isValidForm = _formKey.currentState!.validate();
    if (!isValidForm) return;

    // Membuat model login dari input user
    final postModel = LoginInput(
      username: _usernameController.text,
      password: _passwordController.text,
    );

    // Panggil API login
    LoginResponse? res = await _dataService.login(postModel);

    if (res != null && res.status == 200) {
      // Debug logging untuk token
      debugPrint('LOGIN SUCCESS:');
      debugPrint('  - Status: ${res.status}');
      debugPrint('  - Message: ${res.message}');
      debugPrint('  - Token: ${res.token}');
      debugPrint('  - Token Length: ${res.token?.length ?? 0}');
      
      // Simpan status login dan token
      await AuthManager.login(_usernameController.text);
      if (res.token != null) {
        await AuthManager.saveToken(res.token!);
        debugPrint('TOKEN SAVED: ${res.token}');
      }
      if (!mounted) return;

      // Pindah ke HomePage
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
        (route) => false,
      );
    } else {
      // Tampilkan pesan error
      displaySnackbar(res?.message ?? 'Login gagal');
    }
  }

  // ================= SNACKBAR =================
  void displaySnackbar(String msg) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(msg)));
  }

  // ================= UI =================
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Login Page'),

          // Warna AppBar biru
          backgroundColor: Colors.blue,

          // Warna teks & icon putih
          foregroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  // Input Username
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: _validateUsername,
                      controller: _usernameController,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.account_circle_rounded),
                        hintText: 'Write username here...',
                        labelText: 'Username',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        fillColor: Color.fromARGB(255, 242, 254, 255),
                        filled: true,
                      ),
                    ),
                  ),

                  // Input Password
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      obscureText: true,
                      controller: _passwordController,
                      validator: _validatePassword,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.password_rounded),
                        hintText: 'Write your password here...',
                        labelText: 'Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        fillColor: Color.fromARGB(255, 242, 254, 255),
                        filled: true,
                      ),
                    ),
                  ),

                  // Tombol Login
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: handleLogin,
                      child: const Text('Login'),
                    ),
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
