import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CourseCard extends StatelessWidget {
  final Map<String, dynamic> course;

  const CourseCard({Key? key, required this.course}) : super(key: key);

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
                  course['category']['name'],
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    color: const Color(0xFF1A374D),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 6),
                Container(
                  width: 300,
                  child: Text(
                    course['title'],
                    style: GoogleFonts.poppins(
                      fontSize: 16,
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
                      '${course['videos'].length} Videos',
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
                      _calculateTotalTime(course['videos']),
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: Color(0xFF406882),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                    Row(
                      children: List.generate(
                        course['star'],
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

  String _calculateTotalTime(List<dynamic> videos) {
    int totalMinutes = 0;
    for (var video in videos) {
      List<String> timeParts = video['time'].split(':');
      totalMinutes += int.parse(timeParts[0]) * 60 + int.parse(timeParts[1]);
    }
    int hours = totalMinutes ~/ 60;
    int minutes = totalMinutes % 60;
    return '$hours H ${minutes.toString().padLeft(2, '0')} M';
  }
}
