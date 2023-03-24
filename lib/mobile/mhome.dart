// ignore_for_file: camel_case_types, deprecated_member_use

import 'package:antdesign_icons/antdesign_icons.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:w1/constant/colorsize.dart';
import 'package:w1/model/home.dart';
import 'package:w1/widget/animated-dp.dart';
import 'package:w1/widget/hover-icon.dart';
import 'package:w1/widget/skill-icon.dart';
import 'package:w1/widget/snack-bar.dart';

class mHome extends StatelessWidget {
  // const
  mHome({
    super.key,
    required this.pad,
    required this.style,
  });

  final double pad;
  final TextStyle style;
  final CollectionReference homeReference =
      FirebaseFirestore.instance.collection('home');

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: pad,
      height: 800,
      child: StreamBuilder<QuerySnapshot>(
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
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 70,
                  ),
                  AnimatedDp(
                    dpImage: home[0].dp,
                  ),
                  const SizedBox(height: 50),
                  Text(
                    home[0].slogan,
                    textAlign: TextAlign.center,
                    style: style.copyWith(
                        fontSize: extraLargeT, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    home[0].bio,
                    textAlign: TextAlign.center,
                    style: style.copyWith(color: darkC.withOpacity(0.6)),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      HoverIcon(
                        icon: const Icon(AntIcons.linkedinFilled),
                        pressed: () {
                          launch(home[0].linkedin);
                        },
                      ),
                      HoverIcon(
                        icon: const Icon(AntIcons.githubFilled),
                        pressed: () {
                          launch(home[0].github);
                        },
                      ),
                      HoverIcon(
                        icon: const Icon(AntIcons.instagramFilled),
                        pressed: () {
                          launch(home[0].instagram);
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Top Skills',
                        style: style.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        '|',
                        style: style.copyWith(
                            color: darkC.withOpacity(0.6), fontSize: 25),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      SkillIcon(skillImage: home[0].skill1),
                      SkillIcon(skillImage: home[0].skill2),
                      SkillIcon(skillImage: home[0].skill3),
                      SkillIcon(skillImage: home[0].skill4),
                      SkillIcon(skillImage: home[0].skill5),
                    ],
                  )
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
          }),
    );
  }
}
