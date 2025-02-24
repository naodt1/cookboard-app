import 'package:cookboard/screens/AddNewRecipePage.dart';
import 'package:cookboard/screens/profile_page.dart';
import 'package:cookboard/screens/saved_recipes_page.dart';
import 'package:cookboard/screens/search_page.dart';
import 'package:cookboard/widgets/categorybutton.dart';
import 'package:cookboard/widgets/recommendation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../services/main_wrapper_controller.dart';
import '../widgets/custom_bottomnav.dart';
import '../widgets/dashboard.dart';
import '../widgets/searchfield.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  String firstName = "Anne";
  Image profilePic = Image.asset('assets/images/profilePic.png');
  //RxInt selectedIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    final MainWrapperController _mainWrapperController =
    Get.find<MainWrapperController>();
    return Scaffold(
      // backgroundColor: Color(0xfff7f7f7),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: SafeArea(
            minimum: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Dashboard(firstName: this.firstName, profilePic: this.profilePic,),
                TextField(
                  readOnly: true,
                  onTap: () {
                    FocusScope.of(context).unfocus();
                    _mainWrapperController.goToTab(1);
                  },
                  decoration: InputDecoration(
                    filled: true,
                    hintText: 'Search',
                    prefixIcon: Icon(IconlyLight.search, size: 30),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(28),
                      borderSide: BorderSide(width: 3, color: Colors.transparent),
                    ),
                  ),
                ),
                CategoryList(),
                RecommendationList()
              ],
            ),
          ),
        ),
      ),
      // floatingActionButton: Visibility(
      //   visible: !keyboardIsOpen,
      //   child: FloatingActionButton(
      //     onPressed: () {
      //       Get.to(AddNewRecipePage());
      //     },
      //     child: Icon(Icons.add),
      //   ),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}


