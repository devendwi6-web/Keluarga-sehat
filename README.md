# 🏥 Keluarga Sehat - Pemantauan Kesehatan Keluarga Privat

Aplikasi kesehatan privat keluarga untuk Mendenrejo, Temanggung. Berfokus pada Pengingat Obat, Pemantauan Tekanan Darah, dan Tombol SOS Darurat dengan standar keamanan medis ketat.

---

## 🚀 1. Cara Menjalankan Aplikasi di Berbagai Perangkat

Aplikasi menggunakan **1 codebase Flutter** yang kompatibel dengan Android (Samsung, Xiaomi, Oppo, dll) dan iOS (iPhone).

### Prerequisites:
- Flutter SDK `^3.19.0`
- Dart SDK `^3.3.0`

### Menjalankan di Android (Samsung / Xiaomi):
1. Aktifkan **Developer Options** dan **USB Debugging** pada HP Samsung/Xiaomi Anda.
2. Hubungkan HP via Kabel USB.
3. Jalankan perintah:
```bash
flutter pub get
flutter run -d android
