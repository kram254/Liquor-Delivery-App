import 'package:flutter/material.dart';
import 'package:lika/utils/colors.dart';
import 'package:lika/utils/helpers.dart';
import 'package:lika/view/auth/code.dart';

class Auth extends StatefulWidget {
  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: accentTransparent,
        child: Stack(
          children: [
            ClipPath(
              clipper: AuthClipper(),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [accent, orange],
                  ),
                ),
              ),
            ),
            Container(
              // decoration: BoxDecoration(color: primary),
              child: Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        child: Image.asset(
                          'assets/logo/logo.png',
                          height: 70,
                        ),
                      ),
                      setHeight(16),
                      TextFormField(
                        decoration: InputDecoration(
                          focusColor: Colors.white,
                          prefixIcon: Icon(Icons.person),
                          hintText: "Full Name",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              48,
                            ),
                            borderSide: BorderSide.none,
                          ),
                          fillColor: accent,
                          filled: true,
                        ),
                      ),
                      setHeight(16),
                      TextFormField(
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          focusColor: Colors.white,
                          prefixIcon: Icon(Icons.phone),
                          hintText: "Phone number",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              48,
                            ),
                            borderSide: BorderSide.none,
                          ),
                          fillColor: accent,
                          filled: true,
                        ),
                      ),
                      setHeight(24),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (context) {
                            return Code();
                          }));
                        },
                        child: Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: primary,
                            borderRadius: BorderRadius.circular(
                              48,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "SEND OTP",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
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
          ],
        ),
      ),
    );
  }
}

class AuthClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(0, size.height * 0.75);
    path.quadraticBezierTo(
        size.width * 0.55, size.height * 0.8, size.width, size.height * 0.55);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}
