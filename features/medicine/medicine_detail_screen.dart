import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/widgets/disclaimer_aman.dart';
import '../../core/widgets/tombol_besar_lansia.dart';

class MedicineDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Detail Obat Aman"), backgroundColor: AppColors.primaryNavy),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Obat[span_14](start_span)[span_14](end_span)[span_15](start_span)[span_15](end_span)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: AppColors.primaryBlue, borderRadius: BorderRadius.circular(12)),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Amlodipin 5 mg", style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
                  Text("Obat Penurun Tekanan Darah", style: TextStyle(color: Colors.white70, fontSize: 14)),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Syarat Medis 1: Diresepkan Dokter[span_16](start_span)[span_16](end_span)
            const Row(
              children: [
                Icon(Icons.medical_services, color: AppColors.primaryBlue),
                SizedBox(width: 8),
                Text("Diresepkan oleh: ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                Text("Dr. Sujatmiko", style: TextStyle(fontSize: 16, color: AppColors.primaryNavy, fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 12),

            // Syarat Medis 2: Lampiran Foto Resep[span_17](start_span)[span_17](end_span)
            const Text("Lampiran Foto Resep Dokter:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
            const SizedBox(height: 8),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Container(
                height: 120,
                width: double.infinity,
                color: Colors.grey[300],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.image, size: 40, color: Colors.grey),
                    SizedBox(width: 8),
                    Text("foto_resep_15102024.jpg", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Syarat Medis 3: Dosis Sesuai Resep[span_18](start_span)[span_18](end_span)
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(12)),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Dosis Sesuai Resep Dokter:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                  Text("• 1 tablet, 1 kali sehari pada pagi hari pukul 07:00", style: TextStyle(fontSize: 14)),
                  Text("• Minum setelah sarapan pagi", style: TextStyle(fontSize: 14)),
                  Text("• Durasi: 30 hari (Habis: 13 Nov 2024)", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Disclaimer Box Wajib (Kotak Kuning)[span_19](start_span)[span_19](end_span)
            const DisclaimerAman(
              text: "Hanya pengingat dari resep dokter, bukan saran medis.",
              isWarning: true,
            ),
            const SizedBox(height: 16),

            // Informasi Keamanan Medis[span_20](start_span)[span_20](end_span)
            const Text("Informasi Keamanan Medis:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
            const SizedBox(height: 6),
            const Text(
              "• Jangan melebihi dosis yang diresepkan.\n"
              "• Jika muncul pusing, ruam, atau sesak napas — segera hubungi dokter atau darurat 119.\n"
              "• Jika lupa minum, jangan ganda kan dosis pada jadwal berikutnya.",
              style: TextStyle(fontSize: 13, height: 1.4, color: Colors.black87),
            ),
            const SizedBox(height: 24),

            TombolBesarLansia(
              text: "Lanjut ke Konfirmasi Minum",
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
