import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oxygen/constants.dart';
import 'package:oxygen/models/trainers_timing.dart';
import 'package:oxygen/services/Localization/localization.dart';
import 'dart:math' as math;

class TrainerCard extends StatelessWidget {
  final Trainer trainer;

  const TrainerCard({Key key, this.trainer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: const Color(0xfff1f1f1),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 10,
            right: LangProvider().getLocaleCode() == 'ar' ? null : 10,
            left: LangProvider().getLocaleCode() == 'ar' ? 10 : null,
            child: Transform(
              alignment: Alignment.center,
              transform: LangProvider().getLocaleCode() == 'ar'
                  ? Matrix4.rotationY(math.pi)
                  : Matrix4.rotationY(0),
              child: SvgPicture.asset(
                'assets/images/running_light.svg',
                fit: BoxFit.fill,
              ),
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    Container(
                      height: 48,
                      width: 48,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                        image: DecorationImage(
                          image: NetworkImage(trainer.image),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'Coach'.trs(context),
                        style: TextStyle(
                          fontSize: 22,
                          color: const Color(0xff67b500),
                          letterSpacing: 0.35000000190734865,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: size.width * .6),
                      child: Text(
                        '${trainer.name}',
                        style: TextStyle(
                          fontSize: 22,
                          color: const Color(0xff1d3400),
                          letterSpacing: -0.352,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              GridView.builder(
                itemCount: trainer.times.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 6,
                  crossAxisCount: 2,
                  mainAxisSpacing: 1,
                  crossAxisSpacing: 1,
                ),
                itemBuilder: (context, index) => Wrap(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: SvgPicture.asset(
                            'assets/icons/clock.svg',
                            color: kPrimaryColor,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              '${trainer.times[index].from.substring(0, 5)} ',
                              style: TextStyle(
                                fontSize: 15,
                                color: const Color(0xff1d3400),
                                letterSpacing: -0.24,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              '- ',
                              style: TextStyle(
                                fontSize: 15,
                                color: const Color(0xff1d3400),
                                letterSpacing: -0.24,
                              ),
                            ),
                            Text(
                              '${trainer.times[index].to}',
                              style: TextStyle(
                                fontSize: 15,
                                color: const Color(0xff1d3400),
                                letterSpacing: -0.24,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
