import 'package:coursphere/home/component/category_chip.dart';
import 'package:coursphere/home/component/course.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 80), // Top padding for status bar
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      "Hi, Kevin",
                      style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF406882)),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Container(
                      width: 250,
                      child: Text(
                        "Find your favorite language course",
                        style: GoogleFonts.poppins(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF1A374D)),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.only(left: 30, bottom: 14, top: 14),
                        hintText: "Search...",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.grey[200],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      "Language Categories",
                      style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF1A374D)),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: SizedBox(
                      height: 50,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          CategoryChip(
                              label: 'Java',
                              iconPath: 'assets/images/category/java.png'),
                          CategoryChip(
                              label: 'Python',
                              iconPath: 'assets/images/category/python.png'),
                          CategoryChip(
                              label: 'PHP',
                              iconPath: 'assets/images/category/php.png'),
                          CategoryChip(
                              label: 'JavaScript',
                              iconPath: 'assets/images/category/js.png'),
                          CategoryChip(
                              label: 'Dart',
                              iconPath: 'assets/images/category/dart.png'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 201, 225, 237),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    _buildSectionTitle("On Going Course"),
                    SizedBox(height: 20),
                    SizedBox(
                      height:
                          271, // Tetap menggunakan height tetap untuk ListView
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        children: List.generate(
                          3,
                          (index) => Padding(
                            padding: EdgeInsets.only(right: 16),
                            child: SizedBox(
                              width: 320,
                              child: CourseCard(),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    _buildSectionTitle("Recent Course"),
                    SizedBox(height: 20),
                    SizedBox(
                      height:
                          271, // Tetap menggunakan height tetap untuk ListView
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        children: List.generate(
                          3,
                          (index) => Padding(
                            padding: EdgeInsets.only(right: 16),
                            child: SizedBox(
                              width: 320,
                              child: CourseCard(),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                        height: 20), // Tambahkan padding bawah jika diperlukan
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1A374D)),
          ),
          Text(
            "View All",
            style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1A374D)),
          ),
        ],
      ),
    );
  }
}
