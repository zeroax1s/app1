import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int activeIndex = 0;
  final controller = CarouselController();
  List<String> myImages = [
    'img/ferret1.jpg',
    'img/ferret2.jpg',
    'img/ferret3.jpg',
    'img/ferret4.jpg'
  ];
  bool _autoPlay = true;
  final CarouselController _controller = CarouselController();

  Future getImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        myImages.add(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.green[700],
        title: Text('Ferret Gallery'),
        centerTitle: true,
        elevation: 0,
        actions: <Widget>[
          TextButton.icon(
            icon: Icon(_autoPlay ? Icons.pause : Icons.play_arrow,
                color: Colors.white),
            onPressed: () {
              setState(() {
                _autoPlay = !_autoPlay;
              });
              if (_autoPlay) {
                _controller.startAutoPlay();
              } else {
                _controller.stopAutoPlay();
              }
            },
            label: Text(' '),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
            child: CarouselSlider(
              items: myImages.map((path) {
                return Container(
                  margin: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                      image: AssetImage(path),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              }).toList(),
              options: CarouselOptions(
                height: 380.0,
                enlargeCenterPage: true,
                autoPlay: _autoPlay,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                viewportFraction: 0.8,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton.icon(
                icon: Icon(Icons.add),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[700],
                    foregroundColor: Colors.white),
                onPressed: () {
                  getImage();
                },
                label: Text('Add Image'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
