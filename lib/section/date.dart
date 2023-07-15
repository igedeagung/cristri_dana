import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cristri_dana/common/app_color.dart';
import 'package:cristri_dana/common/app_sized_box.dart';

class Date extends StatelessWidget {
  const Date({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                'OUR SPECIAL DAY',
                style: TextStyle(
                  color: AppColor.primary,
                  fontFamily: 'JosefinSans',
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ),
          ),
          AppSizedBox.sizedBoxH20,
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Center(
                  child: Text(
                    'Kamis, 27 Juli 2023',
                    style: TextStyle(
                      color: AppColor.primary,
                      fontFamily: 'JosefinSans',
                      fontSize: 20,
                    ),
                  ),
                ),
                AppSizedBox.sizedBoxH10,
                const Center(
                  child: Text(
                    'CRISTRI & DANA',
                    style: TextStyle(
                      color: AppColor.primary,
                      fontFamily: 'JosefinSans',
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  clipBehavior: Clip.antiAlias,
                  color: Colors.white,
                  shadowColor: Colors.grey.withOpacity(0.5),
                  semanticContainer: true,
                  child: SizedBox(
                    height: 150,
                    width: 300,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        AppSizedBox.sizedBoxH10,
                        const Center(
                          child: Text(
                            'Akad Nikah',
                            style: TextStyle(
                              color: AppColor.primary,
                              fontFamily: 'JosefinSans',
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AppSizedBox.sizedBoxH5,
                              const Center(
                                child: Text(
                                  'Pukul 08.00 s/d 13.00',
                                  style: TextStyle(
                                    color: AppColor.primary,
                                    fontFamily: 'JosefinSans',
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                              AppSizedBox.sizedBoxH10,
                              const Center(
                                child: Text(
                                  'Pura Agung Jagat Karana',
                                  style: TextStyle(
                                    color: AppColor.primary,
                                    fontFamily: 'JosefinSans',
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                              AppSizedBox.sizedBoxH10,
                              SizedBox(
                                width: 120,
                                child: ElevatedButton(
                                  onPressed: () {
                                    // code to execute when the button is pressed
                                    launchUrl(
                                      Uri.parse(
                                          'https://goo.gl/maps/Ks3L9YFBqUYyjsx68'),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColor.primary,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Icon(Icons
                                          .place), // Add the map pointer icon
                                      AppSizedBox.sizedBoxH10,
                                      Text(
                                        'Klik Map',
                                        style: TextStyle(
                                          color: AppColor.secondary,
                                          fontFamily: 'JosefinSans',
                                          fontSize: 15,
                                        ),
                                      ), // Add the button text
                                    ],
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
                AppSizedBox.sizedBoxH20,
                Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  clipBehavior: Clip.antiAlias,
                  color: Colors.white,
                  shadowColor: Colors.grey.withOpacity(0.5),
                  semanticContainer: true,
                  child: SizedBox(
                    height: 150,
                    width: 300,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        AppSizedBox.sizedBoxH10,
                        const Center(
                          child: Text(
                            'Resepsi',
                            style: TextStyle(
                              color: AppColor.primary,
                              fontFamily: 'JosefinSans',
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [                            
                              AppSizedBox.sizedBoxH5,
                              const Center(
                                child: Text(
                                  'Pukul 14.00 s/d selesai',
                                  style: TextStyle(
                                    color: AppColor.primary,
                                    fontFamily: 'JosefinSans',
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                              AppSizedBox.sizedBoxH10,
                              const Center(
                                child: Text(
                                  'Tanah Merah IV depan Gang Langga',
                                  style: TextStyle(
                                    color: AppColor.primary,
                                    fontFamily: 'JosefinSans',
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                              AppSizedBox.sizedBoxH10,
                              SizedBox(
                                width: 120,
                                child: ElevatedButton(
                                  onPressed: () {
                                    // code to execute when the button is pressed
                                    launchUrl(
                                      Uri.parse(
                                          'https://goo.gl/maps/XAPLCTt2isBPkar19'),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColor.primary,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Icon(Icons
                                          .place), // Add the map pointer icon
                                      AppSizedBox.sizedBoxH10,
                                      Text(
                                        'Klik Map',
                                        style: TextStyle(
                                          color: AppColor.secondary,
                                          fontFamily: 'JosefinSans',
                                          fontSize: 15,
                                        ),
                                      ), // Add the button text
                                    ],
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
                AppSizedBox.sizedBoxH10,
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Center(
                    child: Text(
                      '"Kami memohon do\'a restu agar proses pernikahan kami berjalan lancar dan dirahmati oleh Sang Hyang Widhi Wasa."',
                      style: TextStyle(
                        color: AppColor.primary,
                        fontFamily: 'JosefinSans',
                        fontSize: 15,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
