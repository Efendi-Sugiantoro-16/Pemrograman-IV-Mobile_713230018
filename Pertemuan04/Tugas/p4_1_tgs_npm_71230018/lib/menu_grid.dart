import 'package:flutter/material.dart';

/// Kelas model untuk merepresentasikan satu item menu
class MenuItem {
  final String title;      // Judul menu yang akan ditampilkan
  final IconData icon;     // Ikon yang akan ditampilkan
  final Color color;       // Warna latar belakang menu

  /// Konstruktor untuk membuat instance MenuItem
  const MenuItem({
    required this.title,
    required this.icon,
    required this.color,
  });
}

/// Widget yang menampilkan grid menu dengan ikon dan teks
class MenuGrid extends StatelessWidget {
  // Daftar menu yang akan ditampilkan dalam grid
  final List<MenuItem> menuItems = [
    MenuItem(
      title: 'Dashboard',
      icon: Icons.dashboard,
      color: const Color(0xFF4CAF50), // Hijau
    ),
    MenuItem(
      title: 'Devices',
      icon: Icons.devices,
      color: const Color(0xFF2196F3), // Biru
    ),
    MenuItem(
      title: 'Network',
      icon: Icons.network_check,
      color: const Color(0xFFFFC107), // Kuning
    ),
    MenuItem(
      title: 'Settings',
      icon: Icons.settings,
      color: const Color(0xFF9C27B0), // Ungu
    ),
    MenuItem(
      title: 'Analytics',
      icon: Icons.analytics,
      color: const Color(0xFFF44336), // Merah
    ),
    MenuItem(
      title: 'Help',
      icon: Icons.help_outline,
      color: const Color(0xFF607D8B), // Biru Abu
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),  // Padding di sekitar grid
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,               // Jumlah kolom dalam grid
        crossAxisSpacing: 16,            // Jarak horizontal antar item
        mainAxisSpacing: 16,             // Jarak vertikal antar item
        childAspectRatio: 0.9,           // Rasio lebar/tinggi item
      ),
      itemCount: menuItems.length,        // Jumlah total item dalam grid
      itemBuilder: (context, index) {
        // Membuat widget untuk setiap item menu
        return _buildMenuItem(menuItems[index]);
      },
    );
  }

  /// Membuat widget untuk menampilkan satu item menu
  /// [item] adalah data menu yang akan ditampilkan
  Widget _buildMenuItem(MenuItem item) {
    return Card(
      elevation: 4,  // Efek bayangan pada card
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),  // Sudut melengkung pada card
      ),
      color: item.color,  // Warna latar belakang card
      child: InkWell(
        onTap: () {
          // TODO: Tambahkan aksi ketika menu diklik
          // Contoh: Navigator.push() untuk pindah ke halaman lain
        },
        borderRadius: BorderRadius.circular(12),  // Sudut melengkung pada efek tekan
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,  // Posisi konten di tengah vertikal
          children: [
            // Container untuk ikon dengan latar belakang bulat
            Container(
              padding: const EdgeInsets.all(12),  // Ruang di dalam container ikon
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),  // Latar belakang semi-transparan
                shape: BoxShape.circle,  // Bentuk lingkaran
              ),
              child: Icon(
                item.icon,  // Ikon dari data menu
                size: 30,   // Ukuran ikon
                color: Colors.white,  // Warna ikon
              ),
            ),
            const SizedBox(height: 8),  // Jarak antara ikon dan teks
            // Teks judul menu
            Text(
              item.title,  // Judul dari data menu
              textAlign: TextAlign.center,  // Posisi teks di tengah
              style: const TextStyle(
                color: Colors.white,  // Warna teks
                fontSize: 12,         // Ukuran font
                fontWeight: FontWeight.w500,  // Ketebalan font
              ),
            ),
          ],
        ),
      ),
    );
  }
}
