import 'package:flutter/material.dart';
import 'package:cristri_dana/common/app_color.dart';
import 'package:cristri_dana/common/app_sized_box.dart';

class Closing extends StatelessWidget {
  const Closing({Key? key}) : super(key: key);

  static const rekeningBca = '123456789';
  static const rekeningOvo = '123656789';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.secondary,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('lib/assets/images/logo2.png'),
          AppSizedBox.sizedBoxH10,
          const Text(
            'CRISTRI | DANA',
            style: TextStyle(
              color: AppColor.primary,
              fontFamily: 'JosefinSans',
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
          AppSizedBox.sizedBoxH10,
          const Text(
            'Thank you for celebrating with us!',
            style: TextStyle(
              color: AppColor.primary,
              fontFamily: 'JosefinSans',
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
