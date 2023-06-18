import 'package:flutter/material.dart';

//ImageSlide class....
class ImageSlide {
  final String image, title, subtitle;

  ImageSlide(
      {required this.image, required this.title, required this.subtitle});
}

//ImageSlide Data...
final List<ImageSlide> imagesSlideData = [
  ImageSlide(
    image: "assets/imageSlides/slide1.png",
    title: "Rich Dad Poor Dad ",
    subtitle: "Robert T.Kiyosaki",
  ),
  ImageSlide(
    image: "assets/imageSlides/slide2.png",
    title: "Atomic Habit",
    subtitle: "James Clear",
  ),
  ImageSlide(
      image: "assets/imageSlides/slide3.png",
      title: "The Hobbit",
      subtitle: "J.J. R Tolkein"),
  ImageSlide(
    image: "assets/imageSlides/slide4.png",
    title: "The Great Gatsby",
    subtitle: "F.Scott Fitzgerald ",
  ),
  ImageSlide(
    image: "assets/imageSlides/slide5.png",
    title: "Animal farm",
    subtitle: "George Orwell",
  )
];
//getImageSlides....
List<Widget> getImageSlides() {
  return imagesSlideData.map((slide) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0), // Apply border radius
      child: Container(
        padding: const EdgeInsets.all(1),
        margin: const EdgeInsets.all(5),
        child: Column(
          children: [
            Flexible(
              child: ClipRRect(
                borderRadius:
                    BorderRadius.circular(10.0), // Apply border radius
                child: Image.asset(
                  slide.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 5),
            Text(
              slide.title,
              style: const TextStyle(
                height: 2,
                fontWeight: FontWeight.w600,
                fontSize: 10,
              ),
            ),
            Text(
              slide.subtitle,
              style: const TextStyle(
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }).toList();
}
