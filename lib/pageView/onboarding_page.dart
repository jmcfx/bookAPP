import 'package:bookapp/constants/page_routes.dart';
import 'package:flutter/material.dart';
import '../pageView/onboarding_content.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  late PageController _pageController;
  int _pageIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  itemCount: onboardingData.length,
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _pageIndex = index;
                    });
                  },
                  itemBuilder: (context, index) => OnboardingContent(
                    image: onboardingData[index].image,
                    title: onboardingData[index].title,
                    descriptions: onboardingData[index].description,
                  ),
                ),
              ),
              Row(
                children: [
                  ...List.generate(
                      onboardingData.length,
                      (index) => Padding(
                            padding: const EdgeInsets.only(right: 3),
                            child: DotIndicator(isActive: index == _pageIndex),
                          )),
                  const Spacer(),
                  SizedBox(
                    height: 60,
                    width: 60,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          elevation: 5,
                          animationDuration: const Duration(milliseconds: 300)),
                      onPressed: () {
                        //route to HomePage..
                        if (_pageIndex == onboardingData.length - 1) {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              homepageRoutes, (route) => false);
                        } else {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeIn,
                          );
                        }
                      },
                      child: const Icon(Icons.arrow_circle_right_sharp,
                          color: Colors.white),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

//DotIndicator class...
class DotIndicator extends StatelessWidget {
  const DotIndicator({
    super.key,
    this.isActive = false,
  });
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: isActive ? 15 : 3,
      width: 7.5,
      decoration: BoxDecoration(
        color: isActive ? Colors.blue : Colors.blue.withOpacity(0.4),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        // backgroundBlendMode: BlendMode.clear,
      ),
    );
  }
}

//Onboard class..
class Onboard {
  final String image, title, description;

  Onboard(
      {required this.image, required this.title, required this.description});
}

//Onboarding data List
final List<Onboard> onboardingData = [
  Onboard(
    image: "/Applications/Desktop/Workspace/bookapp/lib/images/Group1.png",
    title: "Read on the go!",
    description:
        "Download the best books on your mobile phone now and read on the go! ",
  ),
  Onboard(
    image: "/Applications/Desktop/Workspace/bookapp/lib/images/Group2.png",
    title: "Your favorite books in your hands",
    description: "All the books you need are now with you everywhere you go",
  ),
  Onboard(
      image: "/Applications/Desktop/Workspace/bookapp/lib/images/Group3.png",
      title: "Jump right in! ",
      description: "You can read any book at your disposal")
];
