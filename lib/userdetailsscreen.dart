import 'package:flutter/material.dart';
import 'Model/Usermodel.dart';

class UserDetailScreen extends StatelessWidget {
  final Usermodel user;
  final Color cardColor;

  const UserDetailScreen({required this.user, required this.cardColor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name: ${user.name ?? ''}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Card(
              color: cardColor,
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Address',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    Text('Street: ${user.address?.street ?? ''}'),
                    Text('City: ${user.address?.city ?? ''}'),
                    Text('State: ${user.address?.state ?? ''}'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Card(
              color: cardColor,
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Company',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    Text('Name: ${user.company?.name ?? ''}'),
                    Text('Position: ${user.company?.position ?? ''}'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
