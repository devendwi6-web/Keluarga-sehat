import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class PdfExportService {
  static Future<void> generateDoctorReport({
    required String namaPasien,
    required String usia,
    required String kepatuhan,
    required String rataRataTensi,
  }) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Padding(
            padding: const pw.EdgeInsets.all(24),
            child: pw.Column(
              crossAxisAlignment: pw.CrossAlignment.start,
              children: [
                pw.Header(level: 0, child: pw.Text("Laporan Kesehatan Keluarga Privat - Mendenrejo")),
                pw.SizedBox(height: 12),
                pw.Text("Nama Pasien: $namaPasien ($usia)"),
                pw.Text("Rata-rata Tensi (7 Hari): $rataRataTensi mmHg"),
                pw.Text("Kepatuhan Minum Obat: $kepatuhan"),
                pw.Text("Sumber Data: Alat tensi pribadi + Input Manual"),
                pw.Divider(),
                pw.SizedBox(height: 12),
                pw.Container(
                  padding: const pw.EdgeInsets.all(10),
                  color: PdfColors.amber100,
                  child: pw.Text(
                    "DISCLAIMER: Laporan ini hanya berisi rekaman data mandiri untuk membantu konsultasi dokter. "
                    "Aplikasi tidak memberikan diagnosis atau saran perubahan dosis medis.",
                    style: pw.TextStyle(fontSize: 10, fontWeight: pw.FontWeight.bold),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );

    await Printing.layoutPdf(onLayout: (PdfPageFormat format) async => pdf.save());
  }
}
