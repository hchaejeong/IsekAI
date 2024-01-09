import 'package:flutter/material.dart';

class DiscoverScreen extends StatefulWidget {
  @override
  _DiscoverScreenState createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  final List<String> exploreResults = [
    'Result 1',
    'Result 2',
    'Result 3',
    'Result 4',
    'Result 5',
    'Result 6',
  ];

  final List<String> newForYouResults = [
    'New Result 1',
    'New Result 2',
    'New Result 3',
    'New Result 4',
    'New Result 5',
    'New Result 6',
  ];

  final List<String> sortByResults = [
    'Sort Result 1',
    'Sort Result 2',
    'Sort Result 3',
    'Sort Result 4',
    'Sort Result 5',
    'Sort Result 6',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                // Handle menu button click
              },
            ),
            Text(
              'User Name', // Replace with actual user name
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                // Handle search button click
              },
            ),
          ],
        ),
      ),
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            Container(
              constraints: BoxConstraints.expand(height: 50),
              child: TabBar(
                tabs: [
                  Tab(text: 'Explore'),
                  Tab(text: 'New For You'),
                  Tab(text: 'Sort By'),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  buildGridView(exploreResults),
                  buildGridView(newForYouResults),
                  buildGridView(sortByResults),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildGridView(List<String> results) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: results.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Text(
                results[index],
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        );
      },
    );
  }
}
