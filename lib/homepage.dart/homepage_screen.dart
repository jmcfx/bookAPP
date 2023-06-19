import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../imageSlides/image_slides.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key, this.onExplorePressed});
  final VoidCallback? onExplorePressed;
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final CarouselController carouselController = CarouselController();

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              // const Spacer(),
              const Row(
                children: [
                  Text(
                    "Now trending",
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Spacer(),
                  Icon(
                    size: 30,
                    Icons.notifications_active_outlined,
                  )
                ],
              ),
               const SizedBox(
                 height: 70,
               ),
              // const Spacer(),
              //imageSlide....
              Padding(
                padding: const EdgeInsets.all(2),
                child: CarouselSlider.builder(
                  itemCount: imagesSlideData.length,
                  carouselController: carouselController,
                  itemBuilder: (context, index, realIndex) =>
                      getImageSlides()[index],
                  options: CarouselOptions(
                    autoPlay: true,
                    viewportFraction: 1.0 / 3.0,
                    aspectRatio: 1,
                    initialPage: 0,
                  ),
                ),
              ),
              const Spacer(),
              //Explore Now Books Button...
              ElevatedButton(
                onPressed: widget.onExplorePressed,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(287,46 ),
                  textStyle: const TextStyle( fontSize: 18,
                  fontWeight: FontWeight.w700
                  ),
                ),
                child: const Padding(
                  padding:  EdgeInsets.all(8.0),
                  child:  Text(
                    "Explore Books",
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const Spacer(),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
