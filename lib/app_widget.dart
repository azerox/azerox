import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

import 'app/app_injection.dart';
import 'app/app_translations.dart';
import 'app/config/app_colors.dart';
import 'app/config/app_routes.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return GetMaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0XFFE5E5E5),
        appBarTheme: const AppBarTheme(color: AppColors.primary),
        textTheme: Theme.of(context).textTheme.apply(bodyColor: Colors.white),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: AppColors.blue,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialBinding: AppInjection(),
      translations: AppTranslations(),
      supportedLocales: const [Locale('pt', 'BR')],
      localizationsDelegates: const [
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      getPages: AppRoutes.pages,
      initialRoute: Routes.initial,
    );
  }
}
