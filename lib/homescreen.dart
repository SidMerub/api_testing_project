import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'Model/Usermodel.dart';
import 'userdetailsscreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Usermodel> userList = [];
  List<Color> cardColors = [];

  Future<List<Usermodel>> getUserApi() async {
    final response = await http.get(Uri.parse('https://webhook.site/f132d661-3828-4458-8baf-a3ed89032d59'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      userList.clear();
      for (Map<String, dynamic> i in data) {
        userList.add(Usermodel.fromJson(i));
      }
      return userList;
    } else {
      return userList;
    }
  }
  Color getRandomColor() {
    final Random random = Random();
    return Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
  }

  @override
  void initState() {
    super.initState();
    cardColors = List.generate(10, (index) => getRandomColor());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
      ),
      body:  FutureBuilder(
          future: getUserApi(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator()); // Center the loader
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}')); // Center the error message
            } else {
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.8, // Adjust aspect ratio for better presentation
                ),
                itemCount: userList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // When user taps on a user, navigate to User Detail Screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UserDetailScreen(user: userList[index],cardColor: cardColors[index],),
                        ),
                      );
                    },
                    child: Card(
                      color: cardColors[index],
                      margin: const EdgeInsets.all(10),
                      elevation: 5, // Add some elevation for a material look
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Name: ${userList[index].name ?? ''}',
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 10),
                            Text('Email: ${userList[index].email ?? ''}'),
                            const SizedBox(height: 10),
                            Text(
                              'Phone Numbers:\n${userList[index].phoneNumbers?.join('\n') ?? ''}',
                              maxLines: 3, // Limit the number of displayed lines
                              overflow: TextOverflow.ellipsis, // Show ellipsis for long text
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),

    );
  }
}
