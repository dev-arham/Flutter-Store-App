import 'package:store_app/pages/jackets_page.dart';
import 'package:store_app/pages/pants_page.dart';
import 'package:store_app/pages/shirts_page.dart';
import 'package:store_app/pages/shorts_page.dart';

class Category {
  static List<Map> categoryItems = [
    {
      "title": "Shirts",
      "image": "assets/images/tshirt.png",
      "screen": const ShirtsPage(),
    },
    {
      "title": "Pants",
      "image": "assets/images/pant.png",
      "screen": const PantsPage(),
    },
    {
      "title": "Jackets",
      "image": "assets/images/jacket.png",
      "screen": const JacketsPage(),
    },
    {
      "title": "Shorts",
      "image": "assets/images/shorts.png",
      "screen": const ShortsPage(),
    },
  ];
}
