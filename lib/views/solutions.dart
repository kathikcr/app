import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:front_end_sih/globals/app.colors.dart';
import 'package:front_end_sih/helperclass/helper_class.dart';
import '../globals/app_text_styles.dart';
import '../globals/constants.dart';

class Solutions extends StatefulWidget {
  const Solutions({super.key});

  @override
  State<Solutions> createState() => _SolutionState();
}

class _SolutionState extends State<Solutions> {
  final Matrix4 onHoverEffect = Matrix4.identity()..scale(1.0);

  // List containing images, titles, and descriptions for each project
  final List<Map<String, String>> projects = [
    {
      "image": 'assets/ml.png',
      "title": "Machine Learning",
      "description":
          "Used to predict the quality of the water based on the existing data present."
    },
    {
      "image": 'assets/iot.png',
      "title": "IoT Systems",
      "description": "Helps to collect real-time data from water resources."
    },
    {
      "image": 'assets/app.png',
      "title": "Application Development",
      "description": "Helps to display the predicted data to the user."
    },
  ];

  int? hoveredIndex;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return HelperClass(
      mobile: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildProjectText(),
          Constants.sizedBox(height: 40.0),
          buildProjectGridView(crossAxisCount: 1),
        ],
      ),
      tablet: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildProjectText(),
          Constants.sizedBox(height: 40.0),
          buildProjectGridView(crossAxisCount: 2),
        ],
      ),
      desktop: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildProjectText(),
          Constants.sizedBox(height: 40.0),
          buildProjectGridView(crossAxisCount: 3),
        ],
      ),
      paddingWidth: size.width * 0.1,
      bgColor: AppColors.bgColor2,
    );
  }

  GridView buildProjectGridView({required int crossAxisCount}) {
    return GridView.builder(
      itemCount: projects.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisExtent: 280,
        mainAxisSpacing: 24,
        crossAxisSpacing: 24,
      ),
      itemBuilder: (context, index) {
        var project = projects[index];
        return FadeInUpBig(
          duration: const Duration(milliseconds: 1600),
          child: InkWell(
            onTap: () {},
            onHover: (value) {
              setState(() {
                hoveredIndex = value ? index : null;
              });
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage(project["image"]!),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Visibility(
                  visible: index == hoveredIndex,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 600),
                    transform: hoveredIndex == index ? onHoverEffect : null,
                    curve: Curves.easeIn,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        colors: [
                          AppColors.themeColor.withOpacity(1.0),
                          AppColors.themeColor.withOpacity(0.9),
                          AppColors.themeColor.withOpacity(0.8),
                          AppColors.themeColor.withOpacity(0.6),
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          project["title"]!,
                          style: AppTextStyles.montserratStyle(
                            color: Colors.black87,
                            fontSize: 20,
                          ),
                        ),
                        Constants.sizedBox(height: 15.0),
                        Text(
                          project["description"]!,
                          style: AppTextStyles.normalStyle(
                            color: Colors.black87,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Constants.sizedBox(height: 30.0),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  FadeInDown buildProjectText() {
    return FadeInDown(
      duration: const Duration(milliseconds: 1200),
      child: RichText(
        text: TextSpan(
          text: 'Our ',
          style: AppTextStyles.headingStyles(fontSize: 30.0),
          children: [
            TextSpan(
              text: 'Solutions',
              style: AppTextStyles.headingStyles(
                fontSize: 30,
                color: AppColors.robinEdgeBlue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
