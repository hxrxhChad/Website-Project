// ignore_for_file: camel_case_types

import 'package:antdesign_icons/antdesign_icons.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:w1/constant/colorsize.dart';
import 'package:w1/model/about.dart';
import 'package:w1/widget/rotate-text.dart';
import 'package:w1/widget/snack-bar.dart';

class mAbout extends StatelessWidget {
  // const
  mAbout({
    super.key,
    required this.style,
  });

  final TextStyle style;
  final CollectionReference aboutReference =
      FirebaseFirestore.instance.collection('about');

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: aboutReference.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            showSnackBar(context, Colors.redAccent, 'Something went wrong');
          }
          if (snapshot.hasData) {
            QuerySnapshot querySnapshot = snapshot.data!;
            List<QueryDocumentSnapshot> documents = querySnapshot.docs;
            List<lAbout> about = documents
                .map((e) => lAbout(
                    slogan: e['slogan'],
                    about: e['about'],
                    rotateText: e['rotateText'],
                    bannerUrl: e['bannerUrl']))
                .toList();
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    const SizedBox(
                      width: 380,
                      height: 330,
                    ),
                    Positioned(
                      top: 0,
                      left: 0,
                      child: Container(
                        height: 270,
                        width: 310,
                        decoration: BoxDecoration(
                            color: darkC.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                                image: NetworkImage(about[0].bannerUrl),
                                fit: BoxFit.cover)),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 30,
                      child: Stack(
                        children: [
                          Container(
                            height: 140,
                            width: 140,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child:
                                  RotateText(rotateText: about[0].rotateText),
                            ),
                          ),
                          const Positioned(
                              top: 0,
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Icon(
                                AntIcons.securityScanFilled,
                                color: darkC,
                              ))
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ABOUT ME',
                      style: style.copyWith(
                          color: purpleC, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      about[0].slogan,
                      style: style.copyWith(
                          fontWeight: FontWeight.bold, fontSize: largeT),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      about[0].about,
                      style: style.copyWith(color: darkC.withOpacity(0.6)),
                    ),
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
        });
  }
}
