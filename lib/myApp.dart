import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(
        textScaler: TextScaler.noScaling,
        boldText: false,
      ),
      child:  GetMaterialApp(
          defaultTransition: Transition.fadeIn,
          transitionDuration: const Duration(milliseconds: 300),
          useInheritedMediaQuery: true,
          debugShowCheckedModeBanner: false,
          showPerformanceOverlay: false,
          debugShowMaterialGrid: false,
          checkerboardRasterCacheImages: false,
          checkerboardOffscreenLayers: false,
          title: 'Practice App',
          // initialBinding: InitialBinding(),
          // initialRoute: AppPages.initialRoute,
          // getPages: AppPages.routes,
          // unknownRoute: AppPages.unknownRoute,
        ),
      );
  }
}
