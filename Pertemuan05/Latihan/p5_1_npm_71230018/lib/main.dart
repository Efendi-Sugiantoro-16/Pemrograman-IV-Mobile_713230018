import 'package:flutter/material.dart';
import 'screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Belajar Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Oswald',
      ),
      home: const FirstScreen(),
    );
  }
}

class MyImage extends StatelessWidget {
  const MyImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pertemuan 5'),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Center(
        child: Image.network(
          'https://www.radarbandung.id/wp-content/uploads/2022/09/ranca-upas.jpg',
          width: 400,
          height: 400,
        ),
      ),
    );
  }
}

class MyImageAsset extends StatelessWidget {
  const MyImageAsset({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pertemuan 5'),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Center(
        child: Image.asset(
          'images/coding-adventure.png',
          width: 400,
          height: 400,
        ),
      ),
    );
  }
}

class MyCustomFont extends StatelessWidget {
  const MyCustomFont({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pertemuan 5'),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: const Center(
        child: Text(
          'Custom Font',
          style: TextStyle(
            fontFamily: 'Oswald',
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}

class ScrollingScreen extends StatelessWidget {
  const ScrollingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            height: 250,
            decoration: BoxDecoration(
              color: Colors.grey,
              border: Border.all(color: Colors.black),
            ),
            child: const Center(
              child: Text(
                '1',
                style: TextStyle(fontSize: 50),
              ),
            ),
          ),
          Container(
            height: 250,
            decoration: BoxDecoration(
              color: Colors.grey,
              border: Border.all(color: Colors.black),
            ),
            child: const Center(
              child: Text(
                '2',
                style: TextStyle(fontSize: 50),
              ),
            ),
          ),
          Container(
            height: 250,
            decoration: BoxDecoration(
              color: Colors.grey,
              border: Border.all(color: Colors.black),
            ),
            child: const Center(
              child: Text(
                '3',
                style: TextStyle(fontSize: 50),
              ),
            ),
          ),
          Container(
            height: 250,
            decoration: BoxDecoration(
              color: Colors.grey,
              border: Border.all(color: Colors.black),
            ),
            child: const Center(
              child: Text(
                '4',
                style: TextStyle(fontSize: 50),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ScrollingScreenList extends StatelessWidget {
  const ScrollingScreenList({super.key});
  
  final List<int> numberList = const [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Number List'),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: ListView(
        children: numberList.map((number) {
          return Container(
            height: 250,
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.grey,
              border: Border.all(color: Colors.black),
            ),
            child: Center(
              child: Text(
                '$number',
                style: const TextStyle(fontSize: 50),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class ScrollingScreenListBuilder extends StatelessWidget {
  const ScrollingScreenListBuilder({super.key});
  
  final List<int> numberList = const [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Number List Builder'),
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
        itemCount: numberList.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 250,
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.green[100],
              border: Border.all(color: Colors.green),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                '${numberList[index]}',
                style: const TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ScrollingScreenListSeparated extends StatelessWidget { 
  const ScrollingScreenListSeparated({super.key}); 
  final List<int> numberList = const [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]; 
  
  @override 
  Widget build(BuildContext context) { 
    return Scaffold(
      appBar: AppBar(
        title: const Text('List with Separator'),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
        itemCount: numberList.length, 
        itemBuilder: (BuildContext context, int index) { 
          return Container( 
            height: 200, 
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            decoration: BoxDecoration( 
              color: Colors.grey,
              border: Border.all(color: Colors.black), 
            ), 
            child: Center( 
              child: Text( 
                '${numberList[index]}', 
                style: const TextStyle(
                  fontSize: 50,
                ), 
              ), 
            ), 
          ); 
        }, 
        separatorBuilder: (BuildContext context, int index) { 
          return const Divider();
        }, 
      ), 
    );
  } 
}