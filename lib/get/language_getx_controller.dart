import 'package:get/get.dart';
import 'package:store_app/prefs/shared_pref_controller.dart';

class LanguageGetxController extends GetxController {
  static LanguageGetxController get to => Get.find<LanguageGetxController>();
  RxString language = 'en'.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    language.value = SharedPrefController().language;
    super.onInit();
  }

  void changeLanguage() {
    language.value = language.value == 'en' ? 'ar' : 'en';
    SharedPrefController().setLanguage(lang: language.value);
  }
}
