import 'package:flutter/material.dart';
import 'package:store_app/pages/shop_page.dart';
import 'small_button.dart';

class CarouselSlide extends StatelessWidget {
  final String bannerImagePath;
  final String bannerTitle;
  final String bannerDescription;
  final String bannerButtonText;

  const CarouselSlide(
      {super.key,
      required this.bannerTitle,
      required this.bannerButtonText,
      required this.bannerDescription,
      required this.bannerImagePath});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            image: DecorationImage(
              image: AssetImage(bannerImagePath),
              fit: BoxFit.cover,
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      bannerTitle,
                      style: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          fontFamily: "main_font",
                          letterSpacing: 1),
                    ),
                    Text(
                      bannerDescription,
                      style: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 14,
                          fontFamily: "main_font",
                          letterSpacing: 1),
                    ),
                    SmallButton(
                        buttonText: bannerButtonText,
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const ShopPage()));
                        })
                  ],
                ),
              ),
              const Expanded(child: SizedBox())
            ],
          ),
        ),
      ],
    );
  }
}
