import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/widgets/tombol_besar_lansia.dart';

class BpWarningDialog extends StatelessWidget {
  final int sistolik = 148;
  final int diastolik = 92;
  final int detak = 88;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.warning_rounded, size: 60, color: AppColors.sosRed),
            const SizedBox(height: 12),
            const Text(
              "Pembacaan Tinggi Terdeteksi",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.sosRed),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              "Hasil: $sistolik / $diastolik mmHg • Detak $detak bpm",
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            // Teks Peringatan Medis Wajib Aturan Keamanan 3[span_22](start_span)[span_22](end_span)
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(color: AppColors.warningYellow, borderRadius: BorderRadius.circular(12)),
              child: const Text(
                "Pembacaan Tinggi Terdeteksi - di atas rentang biasa Anda, pantau dan konsultasi dokter. "
                "Jika pusing berat, nyeri dada, sesak - hubungi dokter/darurat 119/112",
                style: TextStyle(fontSize: 13, color: Colors.black87, height: 1.4, fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(height: 20),

            TombolBesarLansia(
              text: "Catat & Hubungi Keluarga",
              backgroundColor: AppColors.sosRed,
              onPressed: () => Navigator.pop(context),
            ),
            const SizedBox(height: 10),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                minimumSize: const Size(double.infinity, 48),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: const Text("Saya baik-baik saja", style: TextStyle(fontSize: 16, color: Colors.black87)),
              onPressed: () => Navigator.pop(context),
            )
          ],
        ),
      ),
    );
  }
}
