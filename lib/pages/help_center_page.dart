import 'package:flutter/material.dart';

class HelpCenterPage extends StatefulWidget {
  const HelpCenterPage({super.key});

  @override
  State<HelpCenterPage> createState() => _HelpCenterPageState();
}

class _HelpCenterPageState extends State<HelpCenterPage>
    with SingleTickerProviderStateMixin {
  int isSelected = 0;

  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        title: const Text(
          "Help Center",
          style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              fontFamily: "main_font",
              letterSpacing: 1),
        ),
        centerTitle: true,
        bottom: TabBar(
          controller: tabController,
          indicatorColor: Colors.red[800],
          indicatorSize: TabBarIndicatorSize.tab,
          labelColor: Colors.red[800],
          labelStyle: TextStyle(
              color: Colors.grey[700],
              fontSize: 16,
              fontFamily: "main_font",
              letterSpacing: 1),
          tabs: const [
            Tab(
              text: "FAQ",
            ),
            Tab(
              text: "Contact Us",
            )
          ],
        ),
      ),
      body: TabBarView(controller: tabController, children: [
        SingleChildScrollView(
          child: Column(children: [
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: "Search",
                  hintStyle: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 16,
                      fontFamily: "main_font",
                      letterSpacing: 1),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.grey.shade200, width: 2),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.red.shade800, width: 1),
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildChoicePicker(index: 0, name: "All"),
                    _buildChoicePicker(index: 1, name: "Service"),
                    _buildChoicePicker(index: 2, name: "General"),
                    _buildChoicePicker(index: 3, name: "Account"),
                    _buildChoicePicker(index: 4, name: "Payment"),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const CustomExpansionTile(
              title: "Can I track my order?",
              description:
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus vitae feugiat nulla, sed congue lacus. Vestibulum dictum ligula risus, at.",
            ),
            const CustomExpansionTile(
              title: "Is there a return policy?",
              description:
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus vitae feugiat nulla, sed congue lacus. Vestibulum dictum ligula risus, at.",
            ),
            const CustomExpansionTile(
              title: "Can I save my favotite item?",
              description:
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus vitae feugiat nulla, sed congue lacus. Vestibulum dictum ligula risus, at.",
            ),
            const CustomExpansionTile(
              title: "Can I share products?",
              description:
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus vitae feugiat nulla, sed congue lacus. Vestibulum dictum ligula risus, at.",
            ),
            const CustomExpansionTile(
              title: "How do I contact customer support?",
              description:
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus vitae feugiat nulla, sed congue lacus. Vestibulum dictum ligula risus, at.",
            ),
            const CustomExpansionTile(
              title: "What payment are accepted?",
              description:
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus vitae feugiat nulla, sed congue lacus. Vestibulum dictum ligula risus, at.",
            ),
            const CustomExpansionTile(
              title: "How to add review?",
              description:
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus vitae feugiat nulla, sed congue lacus. Vestibulum dictum ligula risus, at.",
            ),
            const SizedBox(
              height: 50,
            ),
          ]),
        ),
        Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            const CustomExpansionIconTile(
              title: "Customer Service",
              description:
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus vitae feugiat nulla, sed congue lacus. Vestibulum dictum ligula risus, at.",
              icon: Icon(Icons.headphones_outlined),
            ),
            CustomExpansionIconTile(
              title: "WhatsApp",
              description:
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus vitae feugiat nulla, sed congue lacus. Vestibulum dictum ligula risus, at.",
              icon: Image.asset(
                "assets/images/whatsapp.png",
                color: Colors.black,
                width: 22,
                height: 22,
              ),
            ),
            const CustomExpansionIconTile(
              title: "Website",
              description:
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus vitae feugiat nulla, sed congue lacus. Vestibulum dictum ligula risus, at.",
              icon: Icon(Icons.web_outlined),
            ),
            const CustomExpansionIconTile(
              title: "Facebook",
              description:
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus vitae feugiat nulla, sed congue lacus. Vestibulum dictum ligula risus, at.",
              icon: Icon(Icons.facebook_outlined),
            ),
            const CustomExpansionIconTile(
              title: "Twitter",
              description:
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus vitae feugiat nulla, sed congue lacus. Vestibulum dictum ligula risus, at.",
              icon: Icon(Icons.message_outlined),
            ),
            const CustomExpansionIconTile(
              title: "Instagram",
              description:
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus vitae feugiat nulla, sed congue lacus. Vestibulum dictum ligula risus, at.",
              icon: Icon(Icons.camera_alt_outlined),
            ),
          ],
        )
      ]),
    );
  }

  _buildChoicePicker({required int index, required String name}) =>
      GestureDetector(
        onTap: () => setState(() {
          isSelected = index;
        }),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          margin: const EdgeInsets.only(top: 10, right: 10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: isSelected == index
                  ? Colors.red.shade800
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: Colors.red.shade800)),
          child: Text(
            name,
            style: isSelected == index
                ? const TextStyle(color: Colors.white)
                : TextStyle(color: Colors.red.shade800),
          ),
        ),
      );
}

class CustomExpansionTile extends StatelessWidget {
  final String title, description;
  const CustomExpansionTile({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: ExpansionTile(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(color: Colors.grey.shade300)),
        collapsedShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(color: Colors.grey.shade300)),
        expansionAnimationStyle: AnimationStyle(curve: Curves.easeInOut),
        title: Text(
          title,
          style: TextStyle(
              color: Colors.grey[700],
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: "main_font",
              letterSpacing: 1),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              description,
              style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 14,
                  fontFamily: "main_font",
                  letterSpacing: 1),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomExpansionIconTile extends StatelessWidget {
  final String title, description;
  final Widget icon;
  const CustomExpansionIconTile({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: ExpansionTile(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(color: Colors.grey.shade300)),
        collapsedShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(color: Colors.grey.shade300)),
        expansionAnimationStyle: AnimationStyle(curve: Curves.easeInOut),
        leading: icon,
        title: Text(
          title,
          style: TextStyle(
              color: Colors.grey[700],
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: "main_font",
              letterSpacing: 1),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              description,
              style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 14,
                  fontFamily: "main_font",
                  letterSpacing: 1),
            ),
          ),
        ],
      ),
    );
  }
}
