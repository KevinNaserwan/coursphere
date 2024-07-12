import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:coursphere/home/home.dart';
import 'package:google_fonts/google_fonts.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int activeIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      activeIndex = index;
    });
  }

  Widget _buildNavItem({
    required int index,
    required String asset,
    required String label,
  }) {
    bool isActive = index == activeIndex;
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        padding:
            EdgeInsets.symmetric(horizontal: isActive ? 15 : 0, vertical: 10),
        decoration: isActive
            ? BoxDecoration(
                color: Color(0xFFB1D0E0),
                borderRadius: BorderRadius.circular(10),
              )
            : BoxDecoration(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              asset,
              width: 20,
              height: 20,
              colorFilter: isActive
                  ? ColorFilter.mode(Color(0xFF406882), BlendMode.srcIn)
                  : null,
            ),
            SizedBox(width: isActive ? 15 : 0),
            AnimatedSize(
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              child: Text(
                isActive ? label : '',
                style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: Color(0xFF406882),
                    fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 201, 225, 237),
      body: IndexedStack(
        index: activeIndex,
        children: [
          Home(),
          Center(child: Text('Search Page')),
          Center(child: Text('Start Page')),
          Center(child: Text('Book Page')),
          Center(child: Text('Profile Page')),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade400,
                blurStyle: BlurStyle.outer,
                blurRadius: 10.0,
                offset: const Offset(0, -5)),
            BoxShadow(
              color: Colors.white,
              offset: const Offset(-5, 0),
            ),
            BoxShadow(
              color: Colors.white,
              offset: const Offset(5, 0),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(
              top: 12.0, bottom: 35.0, left: 0.0, right: 0.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildNavItem(
                  index: 0, asset: 'assets/Icon/Home.svg', label: 'Home'),
              _buildNavItem(
                  index: 1, asset: 'assets/Icon/Search.svg', label: 'Search'),
              _buildNavItem(
                  index: 2, asset: 'assets/Icon/start.svg', label: 'Start'),
              _buildNavItem(
                  index: 3, asset: 'assets/Icon/book.svg', label: 'Book'),
              _buildNavItem(
                  index: 4, asset: 'assets/Icon/Profile.svg', label: 'Profile'),
            ],
          ),
        ),
      ),
    );
  }
}
