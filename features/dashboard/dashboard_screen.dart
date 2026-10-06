import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primaryNavy,
        title: const Text("Kesehatan Keluarga Privat"),
        actions: [
          IconButton(icon: const Icon(Icons.qr_code_scanner), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header User Info[span_8](start_span)[span_8](end_span)
            const Text("Halo, Andi 👋", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.textDark)),
            const Text("Kepala Keluarga • 12 Okt 2024 • 07:45", style: TextStyle(color: Colors.grey, fontSize: 14)),
            const SizedBox(height: 20),

            // 4 Anggota Keluarga Row Avatar[span_9](start_span)[span_9](end_span)
            const Text("Anggota Keluarga", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildAvatarMember("Ayah", "62 th", "Normal", Colors.green),
                _buildAvatarMember("Ibu", "58 th", "Normal", Colors.green),
                _buildAvatarMember("Kakek", "75 th", "Pengingat", Colors.orange),
                _buildAvatarMember("Anak", "25 th", "Aktif", Colors.blue),
              ],
            ),
            const SizedBox(height: 24),

            // 4 KARTU UTAMA DASHBOARD[span_10](start_span)[span_10](end_span)
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.1,
              children: [
                _buildFeatureCard("Pengingat Obat", "09:00 - Vitamin", Icons.medication, AppColors.primaryBlue),
                _buildFeatureCard("Tombol SOS", "Panggil Darurat", Icons.sos, AppColors.sosRed),
                _buildFeatureCard("Statistik Health", "Lihat Tren 7 Hari", Icons.bar_chart, AppColors.primaryBlue),
                _buildFeatureCard("Tekanan Darah", "120/80 - Normal", Icons.favorite, AppColors.primaryBlue),
              ],
            ),
            const SizedBox(height: 16),

            // Footer Garansi Keamanan & Mode Lansia[span_11](start_span)[span_11](end_span)
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(color: AppColors.lightBlue, borderRadius: BorderRadius.circular(12)),
              child: const Row(
                children: [
                  Icon(Icons.lock, color: AppColors.primaryNavy),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      "Aman & Terenkripsi • Sinkron Semua Perangkat • Mode Lansia Tombol Besar",
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.primaryNavy),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildAvatarMember(String nama, String usia, String status, Color color) {
    return Column(
      children: [
        CircleAvatar(
          radius: 28,
          backgroundColor: color.withOpacity(0.2),
          child: Text(nama[0], style: TextStyle(fontWeight: FontWeight.bold, color: color, fontSize: 20)),
        ),
        const SizedBox(height: 4),
        Text("$nama • $usia", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
        Text(status, style: TextStyle(color: color, fontSize: 11, fontWeight: FontWeight.w600)),
      ],
    );
  }

  Widget _buildFeatureCard(String title, String subtitle, IconData icon, Color color) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(backgroundColor: color.withOpacity(0.1), child: Icon(icon, color: color)),
            const SizedBox(height: 8),
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15), textAlign: TextAlign.center),
            const SizedBox(height: 4),
            Text(subtitle, style: TextStyle(fontSize: 12, color: Colors.grey[700]), textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
