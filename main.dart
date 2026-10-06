import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'core/theme/app_theme.dart';
import 'features/dashboard/dashboard_screen.dart';
import 'features/family/family_qr_screen.dart';
import 'features/medicine/medicine_detail_screen.dart';
import 'features/sos/sos_countdown_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // Init Supabase di sini
  runApp(const ProviderScope(child: KeluargaSehatApp()));
}

final GoRouter _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => DashboardScreen()),
    GoRoute(path: '/family-qr', builder: (context, state) => FamilyQrScreen()),
    GoRoute(path: '/medicine-detail', builder: (context, state) => MedicineDetailScreen()),
    GoRoute(path: '/sos-countdown', builder: (context, state) => SosCountdownScreen()),
  ],
);

class KeluargaSehatApp extends StatelessWidget {
  const KeluargaSehatApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Keluarga Sehat',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      routerConfig: _router,
    );
  }
}
