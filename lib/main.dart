import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      showSemanticsDebugger: false,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> _navigationItem = [
    const Icon(Icons.home, size: 30),
    const Icon(Icons.school, size: 30),
    const Icon(Icons.settings, size: 30),
    const Icon(Icons.shopping_cart, size: 30),
    const Icon(Icons.person, size: 30)
  ];

  List pages = [
    PersonalInfoTab(),
    Container(
      color: Colors.red,
    ),
    Container(
      color: Colors.blue,
    ),
    Container(
      color: Colors.black,
    ),
    Container(
      color: Colors.white,
    ),
  ];

  int myCurrentIndex = 0;

  Color bgColor = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[myCurrentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.black,
        index: myCurrentIndex,
        items: _navigationItem,
        onTap: (myNewCurrent) {
          setState(() {
            myCurrentIndex = myNewCurrent;
          });
        },
      ),
    );
  }
}

class PersonalInfoTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          SizedBox(height: 16),
          Text(
            'Personal Information',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          CircleAvatar(
            radius: 60,
            backgroundImage: AssetImage('assets/picture.jpg'),
          ),
          SizedBox(height: 4),
          Text(
            'Rod Vincent F. Dilag',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text(
            'Age: 21 years old',
            style: TextStyle(fontSize: 12),
          ),
          Text(
            'Address: Bauan, Batangas',
            style: TextStyle(fontSize: 12),
          ),
          SizedBox(height: 16),
          Text(
            'Brief bio goes here. Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
