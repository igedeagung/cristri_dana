import 'package:flutter/material.dart';
import 'package:cristri_dana/common/app_sized_box.dart';
import 'package:cristri_dana/common/app_color.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';

class Reservation extends StatefulWidget {
  const Reservation({Key? key}) : super(key: key);

  @override
  State<Reservation> createState() => _ReservationState();
}

class _ReservationState extends State<Reservation> {
  final formKey = GlobalKey<FormState>();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final String attended = 'Iya, saya akan datang';
  final String hesitate = 'Saya masih ragu';
  final String unattended = 'Maaf, saya tidak bisa datang';
  final String phoneNumber = '+6282230754856';

  String name = '';
  int total = 0;
  String message = '';
  String attendedStatus = 'Iya, saya akan datang';

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
                'RESERVASI KEHADIRAN',
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
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          style: const TextStyle(fontFamily: 'JosefinSans'),
                          decoration: const InputDecoration(
                            labelText: 'Nama',
                            hintText: 'Isikan nama anda',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Nama harus diisi';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            name = value!;
                          },
                        ),
                        AppSizedBox.sizedBoxH10,
                        TextFormField(
                          style: const TextStyle(fontFamily: 'JosefinSans'),
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            labelText: 'Jumlah',
                            hintText: 'Jumlah yang akan hadir',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Jumlah harus diisi';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            total = int.tryParse(value!)!;
                          },
                        ),
                        AppSizedBox.sizedBoxH10,
                        TextFormField(
                          style: const TextStyle(fontFamily: 'JosefinSans'),
                          maxLines: 5,
                          minLines: 3,
                          decoration: const InputDecoration(
                            labelText: 'Pesan dan Doa Restu',
                            hintText: 'Berikan Pesan dan Doa Restu',
                            border: OutlineInputBorder(),
                          ),
                          onSaved: (value) {
                            // Do something with the value
                            message = value!;
                          },
                        ),
                        AppSizedBox.sizedBoxH10,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RadioListTile(
                              title: Text(
                                attended,
                                style:
                                    const TextStyle(fontFamily: 'JosefinSans'),
                              ),
                              value: attended,
                              groupValue: attendedStatus,
                              onChanged: (value) {
                                setState(() {
                                  attendedStatus = value.toString();
                                });
                              },
                            ),
                            RadioListTile(
                              title: Text(
                                hesitate,
                                style:
                                    const TextStyle(fontFamily: 'JosefinSans'),
                              ),
                              value: hesitate,
                              groupValue: attendedStatus,
                              onChanged: (value) {
                                setState(() {
                                  attendedStatus = value.toString();
                                });
                              },
                            ),
                            RadioListTile(
                              title: Text(
                                unattended,
                                style:
                                    const TextStyle(fontFamily: 'JosefinSans'),
                              ),
                              value: unattended,
                              groupValue: attendedStatus,
                              onChanged: (value) {
                                setState(() {
                                  attendedStatus = value.toString();
                                });
                              },
                            ),
                          ],
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              formKey.currentState!.save();
                              // Save data to database or perform other actions
                              await firestore.collection('attend').add({
                                'name': name,
                                'total': total,
                                'message': message,
                                'attendedStatus': attendedStatus
                              });

                              String messageWa;
                              if (attendedStatus == unattended) {
                                messageWa =
                                    'Hai, saya $name ingin konfirmasi kehadiran pada undangan pernikahan digital bahwa $attendedStatus. Saya ucapkan: _*$message*_. Terima kasih ya.';
                              } else {
                                messageWa =
                                    'Hai, saya $name ingin konfirmasi kehadiran pada undangan pernikahan digital bahwa $attendedStatus dengan $total orang bersama saya. Saya ucapkan: _*$message*_. Terima kasih ya.';
                              }
                              launchUrl(
                                Uri.parse(
                                    'https://wa.me/$phoneNumber?text=$messageWa'),
                              );
                            }
                          },
                          child: const Text(
                            'Konfirmasi via Whatsapp',
                            style: TextStyle(fontFamily: 'JosefinSans'),
                          ),
                        ),
                      ],
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
