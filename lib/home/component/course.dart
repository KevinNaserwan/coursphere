import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CourseCard extends StatelessWidget {
  const CourseCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            child: Image.asset(
              "assets/images/banner.png",
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Dart',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: const Color(0xFF1A374D),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 6),
                Container(
                  width: 150,
                  child: Text(
                    'Dart Unit Test And Collection',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.video_library,
                        color: const Color(0xFF406882), size: 16),
                    const SizedBox(width: 8),
                    Text(
                      '2 Videos',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: Color(0xFF406882),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Icon(Icons.access_time, color: Color(0xFF406882), size: 16),
                    const SizedBox(width: 8),
                    Text(
                      '4 H 18 M',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: Color(0xFF406882),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                    Row(
                      children: List.generate(
                        3,
                        (index) =>
                            Icon(Icons.star, color: Colors.yellow, size: 16),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
