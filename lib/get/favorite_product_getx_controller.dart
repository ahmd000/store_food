import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:store_app/api/controllers/favorite_product_controller.dart';
import 'package:store_app/models/favorite_product.dart';
     

class FavoriteProductGetxController extends GetxController {
  RxList<FavoriteProduct> favoriteProducts = <FavoriteProduct>[].obs;
  RxBool isFav = false.obs;

  FavoriteProductController favoriteProductController =
  FavoriteProductController();

  static FavoriteProductGetxController get to => Get.find();

  @override
  void onInit() {
    // TODO: implement onInit
    readFavoriteProducts();
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
    favoriteProducts.clear();
    super.onClose();
  }

  Future<void> addFavoriteProduct(BuildContext context,
      {required int productId}) async {
    await favoriteProductController.addFavorite(context, productId: productId);

    if (favoriteProducts
        .where((element) => element.id == productId)
        .isNotEmpty) {
      if (favoriteProducts
          .firstWhere((element) => element.id == productId)
          .is_favorite) {
        favoriteProducts
            .firstWhere((element) => element.id == productId)
            .is_favorite = false;
      } else {
        favoriteProducts
            .firstWhere((element) => element.id == productId)
            .is_favorite = true;
      }
    }
    readFavoriteProducts();
    favoriteProducts.refresh();
  }

  Future<void> readFavoriteProducts() async {
    favoriteProducts.value =
    await favoriteProductController.showFavoriteProduct();
  }
}
