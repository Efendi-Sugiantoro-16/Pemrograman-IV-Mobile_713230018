# Praktikum Pemrograman Mobile - Pertemuan 12
## Contact API dengan Flutter dan Dio

### Deskripsi Proyek
Aplikasi Flutter yang mengimplementasikan operasi CRUD (Create, Read, Update, Delete) untuk mengelola kontak menggunakan REST API dengan package Dio untuk HTTP client.

### Fitur Utama
- **GET All Contacts** - Mengambil semua data kontak dari server
- **GET Single Contact** - Mengambil data kontak berdasarkan ID
- **POST Contact** - Menambahkan kontak baru
- **PUT Contact** - Mengupdate data kontak yang ada
- **DELETE Contact** - Menghapus data kontak
- **Form Validation** - Validasi input nama dan nomor HP
- **Responsive UI** - Interface yang user-friendly dengan Material Design

### Struktur Proyek
```
lib/
├── main.dart                 # Entry point aplikasi
├── model/
│   └── contact_model.dart    # Model data kontak
├── services/
│   └── api_services.dart     # Service untuk komunikasi API
└── view/
    ├── screen/
    │   └── home_page.dart     # Halaman utama aplikasi
    └── widget/
        └── contact_card.dart # Widget untuk menampilkan response
```

### API Endpoint
Base URL: `https://contactsapi-production.up.railway.app`

- `GET /contacts` - Mengambil semua kontak
- `GET /contacts/{id}` - Mengambil kontak berdasarkan ID
- `POST /insert` - Menambah kontak baru
- `PUT /update/{id}` - Mengupdate kontak
- `DELETE /delete/{id}` - Menghapus kontak

### Teknologi yang Digunakan
- **Flutter** - Framework untuk mobile development
- **Dio** - HTTP client untuk melakukan request API
- **Material Design** - UI/UX framework

### Cara Menjalankan Aplikasi

1. **Install Dependencies**
   ```bash
   flutter pub get
   ```

2. **Run Tests**
   ```bash
   flutter test
   ```

3. **Run Application**
   ```bash
   flutter run
   ```

4. **Build for Web**
   ```bash
   flutter build web
   ```

### Validasi Form
- **Nama**: Minimal 3 karakter, hanya huruf dan spasi
- **Nomor HP**: Minimal 10 digit, maksimal 15 digit, hanya angka

### Fitur Tambahan
- **Loading States** - Indikator loading saat proses API
- **Error Handling** - Penanganan error yang user-friendly
- **Confirmation Dialog** - Dialog konfirmasi untuk hapus data
- **Dismissible Cards** - Swipe untuk menghapus response card
- **Auto Refresh** - Refresh otomatis setelah operasi CRUD

### Testing
Aplikasi dilengkapi dengan unit tests untuk memverifikasi:
- UI Components
- Form Validation
- Button Functionality

### Author
**Nama**: Efendi Sugiantoro
**NIM**: 714230018
**Kelas**: Pemrograman IV Mobile
**Semester**: 5

### Catatan
- Server API mungkin membutuhkan waktu untuk merespon
- Pastikan koneksi internet stabil untuk mengakses API
- Aplikasi telah diuji dan berfungsi sesuai spesifikasi praktikum
