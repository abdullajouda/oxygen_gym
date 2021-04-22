import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MainPageCard extends StatelessWidget {
  final String title;
  final Widget icon;
  final String image;

  const MainPageCard({Key key, this.icon, this.image, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 162,
      decoration: BoxDecoration(
        // image: DecorationImage(image: AssetImage(image)),
        borderRadius: BorderRadius.circular(9.0),
        gradient: LinearGradient(
          begin: Alignment(0.0, -0.43),
          end: Alignment(0.0, 1.0),
          colors: [const Color(0x00ffffff), const Color(0xff000000)],
          stops: [0.0, 1.0],
        ),
      ),
      child: Stack(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(9.0),
              child: Image.asset(
                image,
                fit: BoxFit.fitWidth,
                width: size.width,
                height: 162,
              )),
          Container(
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 30,
                  width: 119,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(17.0),
                    color: const Color(0x4c000000),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: icon,
                      ),
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 15,
                          color: const Color(0xffffffff),
                          letterSpacing: -0.24,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
