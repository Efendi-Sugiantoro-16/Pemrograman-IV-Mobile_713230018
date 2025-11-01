import 'package:flutter/material.dart';
import 'material_page.dart' show CustomPage;

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int _selectedIndex = 0;
  static const List<Widget> _pages = <Widget>[
    CustomPage(title: 'Halaman 1'),
    CustomPage(title: 'Halaman 2'),
    CustomPage(title: 'Halaman 3'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Method untuk menangani aksi tombol di drawer
  void _onDrawerItemTapped(String item) {
    // Tutup drawer
    Navigator.pop(context);
    
    // Tampilkan snackbar ketika item dipilih
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('$item selected')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Drawer untuk menu samping
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // Header drawer
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.person,
                      size: 40,
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Admin',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'admin@netmandevice.com',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            // Menu items
            ListTile(
              leading: const Icon(Icons.dashboard),
              title: const Text('Dashboard'),
              onTap: () => _onDrawerItemTapped('Dashboard'),
            ),
            ListTile(
              leading: const Icon(Icons.devices),
              title: const Text('Devices'),
              onTap: () => _onDrawerItemTapped('Devices'),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () => _onDrawerItemTapped('Settings'),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.help_outline),
              title: const Text('Help & Support'),
              onTap: () => _onDrawerItemTapped('Help & Support'),
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () => _onDrawerItemTapped('Logout'),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('NetManDevice'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        // Tombol hamburger akan muncul secara otomatis karena ada drawer
      ),
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Halaman 1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Halaman 2',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Halaman 3',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        onTap: _onItemTapped,
      ),
    );
  }
}