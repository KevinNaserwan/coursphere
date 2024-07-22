import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 70),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                Center(
                  child: Text(
                    'Profile',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: const Color(0xFF1A374D),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 40),
                    width: 140,
                    height: 140,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      image: DecorationImage(
                        image: AssetImage("assets/images/profile.JPG"),
                        fit: BoxFit.cover,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3), // perubahan shadow offset
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Nama ',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: const Color(0xFF1A374D),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'Kevin Putrayudha Naserwan',
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          color: Color.fromARGB(255, 126, 126, 126),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Divisi',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: const Color(0xFF1A374D),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'Mobile Development',
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          color: Color.fromARGB(255, 126, 126, 126),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 40),
                      Text('Coursphere',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: const Color(0xFF1A374D),
                            fontWeight: FontWeight.w600,
                          )),
                      SizedBox(height: 10),
                      Text(
                          textAlign: TextAlign.justify,
                          'Coursphere adalah aplikasi kursus bahasa pemrograman yang membantu penggunanya untuk mendapatkan wawasan dan mendapatkan panduan tentang bahasa pemrograman. Aplikasi ini menghadirkan fitur pembelajaran yang modern dan menarik bagi penggunanya',
                          style: GoogleFonts.poppins(
                            fontSize: 10,
                            color: Color.fromARGB(255, 150, 150, 150),
                            fontWeight: FontWeight.w600,
                          )),
                      SizedBox(height: 5),
                      Text(
                          textAlign: TextAlign.justify,
                          'Aplikasi ini dimaksudkan untuk membantu orang belajar tentang pengkodean dan pemrograman. Sehingga penggunanya dibimbing dan diarahkan dalam proses pembelajaran. Aplikasi ini cocok untuk mahasiswa yang sibuk sehingga kekurangan jam belajar di perkuliahan maupun pekerja kantoran yang ingin menambah ilmu di dunia Pemrograman',
                          style: GoogleFonts.poppins(
                            fontSize: 10,
                            color: Color.fromARGB(255, 150, 150, 150),
                            fontWeight: FontWeight.w600,
                          ))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 0),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        backgroundColor: const Color(0XFF406882),
                        padding: const EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: 30,
                        ),
                      ),
                      onPressed: () {
                        // Pass context here
                      },
                      child: Text(
                        'Log Out',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
