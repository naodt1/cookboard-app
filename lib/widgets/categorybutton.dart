import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import '../services/category-data.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  int _selectedIndex = -1;

  void _onCategoryButtonPressed(int index) {
    setState(() {
      if (_selectedIndex == index) {
        // Unselect the currently selected button
        _selectedIndex = -1;
      } else {
        // Select a new button
        _selectedIndex = index;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 35),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Categories',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Theme.of(context).textTheme.headline6!.color),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'See all',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor, fontWeight: FontWeight.w600),
                ),
              )
            ],
          ),
          SizedBox(
            height: 5,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                categories.length,
                    (index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: CategoryButton(
                    category: categories[index].categoryName,
                    foodImage: categories[index].categoryImg.image,
                    isSelected: index == _selectedIndex,
                    onPressed: () => _onCategoryButtonPressed(index),
                  ),
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}

class CategoryButton extends StatefulWidget {
  final String category;
  final ImageProvider foodImage;
  final bool isSelected;
  final VoidCallback onPressed;

  const CategoryButton({
    required this.category,
    required this.foodImage,
    required this.isSelected,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  _CategoryButtonState createState() => _CategoryButtonState();
}

class _CategoryButtonState extends State<CategoryButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: ZoomTapAnimation(
        onTap: widget.onPressed,
        child: Container(
          padding: EdgeInsets.all(5),
          width: 85,
          height: 90,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: widget.isSelected ? Theme.of(context).primaryColor : Theme.of(context).cardColor,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image(
                  image: widget.foodImage,
                  width: 40,
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  widget.category,
                  style: TextStyle(
                    color: widget.isSelected ? Colors.white : Theme.of(context).textTheme.headline6!.color,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
