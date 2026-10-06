import 'dart:async';
import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';

class SosCountdownScreen extends StatefulWidget {
  @override
  _SosCountdownScreenState createState() => _SosCountdownScreenState();
}

class _SosCountdownScreenState extends State<SosCountdownScreen> {
  int _secondsLeft = 5; // Countdown 5 detik[span_24](start_span)[span_24](end_span)
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startCountdown();
  }

  void _startCountdown() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsLeft > 1) {
        setState(() => _secondsLeft--);
      } else {
        _timer?.cancel();
        _triggerSosSending();
      }
    });
  }

  void _triggerSosSending() {
    // Navigasi ke Layar 3: Mengirim Lokasi (-7.6, 110.8)[span_25](start_span)[span_25](end_span)
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.sosRed,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 80, color: Colors.white),
              const SizedBox(height: 20),
              const Text(
                "Kirim Sinyal Darurat?",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              const SizedBox(height: 10),
              const Text(
                "Sinyal darurat akan dikirim ke keluarga & kontak darurat Anda. Pastikan Anda dalam keadaan darurat.",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white70, fontSize: 16),
              ),
              const SizedBox(height: 40),

              // Ring Countdown[span_26](start_span)[span_26](end_span)
              Container(
                width: 120,
                height: 120,
                decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                child: Center(
                  child: Text(
                    "0$_secondsLeft",
                    style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: AppColors.sosRed),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              const Text("Mengirim otomatis dalam 5 detik...", style: TextStyle(color: Colors.white, fontSize: 14)),
              const Spacer(),

              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        minimumSize: const Size(0, 52),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      onPressed: () {
                        _timer?.cancel();
                        Navigator.pop(context);
                      },
                      child: const Text("Batal", style: TextStyle(color: AppColors.sosRed, fontSize: 18, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        minimumSize: const Size(0, 52),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      onPressed: () {
                        _timer?.cancel();
                        _triggerSosSending();
                      },
                      child: const Text("Kirim Now", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
