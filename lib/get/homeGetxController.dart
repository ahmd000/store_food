import 'package:get/get.dart';
import 'package:store_app/api/controllers/home_ap_controller.dart';
import 'package:store_app/models/home_response.dart';

class HomeGetxController extends GetxController {
  HomeResponse? homeResponse;
  bool isLoading = false;
  final HomeApiController _apiController = HomeApiController();
  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
    await getHome();
  }

  Future<void> getHome() async {
    isLoading = true;
    print('===================================');

    homeResponse = await _apiController.showHome();
    print(homeResponse!.categories);
    isLoading = false;

    update();
  }

}
