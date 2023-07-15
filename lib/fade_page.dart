import 'package:cristri_dana/common/app_color.dart';
import 'package:cristri_dana/common/app_sized_box.dart';

import 'main_page.dart';
import 'package:flutter/material.dart';

class FadePageApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The Wedding of Cristri & Dana',
      theme: ThemeData(
        primarySwatch: AppColor.primarySwatch,
      ),
      home: FadePage(),
    );
  }
}

class FadePage extends StatefulWidget {
  @override
  _FadePageState createState() => _FadePageState();
}

class _FadePageState extends State<FadePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _animation = Tween<Offset>(begin: Offset(0, 0), end: Offset(0, -1))
        .animate(_controller);
    _opacityAnimation =
        Tween<double>(begin: 1, end: 1).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onFadeButtonPressed() {
    _controller.forward().then((_) {
      // Navigating to the main page (main.dart) after the slide animation completes
      Future.delayed(Duration(milliseconds: 100), () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => MainPage()));
      });
    });
  }

@override
Widget build(BuildContext context) {
  return Scaffold(
    body: SlideTransition(
      position: _animation,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Opacity(
            opacity: _opacityAnimation.value,
            child: Image.asset(
              'lib/assets/images/01.jpg', // Replace with your online image URL
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 75.0,
            left: 0,
            right: 0,
            child: Container(
              margin: EdgeInsets.all(15),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColor.secondary, // Replace with your desired background color
                  borderRadius: BorderRadius.circular(10.0), // Add rounded corners
                ),
                child: Opacity(
                  opacity: 1.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      AppSizedBox.sizedBoxH20,
                      const Text(
                        'The Wedding Of',
                        style: TextStyle(
                          color: AppColor.primary,
                          fontFamily: 'JosefinSans',
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'CRISTRI | DANA',
                        style: TextStyle(
                          color: AppColor.primary,
                          fontFamily: 'JosefinSans',
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: _onFadeButtonPressed,
                        child: const Text(
                        'Buka Undangan',
                        style: TextStyle(
                          fontFamily: 'JosefinSans',
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      )),
                      AppSizedBox.sizedBoxH20
                    ],
                  ),
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
