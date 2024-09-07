import 'package:flutter/material.dart';
import 'package:prm_cart/theme/style.dart';
import 'package:prm_cart/widgets/appbar.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('Categories'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            mainContainer('Fruits & Vegetable'),
            const SizedBox(height: 10,),
            mainContainer('Bakery,Cakes & Dairy'),
            const SizedBox(height: 10,),
            mainContainer('Breakfast, Dips & Spread'),
            const SizedBox(height: 10,),
            mainContainer('Egg, Meat & Fish'),
            const SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }
}

Widget mainContainer(String categoryName) => Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                categoryName,
                style: AppWidget().black18(),
              ),
              Material(
                borderRadius: BorderRadius.circular(5),
                elevation: 3,
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 4, right: 4, top: 4, bottom: 4),
                  child: Row(
                    children: [
                      Text(
                        'Explore',
                        style: AppWidget().categoriesExploreButtontext(),
                      ),
                      const Icon(Icons.keyboard_arrow_right),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              10,
              (index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text('about')
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
