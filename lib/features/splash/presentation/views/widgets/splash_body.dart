import 'package:bookly/constans.dart';
import 'package:bookly/features/home/presentation/views/home_view.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isDotCenter = false;
  bool _isScalTheCircle = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SizedBox(
        height: double.infinity,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Center(
              child: AnimatedScale(
                duration: Duration(milliseconds: 600),
                curve: Cubic(0.58, -0.3, 0.32, 1),
                scale: _isScalTheCircle ? 10 : 1,

                child: CircleAvatar(
                  radius: 48,
                  backgroundColor: Colors.white,
                  child: Center(
                    child: CircleAvatar(
                      radius: 12,
                      backgroundColor: _isScalTheCircle
                          ? Colors.white
                          : kPrimaryColor,
                    ),
                  ),
                ),
              ),
            ),
            AnimatedPositioned(
              duration: Duration(milliseconds: 500),
              curve: Cubic(.47, -1.4, .36, 1),
              left:
                  (MediaQuery.of(context).size.width / 2) -
                  12 -
                  (_isDotCenter ? 0 : 90),

              child: CircleAvatar(radius: 12, backgroundColor: Colors.white),
            ),
            Positioned(
              width: 109,
              top: 54,
              left: 16,
              child: Image.asset(kLogo),
            ),

            Positioned(
              bottom: 40,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.white),
                ),
                onPressed: () {
                  setState(() {
                    _isDotCenter = !_isDotCenter;
                    Future.delayed(Duration(milliseconds: 520), () {
                      setState(() {
                        _isScalTheCircle = !_isScalTheCircle;
                        Future.delayed(Duration(milliseconds: 600), () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) =>
                                      HomeView(),
                              transitionsBuilder:
                                  (
                                    context,
                                    animation,
                                    secondaryAnimation,
                                    child,
                                  ) => FadeTransition(
                                    opacity: CurvedAnimation(
                                      parent: animation,
                                      curve: Curves.easeIn,
                                    ),
                                    child: child,
                                  ),
                            ),
                          );
                        });
                      });
                    });
                  });
                },
                child: Text(
                  "Read Free Books",
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: kGtSectraFine,
                    color: kPrimaryColor,
                    fontWeight: FontWeight.w900,
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
