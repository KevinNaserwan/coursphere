import 'package:coursphere/auth/register.dart';
import 'package:coursphere/components/navbar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:coursphere/controller/UserController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _savePassword = false;
  bool _isLoading = false;
  final UserController userController = UserController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String? _emailError;
  String? _passwordError;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 70),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 29),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Login Account',
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Please login with resgistered account',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey.shade600),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // add label
                        Container(
                          margin: EdgeInsets.only(left: 4),
                          child: Text(
                            'Email',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(height: 6),
                        TextField(
                          // Add TextField
                          controller: emailController,
                          decoration: InputDecoration(
                            hintText: 'Enter your email',
                            hintStyle: TextStyle(
                                color: const Color.fromARGB(255, 36, 36, 36),
                                fontWeight: FontWeight.w400),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: _emailError != null
                                      ? Colors.red
                                      : Colors.transparent),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: _emailError != null
                                      ? Colors.red
                                      : Colors.transparent),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: _emailError != null
                                      ? Colors.red
                                      : Colors.transparent),
                            ),
                            filled: true,
                            fillColor: Colors.grey.shade200,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 15,
                            ),
                            prefixIcon: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Image.asset(
                                'assets/Icon/mail.png',
                                width: 28,
                                height: 24, // Optional: Add color if needed
                              ),
                            ),
                          ),
                        ),
                        if (_emailError != null)
                          Padding(
                            padding: const EdgeInsets.only(top: 5, left: 10),
                            child: Text(
                              _emailError!,
                              style: TextStyle(color: Colors.red, fontSize: 12),
                            ),
                          ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // add label
                        Container(
                          margin: EdgeInsets.only(left: 4),
                          child: Text(
                            'Password',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(height: 6),
                        TextField(
                          // Add TextField
                          controller: passwordController,
                          decoration: InputDecoration(
                            hintText: 'Enter your password',
                            hintStyle: TextStyle(
                                color: const Color.fromARGB(255, 36, 36, 36),
                                fontWeight: FontWeight.w400),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: _passwordError != null
                                      ? Colors.red
                                      : Colors.transparent),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: _passwordError != null
                                      ? Colors.red
                                      : Colors.transparent),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: _passwordError != null
                                      ? Colors.red
                                      : Colors.transparent),
                            ),
                            filled: true,
                            fillColor: Colors.grey.shade200,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 15,
                            ),
                            prefixIcon: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Image.asset(
                                'assets/Icon/lock.png',
                                width: 28,
                                height: 29, // Optional: Add color if needed
                              ),
                            ),
                          ),
                        ),
                        if (_passwordError != null)
                          Padding(
                            padding: const EdgeInsets.only(top: 5, left: 10),
                            child: Text(
                              _passwordError!,
                              style: TextStyle(color: Colors.red, fontSize: 12),
                            ),
                          ),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: _savePassword,
                          onChanged: (bool? newValue) {
                            setState(() {
                              _savePassword = newValue!;
                            });
                          },
                        ),
                        Text(
                          'Save password',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        // Handle forgot password logic here
                      },
                      child: Text(
                        'Forgot Password?',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF6998AB),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(),
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
                    onPressed: _isLoading ? null : () => _loginUser(context),
                    child: _isLoading
                        ? CircularProgressIndicator(color: Colors.white)
                        : Text(
                            'Sign In',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Not have an account?',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        )),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Register(),
                          ),
                        );
                      },
                      child: Text(
                        ' Sign Up',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF6998AB),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 1,
                      color: Colors.black,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'Or',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey.shade800,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 1,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/Icon/google.png',
                                width: 30,
                                height: 30,
                              ),
                              SizedBox(width: 18),
                              Text(
                                'Continue with Google',
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(13.0),
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/Icon/facebook.png',
                                width: 25,
                                height: 25,
                              ),
                              SizedBox(width: 18),
                              Text(
                                'Continue with Facebook',
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _loginUser(BuildContext context) async {
    setState(() {
      _isLoading = true;
      _emailError = null;
      _passwordError = null;
    });

    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    try {
      Map<String, dynamic> response =
          await userController.loginUser(email, password);
      // Save the token
      if (response.containsKey('token')) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('auth_token', response['token']);
      }
      // Navigate to Navbar screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Navbar(),
        ),
      );
    } catch (e) {
      // Handle login failure
      print('Failed to log in: $e');

      // Show error messages
      setState(() {
        if (e.toString().contains('User not found: record not found')) {
          _emailError = 'User not found. Please check your email.';
        } else if (e.toString().contains('wrong credentials')) {
          _passwordError = 'Incorrect password. Please try again.';
        } else {
          // If it's a different error, show a generic message
          _emailError = 'Login failed. Please check your email and password.';
        }
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }
}
