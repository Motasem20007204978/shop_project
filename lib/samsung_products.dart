import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

final List<String> list1Samsung = [
  "https://z.nooncdn.com/products/tr:n-t_240/v1628160647/N49682393A_1.jpg",
  "https://z.nooncdn.com/products/tr:n-t_240/v1647270585/N52889708A_1.jpg",
  "https://z.nooncdn.com/products/tr:n-t_240/v1628160647/N49682393A_1.jpg",
];
final List<String> list2Sumsung = [
  "https://z.nooncdn.com/products/tr:n-t_240/v1647270585/N52889706A_1.jpg",
  "https://z.nooncdn.com/products/tr:n-t_240/v1647270585/N52889707A_1.jpg",
  "https://z.nooncdn.com/products/tr:n-t_240/v1631780162/N50878249A_1.jpg",
];

class SamsungProducts extends StatelessWidget {
  static const double margainSlider = 20.0;

  const SamsungProducts({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Text('Slider 1 : Samsung models 10'),
            ),
            Container(
              margin: const EdgeInsets.all(margainSlider),
              child: CarouselSlider.builder(
                itemCount: list1Samsung.length,
                options: CarouselOptions(
                  enlargeCenterPage: true,
                  height: 280,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  reverse: false,
                  aspectRatio: 5.0,
                ),
                itemBuilder: (context, i, id) {
                  //for onTap to redirect to another screen
                  return GestureDetector(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Colors.white,
                        ),
                      ),
                      //ClipRRect for image border radius
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          list1Samsung[i],
                          width: 500,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    onTap: () {
                      var url = list1Samsung[i];
                      print(url.toString());
                    },
                  );
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Text('Slider 1 : Samsung models 2'),
            ),
            Container(
              margin: const EdgeInsets.all(margainSlider),
              child: CarouselSlider.builder(
                itemCount: list2Sumsung.length,
                options: CarouselOptions(
                  enlargeCenterPage: true,
                  height: 280,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  reverse: false,
                  aspectRatio: 5.0,
                ),
                itemBuilder: (context, i, id) {
                  //for onTap to redirect to another screen
                  return GestureDetector(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Colors.white,
                        ),
                      ),
                      //ClipRRect for image border radius
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          list2Sumsung[i],
                          width: 500,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    onTap: () {
                      var url = list2Sumsung[i];
                      print(url.toString());
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
