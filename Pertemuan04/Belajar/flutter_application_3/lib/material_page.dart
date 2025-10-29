import 'package:flutter/material.dart';
import 'about_page.dart';
import 'bigger_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF0051BA), // Blue
                    Color(0xFFC4373C), // Red
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Text(
                'Menu Navigation',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home Page'),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('About Page'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const AboutPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: MyRow (),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings')
        ],
        onTap: (index) {
          if (index == 1) {
            // Navigate to settings/about page
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const AboutPage(),
              ),
            );
          }
        },
      ),
    );
  }
}

//Membuat kelas MyContainer untuk menampilkan widget Container dengan styling khusus
class MyContainer extends StatelessWidget {
  const MyContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 100,
      padding: const EdgeInsets.only(top: 20, left: 16, right: 16, bottom: 16),
      decoration: BoxDecoration(
        color: Colors.blue, //mengubah warna latar belakang menjadi biru
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 4,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: const Center(
        child: Text(
          'Hello, Container!',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class MyPadding extends StatelessWidget {
  const MyPadding({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: const Text('Halo dari widget Padding!'),
    );
  }
}

class MySizebox extends StatelessWidget {
  const MySizebox({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Text 1',
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        Text('Universitas Logistik Bisnis Internasional'),
      ],
    );
  }
}
class MyRow extends StatelessWidget {
  const MyRow({super.key});

  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text('Main Axis Alignment: spaceEvenly'),
        Icon (Icons.share),
        Icon (Icons.thumb_up),
        Icon (Icons.thumb_down),
        
        Row(
          
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('Main Axis Alignment: Around'),
            Icon (Icons.share),
            Icon (Icons.thumb_up),
            Icon (Icons.thumb_down),
          ],
        ),
        Row(
          mainAxisAlignment : MainAxisAlignment.spaceBetween,
          children: [
            Text ('Main Axis Alignment: Between'),
            Icon (Icons.share),
            Icon (Icons.thumb_up),
            Icon (Icons.thumb_down),
          ],
        ),
        Row(
          mainAxisAlignment : MainAxisAlignment.start,
          children: [
            Text ('Main Axis Alignment: Start'),
            Icon (Icons.share),
            Icon (Icons.thumb_up),
            Icon (Icons.thumb_down),
          ],
        )
        ,
        Row(
          mainAxisAlignment : MainAxisAlignment.center,
          children: [
            Text ('Main Axis Alignment: center'),
            Icon (Icons.share),
            Icon (Icons.thumb_up),
            Icon (Icons.thumb_down),
          ],
        ),
        Row(
          mainAxisAlignment : MainAxisAlignment.end,
          children: [
            Text ('Main Axis Alignment: end'),
            Icon (Icons.share),
            Icon (Icons.thumb_up),
            Icon (Icons.thumb_down),
          ],
        ),  
      ],
    );
  }
}
