import 'package:flutter/material.dart';
//Onboarding content...
class OnboardingContent extends StatelessWidget {
  const OnboardingContent({
    super.key,
    required this.image,
    required this.title,
    required this.descriptions,
  });
  final String image, title, descriptions;

  @override
  Widget build(BuildContext context) {
    return Column(
      
      children: [
        const Spacer(),
        Image.asset(
          image,
          height: 300,
          width: 350,
        ),
        const Spacer(),
        Expanded(
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              title, 
              textAlign: TextAlign.left,
              style: const TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal,
              ),
            ),
          ),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
                descriptions, 
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                )),
          ),
        ),
        const Spacer()
      ],
    );
  }
}
