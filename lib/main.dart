import 'package:cookboard/screens/AddNewRecipePage.dart';
import 'package:cookboard/services/main_wrapper_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

void main() {
  Get.put(MainWrapperController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'My Cookboard App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.green,
          fontFamily: GoogleFonts.robotoFlex().fontFamily,
          brightness: Brightness.light,
          scaffoldBackgroundColor: Color(0xfff7f7f7),
          textTheme: TextTheme(
              titleLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              bodyLarge: TextStyle(
                  color: Colors.green, fontWeight: FontWeight.w600),
              bodySmall: TextStyle(color: Colors.grey.shade700)
          ),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Colors.green,
          ),
          bottomAppBarTheme: BottomAppBarTheme(
            color: Color(0xfff7f7f7),

          )
      ),
      darkTheme: ThemeData(
          brightness: Brightness.dark,
          //scaffoldBackgroundColor: Colors.grey.shade900,
          primaryColor: Colors.green,
          primarySwatch: Colors.green,
          textTheme: TextTheme(
              titleLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              bodyLarge: TextStyle(
                  color: Colors.greenAccent.shade700, fontWeight: FontWeight.w600),
              bodySmall: TextStyle(color: Colors.grey.shade400)
          ),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Colors.greenAccent.shade700,
          ),
      ),
      themeMode: ThemeMode.system,
      home: MainWrapper(),
    );
  }
}


class MainWrapper extends StatelessWidget {
  MainWrapper({Key? key}) : super(key: key);

  final MainWrapperController _mainWrapperController =
  Get.find<MainWrapperController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        elevation: 0,
        notchMargin: 10,
        child: Container(
          padding:
          const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
          child: Obx(
                () => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _bottomAppBarItem(
                  icon: IconlyLight.home,
                  page: 0,
                  context: context,
                  iconChange: IconlyBold.home,
                ),
                _bottomAppBarItem(
                  icon: IconlyLight.search,
                  page: 1,
                  context: context,
                  iconChange: IconlyBold.search,
                ),
                SizedBox(width: 50), // Add a SizedBox between bookmark and profile to make space for FAB
                _bottomAppBarItem(
                  icon: IconlyLight.bookmark,
                  page: 2,
                  context: context,
                  iconChange: IconlyBold.bookmark,
                ),
                _bottomAppBarItem(
                  icon: IconlyLight.profile,
                  page: 3,
                  context: context,
                  iconChange: IconlyBold.profile,
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked, // Add FAB and set its position to centerDocked
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {
          Get.to(AddNewRecipePage(),transition: Transition.fadeIn);
        },
        child: Icon(Icons.add,color: Colors.white,),
      ),
      body: PageView(
        controller: _mainWrapperController.pageController,
        physics: const BouncingScrollPhysics(),
        onPageChanged: _mainWrapperController.animateToTab,
        children: [..._mainWrapperController.pages],
      ),
    );
  }

  Widget _bottomAppBarItem({
    required IconData icon,
    required int page,
    required BuildContext context,
    required IconData iconChange,
  }) {
    return ZoomTapAnimation(
      onTap: () => _mainWrapperController.goToTab(page),
      child: Icon(
        _mainWrapperController.currentPage.value == page
            ? iconChange
            : icon,
        size: 28,
        color: _mainWrapperController.currentPage.value == page
            ? Theme.of(context).primaryColor
            : Colors.grey.shade400,
      ),
    );
  }
}
