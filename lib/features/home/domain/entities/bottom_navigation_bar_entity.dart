import 'package:fruits_hub/core/utils/app_images.dart';

class BottomNavigationBarEntity {
  final String activeImage, inActiveImage;
  final String name;

  BottomNavigationBarEntity({
    required this.activeImage,
    required this.inActiveImage,
    required this.name,
  });
}

List<BottomNavigationBarEntity> get getBottomNavigationBarItems => [
  BottomNavigationBarEntity(
    activeImage: Assets.imagesHomeBold,
    inActiveImage: Assets.imagesHomeOutline,
    name: 'الرئيسية',
  ),
  BottomNavigationBarEntity(
    activeImage: Assets.imagesProductsBold,
    inActiveImage: Assets.imagesProductsOutline,
    name: 'المنتجات',
  ),
  BottomNavigationBarEntity(
    activeImage: Assets.imagesShoppingCartBold,
    inActiveImage: Assets.imagesShoppingCartOutline,
    name: 'سلة التسوق',
  ),
  BottomNavigationBarEntity(
    activeImage: Assets.imagesUserBold,
    inActiveImage: Assets.imagesUserOutline,
    name: 'حسابي',
  ),
];
