import 'package:coursphere/book/bookdetail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Book extends StatefulWidget {
  const Book({super.key});

  @override
  State<Book> createState() => _BookState();
}

class _BookState extends State<Book> {
  // Menambahkan state untuk menyimpan menu yang dipilih
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<String> menuItems = [
      'Trending',
      'PHP',
      'Javascript',
      'Frontend',
      'Golang',
      'Dart'
    ];

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 100),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              children: [
                SizedBox(height: 20),
                Center(
                  child: Image.asset(
                    "assets/images/banner-book.png",
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40, bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Recommended',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: const Color(0xFF1A374D),
                            fontWeight: FontWeight.w600,
                          )),
                      Text('See All',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: const Color(0xFF406882),
                            fontWeight: FontWeight.w600,
                          )),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: List.generate(menuItems.length, (index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selectedIndex = index;
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(left: 16.0),
                                child: Column(
                                  children: [
                                    Text(menuItems[index],
                                        style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          color: const Color(0xFF1A374D),
                                          fontWeight: FontWeight.w600,
                                        )),
                                    SizedBox(height: 4),
                                    Container(
                                      height: 2,
                                      width: 70,
                                      color: _selectedIndex == index
                                          ? const Color(0xFF1A374D)
                                          : Colors.transparent,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                        ),
                        Container(
                            height: 1, width: 530, color: Colors.grey.shade300)
                      ]),
                ),
                SizedBox(height: 20),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _buildBookItem(),
                      _buildBookItem(),
                      _buildBookItem(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBookItem() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                BookDetail(), // Adjust to your verification screen
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 150,
              height: 187,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage("assets/images/book.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        "assets/Icon/world.svg",
                        width: 12,
                        height: 12,
                      ),
                      SizedBox(width: 4),
                      Text(
                        'English',
                        style: GoogleFonts.poppins(
                          fontSize: 8,
                          color: const Color(0xFF1A374D),
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                  SizedBox(width: 10),
                  Row(
                    children: [
                      SvgPicture.asset(
                        "assets/Icon/writer.svg",
                        width: 12,
                        height: 12,
                      ),
                      SizedBox(width: 4),
                      Text(
                        'Chong Lip Phang',
                        style: GoogleFonts.poppins(
                          fontSize: 8,
                          color: const Color(0xFF1A374D),
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
              width: 150,
              child: Text(
                'Mastering Front-End Web Development',
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: const Color(0xFF1A374D),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
