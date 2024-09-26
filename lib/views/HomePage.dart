import 'package:animate_do/animate_do.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:front_end_sih/globals/app.colors.dart';
import 'package:front_end_sih/globals/app_button.dart';
import 'package:front_end_sih/globals/app_text_styles.dart';
import 'package:front_end_sih/globals/constants.dart';
import 'package:front_end_sih/views/about.dart';
import 'package:front_end_sih/views/contact_us.dart';
import 'package:front_end_sih/views/solutions.dart';
import 'package:front_end_sih/widgets/profile_animation.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 7, 173, 93),
        elevation: 0,
        toolbarHeight: 90,
        titleSpacing: 100,
        bottomOpacity: 23,
        title: Row(
          children: [
            Row(
              children: [
                const CircleAvatar(
                  maxRadius: 20,
                  foregroundImage: AssetImage("assets/logo.png"),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  "Water Wizards",
                  style: AppTextStyles.heading(),
                ),
              ],
            ),
            const Spacer(),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/home');
              },
              child: Text(
                "Home",
                style: AppTextStyles.headerTextStyle(),
              ),
            ),
            const SizedBox(width: 30),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/about');
              },
              child: Text(
                "About",
                style: AppTextStyles.headerTextStyle(),
              ),
            ),
            const SizedBox(width: 30),
            InkWell(
              child: Text(
                "Chatbot",
                style: AppTextStyles.headerTextStyle(),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/chatbot');
              },
            ),
            const SizedBox(
              width: 15,
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, "/result");
              },
              child: Text("Result", style: AppTextStyles.headerTextStyle()),
            ),
            const SizedBox(width: 30),
            // InkWell(
            //   onTap: () {
            //     Navigator.pushNamed(context, '/solutions');
            //   },
            //   child: Text(
            //     "Solutions",
            //     style: AppTextStyles.headerTextStyle(),
            //   ),
            // ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          top: size.height * 0.05,
          right: size.width * 0.1,
          left: size.width * 0.1,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FadeInDown(
                      duration: const Duration(milliseconds: 1200),
                      child: Text(
                        "Welcome to the Grey Water Management platform",
                        style:
                            AppTextStyles.montserratStyle(color: Colors.white),
                      ),
                    ),
                    Constants.sizedBox(height: 15),
                    FadeInRight(
                      duration: const Duration(milliseconds: 1400),
                      child: Text(
                        "where technology meets environmental safety",
                        style: AppTextStyles.headingStyles(),
                      ),
                    ),
                    Constants.sizedBox(height: 15),
                    FadeInLeft(
                      duration: const Duration(milliseconds: 1400),
                      child: Row(
                        children: [
                          Text(
                            "Explore ",
                            style: AppTextStyles.montserratStyle(
                                color: Colors.white),
                          ),
                          AnimatedTextKit(
                            animatedTexts: [
                              TyperAnimatedText(
                                'our project',
                                textStyle: AppTextStyles.montserratStyle(
                                    color:
                                        const Color.fromARGB(255, 244, 212, 3)),
                              ),
                              TyperAnimatedText(
                                'SIH solutions',
                                textStyle: AppTextStyles.montserratStyle(
                                    color:
                                        const Color.fromARGB(255, 244, 212, 3)),
                              ),
                              TyperAnimatedText(
                                'Technologies used',
                                textStyle: AppTextStyles.montserratStyle(
                                    color:
                                        const Color.fromARGB(255, 244, 212, 3)),
                              ),
                            ],
                            pause: const Duration(milliseconds: 1000),
                            displayFullTextOnTap: true,
                            stopPauseOnTap: true,
                          ),
                        ],
                      ),
                    ),
                    Constants.sizedBox(height: 15),
                    FadeInDown(
                      duration: const Duration(milliseconds: 1600),
                      child: SizedBox(
                        width: size.width * 0.2,
                        child: Text(
                          " Join us in creating healthier communities with smarter, data-driven water management solutions.",
                          style: AppTextStyles.normalStyle(),
                        ),
                      ),
                    ),
                    Constants.sizedBox(height: 22),
                    // FadeInUp(
                    //   duration: const Duration(milliseconds: 1600),
                    //   child: Row(
                    //     children: [
                    //       buildSocialButton(asset: AppAssets.github),
                    //       Constants.sizedBox(width: 12),
                    //       buildSocialButton(asset: AppAssets.linkedIn),
                    //     ],
                    //   ),
                    // ),
                    Constants.sizedBox(height: 22),
                    FadeInUp(
                      duration: const Duration(milliseconds: 1600),
                      child: AppButton.buildMaterialButton(
                          onTap: () {
                            Navigator.pushNamed(context, '/about');
                          },
                          buttonName: "Explore Our Project"),
                    ),
                  ],
                ),
                const ProfileAnimation(),
              ],
            ),
            const SizedBox(
              height: 220,
            ),
            const AboutMe(),
            const Solutions(),
            const ContactUs(),
          ],
        ),
      ),
    );
  }

  Ink buildSocialButton({required String asset}) {
    return Ink(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.bgColor, width: 3.0),
          color: AppColors.bgColor,
          shape: BoxShape.circle),
      padding: const EdgeInsets.all(6),
      child: InkWell(
        splashColor: AppColors.lawGreen,
        hoverColor: AppColors.aqua,
        onTap: () {},
        radius: 50,
        borderRadius: BorderRadius.circular(500),
        child: Image.asset(
          asset,
          width: 24,
          height: 22,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
