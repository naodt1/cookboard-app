import 'package:cookboard/widgets/dashboard.dart';
import 'package:cookboard/widgets/recommendation.dart';
import 'package:cookboard/widgets/searchfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:iconly/iconly.dart';

import '../widgets/custom_bottomnav.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final RxInt selectedIndex = 1.obs;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: SafeArea(
          minimum: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              SearchField(),
              Dashboard(firstName: 'firstName', profilePic: Image.asset('assets/images/profilePic.png'))
            ],
          ),
        ),
      ),
    );
  }
}
