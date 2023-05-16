import 'package:app/detailmovie.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Movie extends StatelessWidget {
  List images = [
    'John Wick Chapter 4',
    'Perjanjian Gaib',
    'Shazam Fury of The Gods',
    'Waktu Maghrib',
    'Tulah 613'
  ];

  Movie({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              height: 498,
              enlargeCenterPage: true,
              enlargeStrategy: CenterPageEnlargeStrategy.height,
              aspectRatio: 16 / 9,
              autoPlay: true,
              autoPlayCurve: Curves.slowMiddle,
              reverse: true,
              enableInfiniteScroll: true),
          items: [
            for (int i = 0; i < images.length; i++)
              InkWell(
                onTap: () {
                  //Navigator.push(context, i as Route<Object?>);
                },
                child: Container(
                  margin: const EdgeInsets.all(5),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          "images/${images[i]}.jpeg",
                          height: 340,
                          width: 290,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Action Adventure',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400),
                            ),
                            Row(
                              children: const [
                                Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                SizedBox(width: 5),
                                Text(
                                  "8.0",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        images[i],
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
