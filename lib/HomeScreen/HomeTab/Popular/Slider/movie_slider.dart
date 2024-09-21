import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/HomeScreen/HomeTab/Popular/Slider/slider_components.dart';

class MovieSlider extends StatefulWidget {
  @override
  _MovieSliderState createState() => _MovieSliderState();
}

class _MovieSliderState extends State<MovieSlider> {
  int _currentIndex = 0;

  final List<SliderComponents> slider = [
    SliderComponents(),
    SliderComponents(),
    SliderComponents(),
    SliderComponents(),
    SliderComponents(),
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: 5,
      itemBuilder: (context, index, realIdx) {
        return slider[index];
      },
      options: CarouselOptions(
        autoPlay: true,
        enlargeCenterPage: true,
        aspectRatio: 2.0,
        onPageChanged: (index, reason) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
