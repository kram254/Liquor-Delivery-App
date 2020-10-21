import 'package:flutter/material.dart';
import 'package:lika/utils/colors.dart';
import 'package:lika/utils/helpers.dart';
// import 'package:lika/view/product/home.dart';
import 'package:lika/view/product/home2.dart';
import 'auth.dart';

class Code extends StatefulWidget {
  @override
  _CodeState createState() => _CodeState();
}

class _CodeState extends State<Code> {
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
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    8,
                                  ),
                                  borderSide: BorderSide.none,
                                ),
                                fillColor: Colors.white24,
                                filled: true,
                              ),
                            ),
                          ),
                          setWidth(8),
                          Expanded(
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    8,
                                  ),
                                  borderSide: BorderSide.none,
                                ),
                                fillColor: Colors.white24,
                                filled: true,
                              ),
                            ),
                          ),
                          setWidth(8),
                          Expanded(
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    8,
                                  ),
                                  borderSide: BorderSide.none,
                                ),
                                fillColor: Colors.white24,
                                filled: true,
                              ),
                            ),
                          ),
                          setWidth(8),
                          Expanded(
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    8,
                                  ),
                                  borderSide: BorderSide.none,
                                ),
                                fillColor: Colors.white24,
                                filled: true,
                              ),
                            ),
                          ),
                        ],
                      ),
                      setHeight(16),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) {
                                return Home2();
                              },
                            ),
                          );
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
                              "SIGN IN",
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
