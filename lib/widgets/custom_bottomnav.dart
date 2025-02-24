import 'package:cookboard/screens/saved_recipes_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:iconly/iconly.dart';

import '../screens/homepage.dart';
import '../screens/profile_page.dart';
import '../screens/search_page.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({Key? key, required this.selectedIndex}) : super(key: key);

  final RxInt selectedIndex;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      elevation: 0.0,
      child: Container(
        height: 56,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Obx(() => Icon(
                selectedIndex.value == 0 ? IconlyBold.home: IconlyLight.home,
                color: selectedIndex.value == 0 ? Colors.green : Colors.grey.shade400,
              )),
              onPressed: () {
                // update selected index and navigate to corresponding page
                selectedIndex.value = 0;
                Get.off(HomePage());
              },
            ),
            IconButton(
              icon: Obx(() => Icon(
                IconlyLight.search,
                color: selectedIndex.value == 1 ? Colors.green : Colors.grey.shade400,
              )),
              onPressed: () {
                // update selected index and navigate to corresponding page
                selectedIndex.value = 1;
                Get.off(SearchPage());
              },
            ),
            SizedBox(width: 40), // The dummy child
            IconButton(
              icon: Obx(() => Icon(
                IconlyLight.bookmark,
                color: selectedIndex.value == 2 ? Colors.green : Colors.grey.shade400,
              )),
              onPressed: () {
                // update selected index and navigate to corresponding page
                selectedIndex.value = 2;
                Get.off(SavedRecipesPage());
              },
            ),
            IconButton(
              icon: Obx(() => Icon(
                IconlyLight.profile,
                color: selectedIndex.value == 3 ? Colors.green : Colors.grey.shade400,
              )),
              onPressed: () {
                // update selected index and navigate to corresponding page
                selectedIndex.value = 3;
                Get.off(ProfilePage());
              },
            ),
          ],
        ),
      ),
    );
  }
}
