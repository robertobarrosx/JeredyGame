import 'package:Jeredy/ui/game/game_page.dart';
import 'package:get/get.dart';
part './app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.HOME,
      page: () => GamePage(),
    )
  ];
}
