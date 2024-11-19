import 'package:flutter/material.dart';
import 'package:mobile_enum/ui/history/history_screen.dart';
import 'package:mobile_enum/ui/home/home_screen.dart';
import 'package:mobile_enum/ui/verif/verif_screen.dart';

class NavbarScreen extends StatefulWidget {
  const NavbarScreen({super.key});

  @override
  State<NavbarScreen> createState() => _NavbarScreenState();
}

class _NavbarScreenState extends State<NavbarScreen> {
  int myIndex = 0;

  List<Widget> pageList =[
    const HomeScreen(),
    const VerifikasiScreen(),
    const HistoryScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageList[myIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: myIndex,
        onTap: (int value) {
          setState(() {
            myIndex = value;
          });
        },
        unselectedLabelStyle: const TextStyle(color: Colors.grey),
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: const TextStyle(color: Colors.purple),
        selectedItemColor: Colors.purple,
        showUnselectedLabels: false,
        items: <BottomNavigationBarItem>[
          _buildBottomNavigationBarItem(
            icon: Icons.home,
            label: 'Home',
            isSelected: myIndex == 0,
          ),
          _buildBottomNavigationBarItem(
            icon: Icons.file_copy,
            label: 'Verifikasi',
            isSelected: myIndex == 1,
          ),
          _buildBottomNavigationBarItem(
            icon: Icons.history,
            label: 'History',
            isSelected: myIndex == 2,
          ),
        ],
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem({
    required IconData icon,
    required String label,
    required bool isSelected,
  }) {
    return BottomNavigationBarItem(
      icon: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        decoration: BoxDecoration(
          color: isSelected ? Colors.purple : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(
          icon,
          color: isSelected ? Colors.white : Colors.grey,
        ),
      ),
      label: label,
    );
  }
}