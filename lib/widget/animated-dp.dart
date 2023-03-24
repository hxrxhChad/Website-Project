// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: file_names

import 'package:flutter/material.dart';

import 'package:w1/constant/colorsize.dart';

// class AnimatedDp extends StatefulWidget {
//   const AnimatedDp({
//     Key? key,
//     required this.dpImage,
//   }) : super(key: key);
//   final String dpImage;
//   @override
//   State<AnimatedDp> createState() => _AnimatedDpState();
// }

// class _AnimatedDpState extends State<AnimatedDp> with TickerProviderStateMixin {
//   //
//   AnimationController? _controller;
//   Animation<double>? _rotationAnimation;
//   Animation<double>? _radiusAnimation;

//   @override
//   void initState() {
//     super.initState();

//     // animation-controller
//     _controller =
//         AnimationController(vsync: this, duration: const Duration(seconds: 7))
//           ..forward();

//     // rotation-animation
//     _rotationAnimation = Tween(begin: 0.95, end: 1.0).animate(
//         CurvedAnimation(parent: _controller!, curve: Curves.bounceInOut));

//     // radius-animation -> from circle to square
//     _radiusAnimation = Tween(begin: 450.0, end: 60.0).animate(
//         CurvedAnimation(parent: _controller!, curve: Curves.easeInOut));

//     //
//     _controller!.repeat();

//     //
//     _controller!.addListener(() {
//       setState(() {});
//     });

//     //
//     _controller!.addStatusListener((status) {
//       if (status == AnimationStatus.completed) {
//         _controller!.reverse();
//       } else if (status == AnimationStatus.dismissed) {
//         _controller!.forward();
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _controller!.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Transform.scale(
//       scale: _rotationAnimation!.value,
//       child: Container(
//         height: 200,
//         width: 200,
//         decoration: BoxDecoration(
//             color: Colors.white,
//             border: Border.all(color: darkC, width: 3),
//             borderRadius: BorderRadius.circular(_radiusAnimation!.value),
//             image: DecorationImage(
//                 image: NetworkImage(widget.dpImage), fit: BoxFit.cover)),
//       ),
//     );
//   }
// }

class AnimatedDp extends StatelessWidget {
  const AnimatedDp({
    Key? key,
    required this.dpImage,
  }) : super(key: key);
  final String dpImage;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: darkC, width: 3),
          shape: BoxShape.circle,
          image:
              DecorationImage(image: NetworkImage(dpImage), fit: BoxFit.cover)),
    );
  }
}
