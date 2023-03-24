// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:w1/components/about.dart';
import 'package:w1/components/contact.dart';
import 'package:w1/components/end.dart';
import 'package:w1/components/home.dart';
import 'package:w1/components/project.dart';
import 'package:w1/constant/colorsize.dart';
import 'package:w1/widget/hover-text.dart';

class Tablet extends StatelessWidget {
  // const
  Tablet({super.key});

  //
  final homeKey = GlobalKey();
  final aboutKey = GlobalKey();
  final projectKey = GlobalKey();
  final contactKey = GlobalKey();

  //
  Future scrollToHome() async {
    final context = homeKey.currentContext!;
    await Scrollable.ensureVisible(context,
        duration: const Duration(seconds: 2));
  }

  Future scrollToAbout() async {
    final context = aboutKey.currentContext!;
    await Scrollable.ensureVisible(context,
        duration: const Duration(seconds: 2));
  }

  Future scrollToProject() async {
    final context = projectKey.currentContext!;
    await Scrollable.ensureVisible(context,
        duration: const Duration(seconds: 2));
  }

  Future scrollToContact() async {
    final context = contactKey.currentContext!;
    await Scrollable.ensureVisible(context,
        duration: const Duration(seconds: 2));
  }

  //
  @override
  Widget build(BuildContext context) {
    final pad = MediaQuery.of(context).size.width;
    final style = Theme.of(context)
        .textTheme
        .subtitle2!
        .copyWith(color: darkC, fontWeight: FontWeight.w500, fontSize: mediumT);
    return Scaffold(
      body: Column(
        children: [
          // app-bar
          Material(
            color: Colors.white,
            shadowColor: darkC.withOpacity(0.1),
            elevation: 15,
            child: Container(
              height: 70,
              width: pad,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: desktopS),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'harsh.dev',
                      style: style.copyWith(
                          fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          HoverText(
                            title: 'Home',
                            pressed: () {
                              scrollToHome();
                            },
                          ),
                          HoverText(
                            title: 'About',
                            pressed: () {
                              scrollToAbout();
                            },
                          ),
                          HoverText(
                            title: 'Project',
                            pressed: () {
                              scrollToProject();
                            },
                          ),
                          HoverText(
                            title: 'Contact',
                            pressed: () {
                              scrollToContact();
                            },
                          ),
                        ])
                  ],
                ),
              ),
            ),
          ),
          // body
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // home-sigment
                Padding(
                  key: homeKey,
                  padding: EdgeInsets.symmetric(horizontal: pad * 0.1),
                  child: Home(pad: pad, style: style),
                ),
                // about-sigment
                Container(
                  key: aboutKey,
                  width: pad,
                  height: 500,
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: pad * 0.1),
                    child: About(style: style),
                  ),
                ),
                // project-sigment
                Padding(
                  key: projectKey,
                  padding: EdgeInsets.symmetric(
                      horizontal: pad * 0.1, vertical: 120),
                  child: Project(style: style),
                ),
                // contact-sigment
                Container(
                    key: contactKey,
                    width: pad,
                    color: Colors.white,
                    child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: pad * 0.1, vertical: 100),
                        child: Contact(style: style))),
                // end-segment
                Container(
                    width: pad,
                    height: 100,
                    color: darkC.withOpacity(0.9),
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: pad * 0.1),
                        child: End(style: style))),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
