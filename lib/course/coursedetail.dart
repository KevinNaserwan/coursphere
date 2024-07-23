import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CourseDetail extends StatefulWidget {
  const CourseDetail({super.key});

  @override
  State<CourseDetail> createState() => _CourseDetailState();
}

class _CourseDetailState extends State<CourseDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // GestureDetector(
              //   onTap: () {
              //     Navigator.pop(context);
              //   },
              //   child: SvgPicture.asset(
              //     "assets/Icon/back.svg",
              //     width: 10,
              //     height: 18,
              //   ),
              // ),
              Container(
                margin: EdgeInsets.only(left: 75),
                child: Text(
                  'Course',
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    color: const Color(0xFF1A374D),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: SvgPicture.asset(
                  "assets/Icon/love.svg",
                  width: 20,
                  height: 20,
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 0),
          child: Column(
            children: [
              SizedBox(height: 40),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 30),
                      width: 350,
                      height: 180,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: AssetImage("assets/images/banner.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Dart',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: const Color(0xFF1A374D),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              "\$2200",
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                                color: const Color(0xFF1A374D),
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              " / Lifetime",
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                                color: const Color(0xFF1A374D),
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30),
                      child: Container(
                        child: Text(
                          'How to make a mobile apps using dart ',
                          style: GoogleFonts.poppins(
                            fontSize: 22,
                            color: const Color(0xFF1A374D),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Image.asset(
                          "assets/Icon/user.png",
                          width: 40,
                          height: 40,
                        ),
                        SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Morgen James',
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  color: const Color(0xFF1A374D),
                                  fontWeight: FontWeight.w600,
                                )),
                            Text('Mentor (8+ Years Experience)',
                                style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  color: const Color(0xFF1A374D),
                                  fontWeight: FontWeight.w400,
                                ))
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Descriptions',
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                                color: const Color(0xFF1A374D),
                                fontWeight: FontWeight.w600,
                              )),
                          SizedBox(height: 5),
                          Container(
                            child: Text(
                              'It is a guide to start building apps mobile using dart program. after this course you can implement this to framework like flutter and other. This help you to... Read More',
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                color: const Color.fromARGB(255, 100, 100, 100),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Videos',
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                                color: const Color(0xFF1A374D),
                                fontWeight: FontWeight.w600,
                              )),
                          SizedBox(height: 20),
                          Padding(
                            padding: EdgeInsets.only(bottom: 20),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: const Color(0xFFE5F0F6),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image.asset("assets/Icon/play.png",
                                        width: 25, height: 25),
                                    Text(
                                      'Dart Introduction',
                                      style: GoogleFonts.poppins(
                                          fontSize: 16,
                                          color: const Color(0xFF1A374D),
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      '7:32',
                                      style: GoogleFonts.poppins(
                                          fontSize: 16,
                                          color: const Color(0xFF1A374D),
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 20),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: const Color(0xFFE5F0F6),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image.asset("assets/Icon/play.png",
                                        width: 25, height: 25),
                                    Text(
                                      'Dart Introduction',
                                      style: GoogleFonts.poppins(
                                          fontSize: 16,
                                          color: const Color(0xFF1A374D),
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      '7:32',
                                      style: GoogleFonts.poppins(
                                          fontSize: 16,
                                          color: const Color(0xFF1A374D),
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 20),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: const Color(0xFFE5F0F6),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image.asset("assets/Icon/play.png",
                                        width: 25, height: 25),
                                    Text(
                                      'Dart Introduction',
                                      style: GoogleFonts.poppins(
                                          fontSize: 16,
                                          color: const Color(0xFF1A374D),
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      '7:32',
                                      style: GoogleFonts.poppins(
                                          fontSize: 16,
                                          color: const Color(0xFF1A374D),
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
