import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> bulletinData = [
    'Bulletin 1',
    'Bulletin 2',
    'Bulletin 3',
    'Bulletin 4',
    'Bulletin 5',
  ];

  final List<String> contentsData = [
    'Content 1',
    'Content 2',
    'Content 3',
    'Content 4',
    'Content 5',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            // Handle menu button click
          },
        ),
      ),
      body: Column(
        children: [
          Container(
            child: Column(
              children: [
                Container(
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage(
                        'assets/images/profile.jpg'), // Replace with the actual image
                  ),
                ),
                SizedBox(height: 16),
                Container(
                  constraints: BoxConstraints.expand(height: 50),
                  child: TabBar(
                    tabs: [
                      Tab(text: 'BulletinBoard'),
                      Tab(text: 'Contents'),
                    ],
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              children: [
                buildBulletinListView(),
                buildContentsListView(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBulletinListView() {
    return ListView.builder(
      itemCount: bulletinData.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(bulletinData[index]),
          // Add more details or customize as needed
        );
      },
    );
  }

  Widget buildContentsListView() {
    return ListView.builder(
      itemCount: contentsData.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 4,
          margin: EdgeInsets.all(16),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Text(
                contentsData[index],
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        );
      },
    );
  }
}
