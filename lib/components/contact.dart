// ignore_for_file: unused_local_variable, deprecated_member_use

import 'package:antdesign_icons/antdesign_icons.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:w1/constant/colorsize.dart';
import 'package:w1/model/contact.dart';
import 'package:w1/widget/link-text.dart';
import 'package:w1/widget/snack-bar.dart';

class Contact extends StatelessWidget {
  // const
  Contact({
    super.key,
    required this.style,
  });

  final TextStyle style;
  final CollectionReference contactReference =
      FirebaseFirestore.instance.collection('contact');

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        'CONTACT',
        style: style.copyWith(color: purpleC, fontWeight: FontWeight.bold),
      ),
      const SizedBox(
        height: 15,
      ),
      Text(
        "Queries, Suggestions & Feedback are always Welcomed!",
        style: style.copyWith(fontWeight: FontWeight.bold, fontSize: largeT),
      ),
      const SizedBox(
        height: 30,
      ),
      StreamBuilder<QuerySnapshot>(
          stream: contactReference.snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              showSnackBar(context, Colors.redAccent, 'Something went wrong');
            }
            if (snapshot.hasData) {
              QuerySnapshot querySnapshot = snapshot.data!;
              List<QueryDocumentSnapshot> documents = querySnapshot.docs;

              List<lContact> contact = documents
                  .map((e) => lContact(resume: e['resume'], email: e['email']))
                  .toList();

              return Row(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Material(
                        color: Colors.white,
                        shape: const CircleBorder(),
                        elevation: 16,
                        shadowColor: purpleC.withOpacity(0.3),
                        child: Container(
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.white),
                          child: const Padding(
                            padding: EdgeInsets.all(15),
                            child: Icon(
                              AntIcons.mailFilled,
                              color: purpleC,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '   Mail',
                            style: style.copyWith(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          LinkText(
                              title: contact[0].email,
                              pressed: () {
                                launch(contact[0].email);
                              })
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 60,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Material(
                        color: Colors.white,
                        shape: const CircleBorder(),
                        elevation: 16,
                        shadowColor: purpleC.withOpacity(0.3),
                        child: Container(
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.white),
                          child: const Padding(
                            padding: EdgeInsets.all(15),
                            child: Icon(
                              AntIcons.downloadOutlined,
                              color: purpleC,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '   Resume',
                            style: style.copyWith(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          LinkText(
                              title: 'Click here to download',
                              pressed: () {
                                launch(contact[0].resume);
                              })
                        ],
                      )
                    ],
                  ),
                ],
              );
            } else {
              return Center(
                child: SizedBox(
                    height: 60,
                    width: 60,
                    child: LottieBuilder.network(
                        'https://assets3.lottiefiles.com/packages/lf20_fonjkhhq.json')),
              );
            }
          })
    ]);
  }
}
