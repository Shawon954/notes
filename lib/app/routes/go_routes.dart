import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:notes/app/modules/addnote_page/views/addnote_page_view.dart';
import 'package:notes/app/modules/home_page/controllers/home_page_controller.dart';
import 'package:notes/app/modules/home_page/views/details.dart';
import 'package:notes/app/modules/home_page/views/home_page_view.dart';
import 'package:notes/app/modules/login_page/views/login_page_view.dart';
import 'package:notes/app/modules/signup_page/views/signup_page_view.dart';
import 'package:notes/app/modules/splash_screen/views/splash_screen_view.dart';

final controller = Get.put(HomePageController());

final goRouter = GoRouter(navigatorKey: Get.key, initialLocation: '/', routes: [
  GoRoute(path: '/', builder: (context, state) => SplashScreenView()),
  GoRoute(path: '/home_page', builder: (context, state) => HomePageView()),
  GoRoute(path: '/login_page', builder: (context, state) => LoginPageView()),
  GoRoute(path: '/registration_page', builder: (context, state) => SignupPageView()),
  GoRoute(path: '/addnote_page', builder: (context, state) => AddnotePageView()),
  GoRoute(path: '/details_page', builder: (context, state) {
    final extraData = state.extra as Map<String, dynamic>?;
    final title = extraData?['title'] ?? 'Default Title';
    final details = extraData?['details'] ?? 'Default Description';

    return DetailsScreen(title: title, details: details,);
  }),
]);
