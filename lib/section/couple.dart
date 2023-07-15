import 'package:flutter/material.dart';
import 'package:cristri_dana/common/app_color.dart';
import 'package:cristri_dana/common/app_sized_box.dart';

class Couple extends StatefulWidget {
  const Couple({Key? key}) : super(key: key);

  @override
  State<Couple> createState() => _CoupleState();
}

class _CoupleState extends State<Couple> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

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
                'WE\'RE GETTING MARRIED',
                style: TextStyle(
                  color: AppColor.primary,
                  fontFamily: 'JosefinSans',
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          AppSizedBox.sizedBoxH20,
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Om Swastyastu',
              style: TextStyle(
                color: AppColor.primary,
                fontFamily: 'JosefinSans',
                fontSize: 15,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Maha suci Sang Hyang Widhi Wasa yang telah menciptakan mahluk-Nya berpasang-pasangan. Perkenankanlah kami menikahkan putra-putri kami :',
              style: TextStyle(
                color: AppColor.primary,
                fontFamily: 'JosefinSans',
                fontSize: 15,
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    const maxWidth = 300; // Set your desired maximum width here

                    if (constraints.maxWidth > maxWidth) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Center(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Image.asset(
                                  'lib/assets/images/komang.JPG',
                                  height: 250,
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Center(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Image.asset(
                                  'lib/assets/images/putu.JPG',
                                  height: 250,
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    } else {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Center(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Image.asset(
                                  'lib/assets/images/komang.JPG',
                                  height: 180,
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Center(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Image.asset(
                                  'lib/assets/images/putu.JPG',
                                  height: 180,
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    }
                  },
                ),
                AppSizedBox.sizedBoxH20,
                const Center(
                  child: Text(
                    'Luh Ayu Komang Cristri Indra Swari',
                    style: TextStyle(
                      color: AppColor.primary,
                      fontFamily: 'JosefinSans',
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                AppSizedBox.sizedBoxH10,
                const Center(
                  child: Text(
                    'Putri dari Bapak Putu Yastawan dan Putu Tirtanadi',
                    style: TextStyle(
                      color: AppColor.primary,
                      fontFamily: 'JosefinSans',
                      fontSize: 15,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                AppSizedBox.sizedBoxH20,
                const Center(
                  child: Text(
                    'DENGAN',
                    style: TextStyle(
                      color: AppColor.primary,
                      fontFamily: 'JosefinSans',
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                AppSizedBox.sizedBoxH20,
                const Center(
                  child: Text(
                    'I Putu Danawanda Juniada',
                    style: TextStyle(
                      color: AppColor.primary,
                      fontFamily: 'JosefinSans',
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                AppSizedBox.sizedBoxH10,
                const Center(
                  child: Text(
                    'Putra dari Bapak Wayan Toya dan Suwantiningsih',
                    style: TextStyle(
                      color: AppColor.primary,
                      fontFamily: 'JosefinSans',
                      fontSize: 15,
                    ),
                    textAlign: TextAlign.center,
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
