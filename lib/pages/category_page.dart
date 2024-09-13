import 'package:flutter/material.dart';
import 'package:store_app/components/category_card.dart';
import 'package:store_app/models/category.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[100],
          title: const Text(
            "Categories",
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                fontFamily: "main_font",
                letterSpacing: 1),
          ),
          centerTitle: true,
        ),
        body: Category.categoryItems.isEmpty
            ? const Center(
                child: Text("You don't have any wishlisted item!"),
              )
            : Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 50),
                    child: GridView.builder(
                      shrinkWrap: true,
                      itemCount: Category.categoryItems.length,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 0.8,
                              crossAxisCount: 2,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 10),
                      itemBuilder: (context, index) => CategoryCard(
                          imagePath: Category.categoryItems[index]["image"],
                          title: Category.categoryItems[index]["title"]),
                    ),
                  ),
                ],
              ));
  }
}
