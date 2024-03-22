import 'package:MonsterApp/viewmodels/common_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:MonsterApp/screens/monster_details_screen.dart'; // Import the MonsterDetailScreen.dart file

class ShopScreen extends StatefulWidget {
  @override
  _ShopScreenState createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  TextEditingController searchController = TextEditingController();

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
                  children: CommonViewmodel.monsterData.entries.map((entry) {
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
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          // Add vertical margin
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
