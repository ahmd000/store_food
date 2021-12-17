
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:store_app/api/controllers/city_api_controller.dart';
import 'package:store_app/models/city.dart';

class GetxControllerCiteis extends GetxController {
  RxList<City> city = <City>[].obs;

  CityApiController cityController = CityApiController();

  static GetxControllerCiteis get to => Get.find();

  @override
  void onInit() {
    // TODO: implement onInit
    readCities();
    super.onInit();
  }
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    city.clear();
    super.onClose();
  }


  Future<void> readCities() async{
    city.value = await cityController.getCity();
  }
}