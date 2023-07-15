import 'package:flutter/material.dart';
import 'dart:async';

import 'package:cristri_dana/common/app_color.dart';
import 'package:cristri_dana/common/app_sized_box.dart';

class Intro extends StatefulWidget {
  const Intro({Key? key}) : super(key: key);

  static final DateTime endTime = DateTime.parse("2023-07-27 09:00:00");

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  late Timer timer;
  Duration remainingTime = Duration.zero;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  void startTimer() {
    const duration = Duration(seconds: 1);
    timer = Timer.periodic(duration, (timer) {
      setState(() {
        remainingTime = Intro.endTime.difference(DateTime.now());
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final days = remainingTime.inDays;
    final hours = remainingTime.inHours % 24;
    final minutes = remainingTime.inMinutes % 60;
    final seconds = remainingTime.inSeconds % 60;

    return Container(
      color: AppColor.secondary,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('lib/assets/images/logo.png'),
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
            '27 Juli 2023',
            style: TextStyle(
              color: AppColor.primary,
              fontFamily: 'JosefinSans',
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
          AppSizedBox.sizedBoxH10,
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'We invite you to celebrate our wedding',
              style: TextStyle(
                color: AppColor.primary,
                fontFamily: 'JosefinSans',
                fontSize: 20,                
              ),
              textAlign: TextAlign.center,
            ),
          ),
          AppSizedBox.sizedBoxH10,
          LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              const maxWidth = 300; // Set your desired maximum width here

              if (constraints.maxWidth >= maxWidth) {
                // Desktop layout
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildTimeColumn('Hari', days.toString().padLeft(2, '0')),
                    _buildTimeColumn('Jam', hours.toString().padLeft(2, '0')),
                    _buildTimeColumn(
                        'Menit', minutes.toString().padLeft(2, '0')),
                    _buildTimeColumn(
                        'Detik', seconds.toString().padLeft(2, '0')),
                  ],
                );
              } else {
                // Mobile layout
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildFlexibleTimeColumn(
                        'Hari', days.toString().padLeft(2, '0')),
                    _buildFlexibleTimeColumn(
                        'Jam', hours.toString().padLeft(2, '0')),
                    _buildFlexibleTimeColumn(
                        'Menit', minutes.toString().padLeft(2, '0')),
                    _buildFlexibleTimeColumn(
                        'Detik', seconds.toString().padLeft(2, '0')),
                  ],
                );
              }
            },
          )
        ],
      ),
    );
  }

  Widget _buildFlexibleTimeColumn(String label, String value) {
    return Flexible(
      child: Card(
        margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
        color: AppColor.primary,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                value,
                style: const TextStyle(
                  color: AppColor.secondary,
                  fontFamily: 'JosefinSans',
                  fontSize: 15,
                ),
              ),
              AppSizedBox.sizedBoxH10,
              Text(
                label,
                style: const TextStyle(
                  color: AppColor.secondary,
                  fontFamily: 'JosefinSans',
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTimeColumn(String label, String value) {
    return Card(
      margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
      color: AppColor.primary,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Text(
              value,
              style: const TextStyle(
                color: AppColor.secondary,
                fontFamily: 'JosefinSans',
                fontSize: 15,
              ),
            ),
            AppSizedBox.sizedBoxH10,
            Text(
              label,
              style: const TextStyle(
                color: AppColor.secondary,
                fontFamily: 'JosefinSans',
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
