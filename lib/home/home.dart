import 'package:coursphere/controller/BookCategoryController.dart';
import 'package:coursphere/controller/CourseController.dart';
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
  final BookCategoryController _controller = BookCategoryController();
  final CourseController _courseController = CourseController();
  List<dynamic> _categories = [];
  List<dynamic> _courses = [];

  @override
  void initState() {
    super.initState();
    _fetchCategories();
    _fetchCourses();
  }

  Future<void> _fetchCategories() async {
    try {
      final categories = await _controller.getAllBookCategories();
      setState(() {
        _categories = categories;
      });
    } catch (e) {
      print('Error fetching categories: $e');
    }
  }

  Future<void> _fetchCourses() async {
    try {
      final courses = await _courseController.getAllCourse();
      setState(() {
        _courses = courses;
      });
    } catch (e) {
      print('Error fetching courses: $e');
    }
  }

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
                      child: _categories.isEmpty
                          ? Center(child: CircularProgressIndicator())
                          : ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: _categories.length,
                              itemBuilder: (context, index) {
                                final category = _categories[index];
                                return CategoryChip(
                                  label: category['name'],
                                  iconPath:
                                      'assets/images/category/${category['name'].toLowerCase()}.png',
                                );
                              },
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
                      height: 241,
                      child: _courses.isEmpty
                          ? Center(child: CircularProgressIndicator())
                          : ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: _courses.length,
                              itemBuilder: (context, index) {
                                final course = _courses[index];
                                return Padding(
                                  padding: EdgeInsets.only(left: 16),
                                  child: SizedBox(
                                    width: 320,
                                    child: CourseCard(course: course),
                                  ),
                                );
                              },
                            ),
                    ),
                    SizedBox(height: 20),
                    _buildSectionTitle("Recent Course"),
                    SizedBox(height: 20),
                    SizedBox(
                      height: 241,
                      child: _courses.isEmpty
                          ? Center(child: CircularProgressIndicator())
                          : ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: _courses.length,
                              itemBuilder: (context, index) {
                                final course = _courses[index];
                                return Padding(
                                  padding: EdgeInsets.only(left: 16),
                                  child: SizedBox(
                                    width: 320,
                                    child: CourseCard(course: course),
                                  ),
                                );
                              },
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
