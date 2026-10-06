import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../../core/constants/app_colors.dart';
import '../../core/widgets/tombol_besar_lansia.dart';

class FamilyQrScreen extends StatelessWidget {
  final String familyCode = "LA WU-4829"; // Kode Unik Keluarga 24 Jam[span_5](start_span)[span_5](end_span)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kode Akses Keluarga Privat"),
        backgroundColor: AppColors.primaryNavy,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text(
              "Pindai QR ini atau masukkan kode untuk meminta akses gabung keluarga.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 24),
            Center(
              child: QrImageView(
                data: familyCode,
                version: QrVersions.auto,
                size: 220.0,
                backgroundColor: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              decoration: BoxDecoration(
                color: AppColors.lightBlue,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                familyCode,
                style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: AppColors.primaryNavy),
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              "⚠️ Berlaku 24 jam • Sekali Pakai • Butuh Persetujuan Kepala Keluarga",
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 13),
            ),
            const Spacer(),
            TombolBesarLansia(
              text: "Lihat Permintaan Gabung (1 PENDING)",
              onPressed: () {
                _showApprovalBottomSheet(context);
              },
            )
          ],
        ),
      ),
    );
  }

  void _showApprovalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (context) => Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Permintaan Akses Masuk", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            ListTile(
              leading: const CircleAvatar(child: Icon(Icons.person)),
              title: const Text("Ibu Sari (Ibu)"),
              subtitle: const Text("Status: PENDING (Akses diblokir)"),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.check_circle, color: Colors.green, size: 32),
                    onPressed: () => Navigator.pop(context),
                  ),
                  IconButton(
                    icon: const Icon(Icons.cancel, color: Colors.red, size: 32),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
