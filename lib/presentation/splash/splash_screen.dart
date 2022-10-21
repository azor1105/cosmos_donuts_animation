import 'dart:math';

import 'package:cosmos_donuts/utils/my_colors.dart';
import 'package:cosmos_donuts/utils/my_images.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController imageAnimationController = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 5),
  )..addListener(() {
      setState(() {});
    });
  late final Animation rotateAnimation = Tween<double>(
    begin: 0,
    end: 2 * pi,
  ).animate(imageAnimationController);
  late final AnimationController scaleAnimationController = AnimationController(
    duration: const Duration(seconds: 3),
    vsync: this,
  )
    ..forward()
    ..addListener(
      () {
        if (scaleAnimationController.isCompleted) {
          imageAnimationController.repeat();
        }
      },
    );
  late final Animation<double> scaleAnimation = CurvedAnimation(
    parent: scaleAnimationController,
    curve: Curves.fastOutSlowIn,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.cFFE94A,
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Expanded(child: SizedBox(),),
              Stack(
                children: [
                  ScaleTransition(
                    scale: CurvedAnimation(
                      parent: scaleAnimationController,
                      curve: Curves.fastOutSlowIn,
                    ),
                    child: Image.asset(
                      MyImages.backgroundImgOfDonut,
                      height: 300,
                    ),
                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.center,
                      child: ScaleTransition(
                        scale: CurvedAnimation(
                          curve: Curves.bounceInOut,
                          parent: scaleAnimationController,
                        ),
                        child: Transform.rotate(
                          angle: rotateAnimation.value,
                          child: Image.asset(
                            MyImages.donutImg,
                            height: 100,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              AnimatedOpacity(
                opacity: scaleAnimationController.isCompleted ? 1.0 : 0.0,
                duration: const Duration(seconds: 3),
                child: const Text(
                  "Cosmos Donusts",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              AnimatedOpacity(
                opacity: scaleAnimationController.isCompleted ? 1.0 : 0.0,
                duration: const Duration(seconds: 3),
                child: const Text(
                  "Order donuts, sweets, candies\n and snacks from us",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const Expanded(child: SizedBox(),),
              AnimatedOpacity(
                opacity: scaleAnimationController.isCompleted ? 1.0 : 0.0,
                duration: const Duration(seconds: 3),
                child: const Text(
                  "Designed & coded by Azor",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}
