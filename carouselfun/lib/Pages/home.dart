import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int activeIndex = 0;
  final controller = CarouselController();
  final myImages = [
    'img\ferret1.jpg',
    'img\ferret2.jpg',
    'img\ferret3.jpg',
    'img\ferret4.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[300],
      appBar: AppBar(
        backgroundColor: Colors.green[600],
        title: Text('Images!'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CarouselSlider.builder(
                itemCount: myImages,
                itemBuilder: (context, index, realIndex) {
                  final myImages = myImages[index];
                  return buildImage(myImages, index);
                },
                options: options)
          ],
        ),
      ),
    );
  }
}
