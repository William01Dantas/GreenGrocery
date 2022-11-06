import 'package:add_to_cart_animation/add_to_cart_animation.dart';
import 'package:add_to_cart_animation/add_to_cart_icon.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:greengrocer/src/config/custom_colors.dart';
import 'package:greengrocer/src/screens/home/components/item_title.dart';
import 'package:greengrocer/src/services/utils_services.dart';

import '../../config/app_data.dart' as app_data;
import '../widgets/app_name_widget.dart';
import 'components/category_tile.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  String selectedCategory = "Frutas";

  GlobalKey<CartIconKey> globalKeyCardItems = GlobalKey<CartIconKey>();

  late Function(GlobalKey) runAddToCardAnimation;

  void itemSelectedCartAnimations(GlobalKey gkImage) {
    runAddToCardAnimation(gkImage);
  }

  final UtilsServices utilsServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const AppNameWidget(),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 15.0, right: 15.0),
            child: GestureDetector(
              onTap: () {},
              child: Badge(
                badgeColor: CustomColors.customContrastColor,
                badgeContent: const Text(
                  "2",
                  style: TextStyle(color: Colors.white, fontSize: 12.0),
                ),
                child: AddToCartIcon(
                  key: globalKeyCardItems,
                  icon: Icon(
                    Icons.shopping_cart,
                    color: CustomColors.customSwatchColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),

      // Campo de pesquisa
      body: AddToCartAnimation(
        gkCart: globalKeyCardItems,
        previewDuration: const Duration(
          milliseconds: 100,
        ),
        previewCurve: Curves.ease,
        receiveCreateAddToCardAnimationMethod: (addToCartAnimationMethod) {
          runAddToCardAnimation = addToCartAnimationMethod;
        },
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  isDense: true,
                  hintText: "Pesquise aqui...",
                  hintStyle:
                      TextStyle(color: Colors.grey.shade400, fontSize: 14.0),
                  prefixIcon: Icon(
                    Icons.search,
                    color: CustomColors.customContrastColor,
                    size: 21.0,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(60.0),
                    borderSide: const BorderSide(
                      width: 0.0,
                      style: BorderStyle.none,
                    ),
                  ),
                ),
              ),
            ),

            // Categoria
            Container(
              height: 40.0,
              padding: const EdgeInsets.only(left: 15.0),
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: app_data.categorias.length,
                separatorBuilder: (_, index) => const SizedBox(
                  width: 10.0,
                ),
                itemBuilder: (_, index) {
                  return CategoryTile(
                    category: app_data.categorias[index],
                    isSelected: app_data.categorias[index] == selectedCategory,
                    onPressed: () {
                      setState(() {
                        selectedCategory = app_data.categorias[index];
                      });
                    },
                  );
                },
              ),
            ),

            // Grid
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 9 / 11.5,
                ),
                itemCount: app_data.items.length,
                itemBuilder: (_, index) {
                  return ItemTile(
                      item: app_data.items[index],
                      cartAnimationMethod: itemSelectedCartAnimations);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
