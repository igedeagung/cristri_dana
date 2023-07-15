import 'package:flutter/material.dart';
import 'package:cristri_dana/common/app_sized_box.dart';
import 'package:cristri_dana/common/app_color.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logging/logging.dart';

class Message extends StatefulWidget {
  const Message({Key? key}) : super(key: key);

  @override
  State<Message> createState() => _MessageState();
}

class _MessageState extends State<Message> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final messageController = TextEditingController();
  final firestore = FirebaseFirestore.instance;
  final logger = Logger('my_logger');

  Future<void> addMessage(String name, String message) async {
    try {
      await firestore.collection('messages').add({
        'name': name,
        'message': message,
        'time': DateTime.now().toUtc(),
      });
      messageController.clear();
    } catch (e) {
      logger.warning(e);
    }
  }

  String getTimeDifference(Timestamp timestamp) {
    final now = DateTime.now().toUtc();
    final messageTime = timestamp.toDate().toUtc();
    final difference = now.difference(messageTime);
    if (difference.inDays > 0) {
      return '${difference.inDays} hari yang lalu';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} jam yang lalu';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} menit yang lalu';
    } else {
      return 'baru saja';
    }
  }

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
                'KIRIMKAN PESAN',
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
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Center(
                    child: Text(
                      'Ucapan selamat dan kebahagiaan bisa dari mana saja. Tanpa berjabatan tangan atau pelukan hangat, masih ada simpul senyum dan doa baik yang kami harapkan.',
                      style: TextStyle(
                        color: AppColor.primary,
                        fontFamily: 'JosefinSans',
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                AppSizedBox.sizedBoxH10,
                Form(
                  key: formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          style: const TextStyle(fontFamily: 'JosefinSans'),
                          controller: nameController,
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
                        ),
                        AppSizedBox.sizedBoxH20,
                        TextFormField(
                          style: const TextStyle(fontFamily: 'JosefinSans'),
                          controller: messageController,
                          decoration: const InputDecoration(
                            labelText: 'Ucapan dan Doa',
                            hintText: 'Tulis Ucapan dan Doa',
                            border: OutlineInputBorder(),
                          ),
                          maxLines: 5,
                          minLines: 3,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Ucapan dan Doa harus diisi';
                            }
                            return null;
                          },
                        ),
                        AppSizedBox.sizedBoxH10,
                        ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              final name = nameController.text;
                              final message = messageController.text;
                              addMessage(name, message);
                            }
                          },
                          child: const Text(
                            'Kirim',
                            style: TextStyle(fontFamily: 'JosefinSans'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: StreamBuilder<QuerySnapshot>(
                    stream: firestore
                        .collection('messages')
                        .orderBy('time', descending: true)
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      final messages = snapshot.data!.docs;
                      return ListView.builder(
                        itemCount: messages.length,
                        itemBuilder: (context, index) {
                          final message =
                              messages[index].data() as Map<String, dynamic>;
                          final name = message['name'] ?? '';
                          final text = message['message'] ?? '';
                          final time = getTimeDifference(message['time']);

                          return ListTile(
                            title: Text(
                              name,
                              style: const TextStyle(
                                fontFamily: 'JosefinSans',
                                color: AppColor.primary,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            subtitle: Text(
                              style: const TextStyle(
                                fontFamily: 'JosefinSans',
                                color: AppColor.primary,
                                fontSize: 15,
                              ),
                              '$text',
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                            ),
                            trailing: Text(
                              style: const TextStyle(
                                fontFamily: 'JosefinSans',
                                color: AppColor.primary,
                                fontSize: 12,
                              ),
                              time,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
