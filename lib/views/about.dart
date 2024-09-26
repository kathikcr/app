import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:front_end_sih/globals/app.colors.dart';
import 'package:front_end_sih/globals/app_assets.dart';
import 'package:front_end_sih/globals/constants.dart';
import 'package:front_end_sih/helperclass/helper_class.dart';
import 'package:front_end_sih/globals/app_button.dart';
import '../globals/app_text_styles.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return HelperClass(
      mobile: Column(
        children: [
          buildAboutMeContents(context),
          Constants.sizedBox(height: 35.0),
          buildProfilePicture(),
        ],
      ),
      tablet: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          buildProfilePicture(),
          Constants.sizedBox(width: 25.0),
          Expanded(child: buildAboutMeContents(context))
        ],
      ),
      desktop: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          buildProfilePicture(),
          Constants.sizedBox(width: 25.0),
          Expanded(child: buildAboutMeContents(context))
        ],
      ),
      paddingWidth: size.width * 0.1,
      bgColor: AppColors.bgColor2,
    );
  }

  FadeInRight buildProfilePicture() {
    return FadeInRight(
      duration: const Duration(milliseconds: 1200),
      child: Image.asset(
        AppAssets.profile2,
        height: 450,
        width: 400,
      ),
    );
  }

  Column buildAboutMeContents(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        FadeInRight(
          duration: const Duration(milliseconds: 1200),
          child: RichText(
            text: TextSpan(
              text: 'About ',
              style: AppTextStyles.headingStyles(fontSize: 30.0),
              children: [
                TextSpan(
                  text: 'Us!',
                  style: AppTextStyles.headingStyles(
                      fontSize: 30, color: AppColors.robinEdgeBlue),
                )
              ],
            ),
          ),
        ),
        Constants.sizedBox(height: 6.0),
        FadeInLeft(
          duration: const Duration(milliseconds: 1400),
          child: Text(
            'Grey Water Management!',
            style: AppTextStyles.montserratStyle(color: Colors.white),
          ),
        ),
        Constants.sizedBox(height: 8.0),
        FadeInLeft(
          duration: const Duration(milliseconds: 1600),
          child: Text(
            'At Water Wizards, we are dedicated to ensuring the safety and quality of groundwater through innovative, low-cost testing kits. Our mission is to empower communities with real-time data on water quality and provide actionable insights that help safeguard public health. Combining advanced sensor technology and machine learning, our platform not only monitors critical water parameters like TDS, pH, turbidity, and temperature, but also analyzes climate data to predict potential risks of waterborne diseases. Through our web-based solution, we aim to create awareness and offer personalized guidance to improve water treatment practices.',
            style: AppTextStyles.normalStyle(),
          ),
        ),
        Constants.sizedBox(height: 15.0),
        FadeInUp(
          duration: const Duration(milliseconds: 1800),
          child: AppButton.buildMaterialButton(
              onTap: () {
                Navigator.pushNamed(context, '/about');
              },
              buttonName: 'Read More'),
        )
      ],
    );
  }
}
