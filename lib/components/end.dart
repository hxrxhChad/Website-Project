// ignore_for_file: deprecated_member_use

import 'package:antdesign_icons/antdesign_icons.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:w1/model/home.dart';
import 'package:w1/widget/snack-bar.dart';
import 'package:w1/widget/zoom-icon.dart';

class End extends StatelessWidget {
  // const
  End({
    super.key,
    required this.style,
  });

  final TextStyle style;
  final CollectionReference homeReference =
      FirebaseFirestore.instance.collection('home');

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(
        'Copyright © 2023. All rights are reserved',
        style: style.copyWith(color: Colors.white),
      ),
      StreamBuilder<QuerySnapshot>(
          stream: homeReference.snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              showSnackBar(context, Colors.redAccent, 'Something went wrong');
            }
            if (snapshot.hasData) {
              QuerySnapshot querySnapshot = snapshot.data!;
              List<QueryDocumentSnapshot> documents = querySnapshot.docs;
              List<lHome> home = documents
                  .map((e) => lHome(
                      name: e['name'],
                      bio: e['bio'],
                      slogan: e['slogan'],
                      github: e['github'],
                      instagram: e['instagram'],
                      linkedin: e['linkedin'],
                      dp: e['dp'],
                      skill1: e['skill1'],
                      skill2: e['skill2'],
                      skill3: e['skill3'],
                      skill4: e['skill4'],
                      skill5: e['skill5'],
                      skill6: e['skill6']))
                  .toList();

              //
              return Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ZoomIcon(
                      icon: const Icon(AntIcons.githubFilled),
                      pressed: () {
                        launch(home[0].github);
                      }),
                  ZoomIcon(
                      icon: const Icon(AntIcons.linkedinFilled),
                      pressed: () {
                        launch(home[0].linkedin);
                      }),
                  ZoomIcon(
                      icon: const Icon(AntIcons.instagramFilled),
                      pressed: () {
                        launch(home[0].instagram);
                      }),
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
