import 'package:flutter/material.dart';
import 'package:p6_1_npm_71230018/input_validation.dart';
import 'package:p6_1_npm_71230018/advanced_form.dart'; 
import 'main.dart'; 
 
class DynamicBottomNavbar extends StatefulWidget { 
  const DynamicBottomNavbar({super.key}); 
 
  @override 
  State<DynamicBottomNavbar> createState() => _DynamicBottomNavbarState(); 
} 
 
class _DynamicBottomNavbarState extends State<DynamicBottomNavbar> { 
  int _currentPageIndex = 0; 
 
  final List<Widget> _pages = <Widget>[ 
    const MyInput(), 
    const MyFormValidation(),
    const AdvancedForm(),
    // const MyInputForm(), 
  ]; 
 
  void onTabTapped(int index) { 
    setState(() { 
      _currentPageIndex = index; 
    }); 
  } 
 
  @override 
  Widget build(BuildContext context) { 
    return Scaffold( 
      body: _pages[_currentPageIndex], 
      bottomNavigationBar: BottomNavigationBar( 
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentPageIndex, 
        onTap: onTabTapped, 
        items: const [ 
          BottomNavigationBarItem( 
            icon: Icon(Icons.task_alt_outlined), 
            label: 'Latihan', 
          ), 
          BottomNavigationBarItem( 
            icon: Icon(Icons.input_outlined), 
            label: 'Form Validation', 
          ), 
          BottomNavigationBarItem( 
            icon: Icon(Icons.input), 
            label: 'Form Input', 
          ),
                    BottomNavigationBarItem( 
            icon: Icon(Icons.phone_android), 
            label: 'Advanced Form', 
          ),
        ], 
        backgroundColor: Colors.blueAccent, 
        selectedItemColor: Colors.yellow, 
        unselectedItemColor: Colors.white, 
      ), 
    ); 
  } 
} 