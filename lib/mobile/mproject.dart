// ignore_for_file: deprecated_member_use, camel_case_types

import 'package:antdesign_icons/antdesign_icons.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:w1/constant/colorsize.dart';
import 'package:w1/model/project.dart';
import 'package:w1/widget/hover-icon-text.dart';
import 'package:w1/widget/snack-bar.dart';

// mobile-oriented
class mProject extends StatelessWidget {
  // const
  mProject({
    super.key,
    required this.style,
  });

  final TextStyle style;
  final CollectionReference projectReference =
      FirebaseFirestore.instance.collection('project');

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'PORTFOLIO',
          style: style.copyWith(color: purpleC, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          'Each project is a unique piece of development',
          textAlign: TextAlign.center,
          style: style.copyWith(fontWeight: FontWeight.bold, fontSize: largeT),
        ),
        const SizedBox(
          height: 25,
        ),
        StreamBuilder<QuerySnapshot>(
            stream: projectReference.snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                showSnackBar(context, Colors.redAccent, 'Something went wrong');
              }
              if (snapshot.hasData) {
                QuerySnapshot querySnapshot = snapshot.data!;
                List<QueryDocumentSnapshot> documents = querySnapshot.docs;
                List<lProject> project = documents
                    .map((e) => lProject(
                        id: e['id'],
                        name: e['name'],
                        detail: e['detail'],
                        tech1: e['tech1'],
                        tech2: e['tech2'],
                        github: e['github'],
                        web: e['web'],
                        imageUrl: e['imageUrl']))
                    .toList();
                return Column(
                  children: List.generate(
                      project.length,
                      (index) => Padding(
                            padding: const EdgeInsets.only(bottom: 30),
                            child: Material(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              elevation: 15,
                              shadowColor: darkC.withOpacity(0.1),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 30, vertical: 20),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Material(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              elevation: 15,
                                              shadowColor:
                                                  darkC.withOpacity(0.1),
                                              child: Container(
                                                height: 280,
                                                width: 430,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color: Colors.white,
                                                    image: DecorationImage(
                                                        image: NetworkImage(
                                                            project[index]
                                                                .imageUrl),
                                                        fit: BoxFit.cover)),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 30,
                                            ),
                                            Text(
                                              project[index].name,
                                              style: style.copyWith(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const SizedBox(height: 15),
                                            Text(project[index].detail,
                                                textAlign: TextAlign.center,
                                                style: style.copyWith(
                                                    color: darkC
                                                        .withOpacity(0.6))),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Material(
                                                  color: Colors.white,
                                                  elevation: 15,
                                                  shadowColor:
                                                      darkC.withOpacity(0.1),
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 10,
                                                        vertical: 10),
                                                    child: Text(
                                                      project[index].tech1,
                                                      style: const TextStyle(
                                                          color: darkC,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 10),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10),
                                                  child: Material(
                                                    color: Colors.white,
                                                    elevation: 15,
                                                    shadowColor:
                                                        darkC.withOpacity(0.1),
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 10,
                                                          vertical: 10),
                                                      child: Text(
                                                        project[index].tech2,
                                                        style: const TextStyle(
                                                            color: darkC,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 10),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  HoverIconText(
                                                    title: 'GitHub',
                                                    icon: AntIcons.githubFilled,
                                                    pressed: () {
                                                      launch(project[index]
                                                          .github);
                                                    },
                                                  ),
                                                  HoverIconText(
                                                    title: 'Web-Link',
                                                    icon: AntIcons.linkOutlined,
                                                    pressed: () {
                                                      launch(
                                                          project[index].web);
                                                    },
                                                  ),
                                                ])
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )),
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
      ],
    );
  }
}
