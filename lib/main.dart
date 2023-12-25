import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'const/env_const.dart';
import 'data/services/connectivity_services.dart';
import 'data/services/shared_pref_services.dart';
import 'router/app_route.dart';
import 'theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// [initialize Supabase]
  await Supabase.initialize(
    url: EnvConst.supabaseUrl,
    anonKey: EnvConst.supabaseAnonKey,
  );

  /// [initialize shared pref]
  await SharedPrefServices.init();

  // Check initial connectivity state
  final Connectivity connectivity = Connectivity();
  var connectivityResult = await connectivity.checkConnectivity();
  final initialData = NetworkResult.checkConnectivity(connectivityResult);

  runApp(
    ProviderScope(
      overrides: [
        networkChangeNotifierProvider.overrideWith((ref) {
          return NetworkChangeNotifier(initialData);
        }),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'ThrifyCash',
      debugShowCheckedModeBanner: false,
      theme: AppCustomTheme.lightTheme,
      darkTheme: AppCustomTheme.darkTheme,
      themeMode: ThemeMode.light,
      routeInformationProvider: appRouter.routeInformationProvider,
      routeInformationParser: appRouter.routeInformationParser,
      routerDelegate: appRouter.routerDelegate,
    );
  }
}
