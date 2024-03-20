import 'package:flutter/material.dart';
import 'package:MonsterApp/screens/monster_details_screen.dart'; // Import the MonsterDetailScreen.dart file
class ShopScreen extends StatefulWidget {
  @override
  _ShopScreenState createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  TextEditingController searchController = TextEditingController();

  final Map<String, List<String>> monsterData = {
    "monster1": ["Astrocreep", "a_blue.png", "#d8e8f6", "#18689c", "travel"],
    "monster2": ["Starbeast", "b_pink.png", "#f0dee6", "#9d172a", "retail"],
    "monster3": ["Cosmic Critter", "c_green.png", "#daeae5", "#1a6a37", "fintech"],
    "monster4": ["Galaxy Gobbler", "d_orange.png", "#f2e7de", "#90571a", "lifestyle"],
    "monster5": ["Cuddlekins", "e_teal.png", "#d1eff6", "#00b4c5", "finance"],
    "monster6": ["Pipsqueak", "f_purple.png", "#dfd4e8", "#80378d", "qsr"],
    "monster7": ["Snugglebug", "g_yellow.png", "#f5f1df", "#a08614", "entertainment"],
    "monster8": ["Little Critter", "h_red.png", "#e3d3d8", "#912629", "ecommerce"],
    "monster9": ["Starbeast", "b_pink.png", "#f0dee6", "#9d172a", "retail"],
    "monster10": ["Cosmic Critter", "c_green.png", "#daeae5", "#1a6a37", "fintech"],
    "monster11": ["Galaxy Gobbler", "d_orange.png", "#f2e7de", "#90571a", "lifestyle"],
    "monster12": ["Cuddlekins", "e_teal.png", "#d1eff6", "#00b4c5", "finance"],
    "monster13": ["Pipsqueak", "f_purple.png", "#dfd4e8", "#80378d", "qsr"],
    "monster14": ["Snugglebug", "g_yellow.png", "#f5f1df", "#a08614", "entertainment"],
    "monster15": ["Little Critter", "h_red.png", "#e3d3d8", "#912629", "ecommerce"],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shop'),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                  children: monsterData.entries.map((entry) {
                    String monsterKey = entry.key;
                    List<String> monsterDetails = entry.value;
                    String monsterName = monsterDetails[0];
                    String monsterImage = monsterDetails[1];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MonsterDetailScreen(
                              monsterName: monsterName,
                              monsterImage: monsterImage,
                            ),
                          ),
                        );
                      },
                    child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 10), // Add vertical margin
                    padding: const EdgeInsets.all(10),
                      child: ListTile(
                        title: Text(monsterName),
                        leading: Image.asset(
                          'lib/assets/$monsterImage',
                          width: 100,
                          height: 120,
                        ),
                      )),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
