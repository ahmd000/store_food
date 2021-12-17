import 'package:get/get.dart';
import 'package:store_app/prefs/shared_pref_controller.dart';
class LanguageGetXController extends GetxController{

  RxString languageCode = 'ar'.obs;

  static LanguageGetXController get to => Get.find();
  @override
  void onInit() {
    // TODO: implement onInit
    languageCode.value = SharedPrefController().codeLang;
    super.onInit();
  }

  void changeLanguage(String newLangCode){
    languageCode.value = newLangCode;
    SharedPrefController().setLanguage(newLangCode);
  }
}