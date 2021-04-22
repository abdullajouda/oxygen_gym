import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:oxygen/widgets/app_bar.dart';

class WorkOut extends StatefulWidget {
  @override
  _WorkOutState createState() => _WorkOutState();
}

class _WorkOutState extends State<WorkOut> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SafeArea(child: MyAppBar()),

          Expanded(
            child: ListView(
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                      height: 160,
                      enlargeCenterPage: true,
                      enableInfiniteScroll: false
                      // disableCenter: true,
                      ),
                  items: [1, 2]
                      .map(
                        (item) => Container(
                          height: 160,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            gradient: LinearGradient(
                              begin: Alignment(0.0, 1.0),
                              end: Alignment(0.0, -1.0),
                              colors: [
                                const Color(0x80000000),
                                const Color(0x00000000)
                              ],
                              stops: [0.0, 1.0],
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        'Book an appointment',
                        style: TextStyle(
                          fontSize: 22,
                          color: const Color(0xff1d3400),
                          letterSpacing: 0.35000000190734865,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
                GridView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  shrinkWrap: true,
                  itemCount: 7,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 15,
                      crossAxisSpacing: 15,
                      crossAxisCount: 2,
                      childAspectRatio: 1),
                  itemBuilder: (context, index) => Container(
                    height: 160,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: const Color(0x80e4e4e4),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
