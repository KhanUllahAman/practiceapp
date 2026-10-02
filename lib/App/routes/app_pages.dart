import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:practiceproject/App/bindings/practice_binding.dart';
import 'package:practiceproject/App/routes/app_routes.dart';
import 'package:practiceproject/presentation/view/practice_view.dart';

class AppPages {
  static const initialRoute = AppRoutes.practiceRoute;

  static final routes = [
    GetPage(
      name: AppRoutes.practiceRoute,
      page: () => const PracticeView(),
      transition: Transition.fadeIn,
      binding: PracticeBinding(),
      transitionDuration: const Duration(milliseconds: 300),
    ),
  ];
}
