import 'package:flutter/material.dart';
import 'package:cristri_dana/common/app_color.dart';
import 'package:cristri_dana/common/app_sized_box.dart';
import 'dart:async';

class Gallery extends StatefulWidget {
  const Gallery({Key? key}) : super(key: key);

  @override
  State<Gallery> createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  final List<String> imagePaths = [
    'lib/assets/images/20.jpg',
    'lib/assets/images/03.jpg',
    'lib/assets/images/22.jpg',
    'lib/assets/images/19.jpg',
    'lib/assets/images/08.jpg',
    'lib/assets/images/1.jpg',
    'lib/assets/images/2.jpg',
    'lib/assets/images/3.jpg',
    'lib/assets/images/4.jpg',
  ];

  int currentIndex = 0;
  final PageController pageController = PageController();
  @override
  void initState() {
    super.initState();
    // Start auto-scrolling when the widget is first built
    startAutoScroll();
  }

  @override
  void dispose() {
    // Dispose the PageController to avoid memory leaks
    pageController.dispose();
    super.dispose();
  }

  void startAutoScroll() {
    // Define the duration for each scroll animation
    const duration = Duration(seconds: 5);

    // Create a Timer that scrolls to the next page every 'duration' time interval
    Timer.periodic(duration, (_) {
      if (currentIndex < imagePaths.length - 1) {
        currentIndex++;
      } else {
        currentIndex = 0;
        pageController.jumpToPage(0);
      }
      pageController.animateToPage(
        currentIndex,
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    
    return Container(
      color: AppColor.secondary,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(width: 5, color: AppColor.primary),
                bottom: BorderSide(width: 5, color: AppColor.primary),
              ),
            ),
            height: 80,
            child: const Center(
              child: Text(
                'GALLERY PHOTO',
                style: TextStyle(
                  color: AppColor.primary,
                  fontFamily: 'JosefinSans',
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ),
          ),
          AppSizedBox.sizedBoxH10,
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Center(
                    child: Text(
                      'Tidak ada yang spesial dalam cerita kami. Tapi kami sangat spesial untuk satu sama lain. Dan Kami bersyukur, dipertemukan diwaktu terbaik, Kini kami menanti hari istimewa kami.',
                      style: TextStyle(
                        color: AppColor.primary,
                        fontFamily: 'JosefinSans',
                        fontSize: 15,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Expanded(
                  child: PageView.builder(
                    controller: pageController, // Use the PageController
                    onPageChanged: (index) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    itemCount: imagePaths.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: AssetImage(imagePaths[index]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildPageIndicator(),
                ),
                AppSizedBox.sizedBoxH10,
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildPageIndicator() {
    List<Widget> indicators = [];

    for (int i = 0; i < imagePaths.length; i++) {
      indicators.add(
        Container(
          width: 8,
          height: 8,
          margin: const EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: currentIndex == i ? Colors.white : Colors.grey,
          ),
        ),
      );
    }

    return indicators;
  }
}
