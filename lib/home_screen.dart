// lib/home_screen.dart

import 'package:flutter/material.dart';
import 'investment_item.dart';
import 'investment_card.dart';
import 'categories_pages.dart'; // تصنيفات الصفحة
import 'community_screen.dart'; // شاشة Community
import 'reels_screen.dart'; // شاشة Reels
import 'dashboard_screen.dart'; // شاشة Dashboard
import 'profile_screen.dart'; // شاشة Profile

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  bool showFilterBar = false;
  String? selectedFilter;
  String? selectedSortOption;

  // قائمة العناصر المحفوظة
  final List<InvestmentItem> savedItems = [];

  // بيانات الأقسام
  final List<InvestmentItem> yourInterestsData = [
    InvestmentItem(
      assetImage: "assets/image.png",
      title: "iDiet",
      description:
          "Offering healthy, satisfying meals to support effortless weight loss",
      investedAmount: "260,000 LE",
      investors: "26",
    ),
    InvestmentItem(
      assetImage: "assets/image (2).png",
      title: "Mother Naked",
      description:
          "Flipping the script on beauty, all about clean, glow-boosting products.",
      investedAmount: "280,000 LE",
      investors: "27",
    ),
    InvestmentItem(
      assetImage: "assets/image (4).png",
      title: "Mesh Beta3 Aseer",
      description:
          "A juice shop offering fresh juices and smoothies with 100% natural ingredients.",
      investedAmount: "260,000 LE",
      investors: "29",
    ),
    InvestmentItem(
      assetImage: "assets/image (3).png",
      title: "El Santo",
      description:
          "We don't mind getting our hands dirty with Tacos. Try our special tacos.",
      investedAmount: "260,000 LE",
      investors: "29",
    ),
    InvestmentItem(
      assetImage: "assets/image (5).png",
      title: "Smack That Scrub",
      description:
          "Our scrubs are the show-stoppers, targeting cellulite, eczema, flaky skin, etc.",
      investedAmount: "200,000 LE",
      investors: "32",
    ),
  ];

  final List<InvestmentItem> topRaisedData = [
    InvestmentItem(
      assetImage: "assets/image (6).png",
      title: "Zero Sugar By Ketonista",
      description:
          "Specialized in Healthy, Keto, Sugar Free, and Gluten Free Products",
      investedAmount: "420,000 LE",
      investors: "42",
    ),
    InvestmentItem(
      assetImage: "assets/image (7).png",
      title: "FAKHR",
      description:
          "Inspiring individuals to embrace their unique journey and strive for greatness.",
      investedAmount: "300,000 LE",
      investors: "33",
    ),
    InvestmentItem(
      assetImage: "assets/image (8).png",
      title: "Clementine",
      description:
          "Clean, cruelty-free skincare mixing health and beauty perfectly.",
      investedAmount: "250,000 LE",
      investors: "38",
    ),
    InvestmentItem(
      assetImage: "assets/image (9).png",
      title: "Mother Naked",
      description: "Simplify your routine with clean, glow-boosting products.",
      investedAmount: "270,000 LE",
      investors: "25",
    ),
    InvestmentItem(
      assetImage: "assets/image (10).png",
      title: "Matter",
      description:
          "Post-modern Matcha & Brew House – all things Matcha, ceremonial grade.",
      investedAmount: "350,000 LE",
      investors: "35",
    ),
  ];

  final List<InvestmentItem> closingSoonData = [
    InvestmentItem(
      assetImage: "assets/image (11).png",
      title: "The Bathland",
      description:
          "Everything you need for glowing skin: from scrubs to lip & cheek tint.",
      investedAmount: "140,000 LE",
      investors: "15",
    ),
    InvestmentItem(
      assetImage: "assets/image (12).png",
      title: "Seemly",
      description:
          "Simplicity and comfort for your wardrobe with stylish, casual designs.",
      investedAmount: "260,000 LE",
      investors: "30",
    ),
    InvestmentItem(
      assetImage: "assets/image (13).png",
      title: "MuscleAdd",
      description:
          "Leading supplement manufacturer, improving lifestyles for athletes worldwide.",
      investedAmount: "205,000 LE",
      investors: "20",
    ),
    InvestmentItem(
      assetImage: "assets/image (14).png",
      title: "Urban Ducks",
      description:
          "Fresh products available at Bloom Egypt pharmacy and online stores.",
      investedAmount: "150,000 LE",
      investors: "15",
    ),
    InvestmentItem(
      assetImage: "assets/image (15).png",
      title: "Glitch",
      description:
          "Radical designs pushing you out of your comfort zone. Founded on passion.",
      investedAmount: "150,000 LE",
      investors: "22",
    ),
  ];

  final List<InvestmentItem> trendingData = [
    InvestmentItem(
      assetImage: "assets/image (16).png",
      title: "Urban Ducks",
      description:
          "Found in Bloom Egypt pharmacy and online platforms. Fresh & healthy.",
      investedAmount: "240,000 LE",
      investors: "36",
    ),
    InvestmentItem(
      assetImage: "assets/image (17).png",
      title: "INFUSE",
      description:
          "Fitness wear infusing quality, affordability, and style into every thread.",
      investedAmount: "350,000 LE",
      investors: "35",
    ),
    InvestmentItem(
      assetImage: "assets/image (18).png",
      title: "Goovy",
      description:
          "Smash burgers and crispy fried chicken, bold flavors, high-quality ingredients.",
      investedAmount: "200,000 LE",
      investors: "32",
    ),
    InvestmentItem(
      assetImage: "assets/image (19).png",
      title: "Meraki",
      description:
          "Natural products for personal care, catering to skin, hair, and wellbeing.",
      investedAmount: "250,000 LE",
      investors: "27",
    ),
    InvestmentItem(
      assetImage: "assets/image (20).png",
      title: "Glazed",
      description:
          "Monthly subscription boxes with strong customer connections and loyalty.",
      investedAmount: "150,000 LE",
      investors: "22",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    Widget body;
    switch (_selectedIndex) {
      case 0:
        body = _buildHomeContent();
        break;
      case 1:
        body = CommunityScreen();
        break;
      case 2:
        body = ReelsScreen();
        break;
      case 3:
        body = DashboardScreen();
        break;
      case 4:
        body = ProfileScreen();
        break;
      default:
        body = _buildHomeContent();
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xff082347)),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(child: body),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (i) => setState(() => _selectedIndex = i),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color(0xff082347),
        unselectedItemColor: Colors.black54,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: "Community"),
          BottomNavigationBarItem(
            icon: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xff082347),
              ),
              child: Icon(Icons.play_arrow, color: Colors.white),
            ),
            label: "Reels",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.dashboard), label: "Dashboard"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }

  Widget _buildHomeContent() {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildProfileHeader(),
          Divider(color: Colors.black, thickness: 1, height: 20),
          _buildSearchBar(),
          SizedBox(height: 16),
          showFilterBar ? _buildFilterBar() : _buildCategoryWithDivider(),
          _buildSectionTitle("Your Interests"),
          _buildInvestmentSection(yourInterestsData),
          Divider(color: Colors.black, thickness: 1, height: 20),
          _buildSectionTitle("Top Raised"),
          _buildInvestmentSection(topRaisedData),
          Divider(color: Colors.black, thickness: 1, height: 20),
          _buildSectionTitle("Closing Soon"),
          _buildInvestmentSection(closingSoonData),
          Divider(color: Colors.black, thickness: 1, height: 20),
          _buildSectionTitle("Trending This Month"),
          _buildInvestmentSection(trendingData),
        ],
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Row(
      children: [
        CircleAvatar(
          radius: 28,
          backgroundImage: AssetImage('assets/profile.png'),
        ),
        SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text('Welcome, ',
                      style: TextStyle(fontSize: 24, color: Color(0xff082347))),
                  Text('Younis!',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff082347))),
                  Spacer(),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, '/saved'),
                    child: Icon(Icons.bookmark_border,
                        color: Color(0xff082347), size: 28),
                  ),
                ],
              ),
              SizedBox(height: 4),
              Text("Don't wait to invest. Invest and then wait.",
                  style: TextStyle(fontSize: 14, color: Color(0xff082347))),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
          color: Color(0xffF5F7FA), borderRadius: BorderRadius.circular(25)),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Search for a Business or Founder name",
          hintStyle: TextStyle(color: Color(0xFF7E9ACF), fontSize: 14),
          prefixIcon: Icon(Icons.search, color: Color(0xFF7E9ACF)),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _buildCategoryWithDivider() {
    return Column(
      children: [
        _buildCategorySection(),
        SizedBox(height: 16),
        Divider(color: Colors.black, thickness: 1, height: 20),
      ],
    );
  }

  Widget _buildCategorySection() {
    final List<String> categoryImages = [
      "assets/Health.png",
      "assets/Food Truck.png",
      "assets/Fashion.png",
      "assets/Beauty.png",
      "assets/Food & Beverage.png",
    ];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(categoryImages.length, (index) {
          return GestureDetector(
            onTap: () {
              switch (index) {
                case 0:
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => HealthFitnessPage()));
                  break;
                case 1:
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => FoodTruckPage()));
                  break;
                case 2:
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => FashionPage()));
                  break;
                case 3:
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => BeautyPage()));
                  break;
                case 4:
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => FoodAndBeveragePage()));
                  break;
              }
            },
            child: Container(
              width: 100,
              height: 100,
              margin: EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                  color: Color(0xffF5F7FA),
                  borderRadius: BorderRadius.circular(12)),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(categoryImages[index], fit: BoxFit.cover)),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildFilterBar() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildFilterButton(Icons.swap_vert, "Sort by", true),
            _buildFilterButton(null, "Top Raised"),
            _buildFilterButton(null, "Closing soon"),
            _buildFilterButton(null, "Viral"),
          ],
        ),
        SizedBox(height: 16),
        Divider(color: Colors.black, thickness: 1, height: 20),
      ],
    );
  }

  Widget _buildFilterButton(IconData? icon, String label,
      [bool isSortBy = false]) {
    bool isSelected = (selectedFilter == label);
    return GestureDetector(
      onTap: () {
        if (isSortBy) {
          _showSortByBottomSheet();
        } else {
          setState(() {
            selectedFilter = isSelected ? null : label;
          });
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 6, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Color(0xff082347) : Colors.transparent,
          border: Border.all(color: Color(0xff082347)),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            if (icon != null) Icon(icon, size: 16, color: Color(0xff082347)),
            if (icon != null) SizedBox(width: 6),
            Text(label,
                style: TextStyle(
                    fontSize: 12,
                    color: isSelected ? Colors.white : Colors.black)),
            if (isSortBy) Icon(Icons.arrow_drop_down, color: Color(0xff082347)),
          ],
        ),
      ),
    );
  }

  void _showSortByBottomSheet() {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
      builder: (_) => Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Type of your investing",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            SizedBox(height: 6),
            Text("How would you like to invest, and get your return?",
                style: TextStyle(fontSize: 14, color: Colors.grey)),
            SizedBox(height: 16),
            _buildSortOption("Long Term"),
            _buildSortOption("Short Term"),
          ],
        ),
      ),
    );
  }

  Widget _buildSortOption(String option) {
    bool isSelected = (selectedSortOption == option);
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedSortOption = isSelected ? null : option;
        });
        Navigator.pop(context);
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
          color: isSelected ? Color(0xff082347) : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Color(0xff082347)),
        ),
        child: Center(
            child: Text(option,
                style: TextStyle(
                    color: isSelected ? Colors.white : Color(0xff082347)))),
      ),
    );
  }

  Widget _buildSectionTitle(String title) => Padding(
        padding: EdgeInsets.symmetric(vertical: 8),
        child: Text(title,
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xff082347))),
      );

  Widget _buildInvestmentSection(List<InvestmentItem> data) => Container(
        color: Color(0xffD9E4FF),
        padding: EdgeInsets.symmetric(vertical: 16),
        child: SizedBox(
          height: 230,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: data.length,
            itemBuilder: (_, idx) {
              final item = data[idx];
              bool isSaved = savedItems.any((s) => s.title == item.title);
              return InvestmentCard(
                assetImage: item.assetImage,
                title: item.title,
                description: item.description,
                investedAmount: item.investedAmount,
                investors: item.investors,
                isSaved: isSaved,
                onBookmarkPressed: () {
                  setState(() {
                    if (isSaved)
                      savedItems.removeWhere((s) => s.title == item.title);
                    else
                      savedItems.add(item);
                  });
                },
              );
            },
          ),
        ),
      );
}
