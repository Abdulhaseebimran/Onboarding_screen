import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onboarding_screens/controllers/onboarding_controllers.dart';

class OnboardingScreens extends StatefulWidget {
  const OnboardingScreens({Key? key}) : super(key: key);

  @override
  State<OnboardingScreens> createState() => _OnboardingScreensState();
}

class _OnboardingScreensState extends State<OnboardingScreens> {
  final controller = OnboardingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
              controller: controller.pageController,
              onPageChanged: controller.selectedPageIndex,
              itemCount: controller.onboardingPages.length,
              itemBuilder: (context, index) {
              return Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(controller.onboardingPages[index].imageAsset),
                    const SizedBox(height: 32,),
                    Text(controller.onboardingPages[index].title,
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w500),),
                    const SizedBox(height: 32,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 64.0),
                      child: Text(controller.onboardingPages[index].description,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize:  18),),
                    )
                  ],
                ),
              );
            } 
          ),
              Positioned(
                bottom: 20,
                left: 20,
                child: Row(
                  children:
                    List.generate(
                      controller.onboardingPages.length,
                      (index) => Obx(() {
                          return Container(
                            margin: const EdgeInsets.all(4.0),
                            width: 12,
                            height: 12,
                            decoration: BoxDecoration(
                              color: controller.selectedPageIndex.value == index
                                ? Colors.red
                                : Colors.grey,
                              shape: BoxShape.circle
                            ),
                          );
                        }
                      ))
                  ),
              ), Positioned(
              right: 20,
              bottom: 20,
              child: FloatingActionButton(
                elevation: 0,
                onPressed: controller.forwardAction,
                child: Obx(() {
                  return Text(controller.isLastPage ? 'Start' : 'Next');
                }),
              ),
            ),
          ],
        ),
      ));
  }
}