import 'package:cookboard/screens/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../services/main_wrapper_controller.dart';

class Dashboard extends StatelessWidget {
  String firstName;
  Image profilePic;

  Dashboard({required this.firstName, required this.profilePic});

  @override
  Widget build(BuildContext context) {
    final MainWrapperController _mainWrapperController =
    Get.find<MainWrapperController>();

    return Container(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Hello,$firstName',style: Theme.of(context).textTheme.bodySmall,),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Text('What would you like to cook today?', style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 26.0
                  ),),
                ),
                SizedBox(
                  width: 30,
                  height: 10,
                ),
            ZoomTapAnimation(
              onTap: () => _mainWrapperController.goToTab((3)),
              child: CircleAvatar(
                backgroundColor: Colors.green.shade200,
                backgroundImage: profilePic.image,
              ),
            ),

              ],
            ),
          )
        ],
      ),
    );
  }
}
