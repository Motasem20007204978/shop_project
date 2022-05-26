import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

final List<String> list1Samsung = [
  "https://z.nooncdn.com/products/tr:n-t_240/v1628160647/N49682393A_1.jpg",
  "https://z.nooncdn.com/products/tr:n-t_240/v1647270585/N52889708A_1.jpg",
  "https://cdn0.vox-cdn.com/hermano/verge/product/image/9019/akrales_190307_3272_0020_squ.jpg",
];

final List<String> list2Sumsung = [
  "https://fscl01.fonpit.de/devices/02/1502.jpg",
  "https://img.joomcdn.net/98a9974dc12ad34f8231bdc8a8e0048187d0a823_1024_1024.jpeg",
  "https://www.wesolveall.com/wp-content/uploads/2020/09/samsung-phone-model-galaxy-note-9-display-1024x576.jpg",
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
            GestureDetector(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Container(
                    height: 150,
                    child: const Text(
                      'The Samsung Galaxy S10 is a line of Android-based smartphones manufactured, released and marketed by Samsung Electronics as part of the Samsung Galaxy S series.',
                      style: TextStyle(
                        // letterSpacing: 20.0,
                        wordSpacing: 5,
                      ),
                    ),
                  ),
                  duration: const Duration(seconds: 2),
                ));
              },
              child: const Padding(
                padding: EdgeInsets.all(15.0),
                child: Text('Slider 1 : Galaxy S10'),
              ),
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
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          list1Samsung[i],
                          width: 500,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            GestureDetector(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Container(
                    height: 150,
                    child: const Text(
                      'The Samsung Galaxy A30 is a mid-range Android smartphone developed, manufactured and marketed by Samsung Electronics.',
                      style: TextStyle(
                        // letterSpacing: 20.0,
                        wordSpacing: 5,
                      ),
                    ),
                  ),
                  duration: const Duration(seconds: 2),
                ));
              },
              child: const Padding(
                padding: EdgeInsets.all(15.0),
                child: Text('Slider 1 : Galaxy A30'),
              ),
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
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // SnackBar _details(BuildContext context) {
  //   return SnackBar(
  //     content: Container(
  //       height: 150,
  //       child: const Text(
  //         'Slider 1 : Samsung models 1 The Samsung brand the Samsung brand meaning Samsung has this flower-shaped logo that symbolizes the Hua word that means petals or lavish in Chinese. The second syllable that we can find in their name means achievement or action ',
  //         style: TextStyle(
  //           // letterSpacing: 20.0,
  //           wordSpacing: 5,
  //         ),
  //       ),
  //     ),
  //     duration: const Duration(seconds: 2),
  //   );
  // }
}
