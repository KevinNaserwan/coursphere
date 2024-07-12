import 'package:coursphere/components/navbar.dart';
import 'package:coursphere/home/home.dart';
import 'package:coursphere/util/data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 60, right: 30),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Navbar(),
                      ),
                    );
                  },
                  child: Text('Skip',
                      textAlign: TextAlign.end,
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Color.fromARGB(255, 73, 73, 73),
                        fontWeight: FontWeight.w400,
                      )),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 50),
                    child: Column(
                      key: ValueKey<int>(_currentIndex),
                      children: [
                        Image.asset(
                          splashData[_currentIndex].imagePath,
                          width: splashData[_currentIndex].width,
                        ),
                        const SizedBox(height: 60),
                        Text(
                          splashData[_currentIndex].title,
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 16.0, horizontal: 30),
                          child: Text(
                            splashData[_currentIndex].subtitle,
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: const Color.fromARGB(137, 63, 63, 63),
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(splashData.length, (index) {
                        return AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          width: _currentIndex == index ? 30 : 9,
                          height: 9,
                          decoration: BoxDecoration(
                            color: _currentIndex == index
                                ? const Color(0XFF406882)
                                : const Color(0XFFD9D9D9),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        );
                      }),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 50, left: 30, right: 30, bottom: 40),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          backgroundColor: const Color(0XFF406882),
                          padding: const EdgeInsets.symmetric(
                              vertical: 16.0, horizontal: 30),
                        ),
                        onPressed: () {
                          setState(() {
                            if (_currentIndex < splashData.length - 1) {
                              _currentIndex++;
                            } else {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Navbar(),
                                ),
                              );
                            }
                          });
                        },
                        child: Text(
                          _currentIndex == 2 ? 'Get Started' : 'Next',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
