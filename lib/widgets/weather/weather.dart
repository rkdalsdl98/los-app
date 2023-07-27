import 'package:flutter/material.dart';
import 'package:los_app/widgets/advice_card.dart';
import 'package:los_app/widgets/weather/weather_post.dart';

import '../../design/dimensions.dart';
import '../global/category_text.dart';

class Weather extends StatelessWidget {
  const Weather({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        maxHeight: 290,
        maxWidth: 500,
        minHeight: 270,
        minWidth: 360,
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CategoryText(
            category: '날씨',
          ),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: const BorderRadius.all(
                Radius.circular(15),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.2),
                  blurRadius: 2,
                  spreadRadius: 0,
                  offset: const Offset(0, 5),
                )
              ],
            ),
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 160 * getScaleFactorFromWidth(context),
                    height: 160 * getScaleFactorFromWidth(context),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.background,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(.2),
                          blurRadius: 2,
                          spreadRadius: 0,
                          offset: const Offset(0, 5),
                        )
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 64 * getScaleFactorFromWidth(context),
                          height: 64 * getScaleFactorFromWidth(context),
                          child: Image.asset(
                            'assets/img/rain.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 15 * getScaleFactorFromWidth(context),
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            color:
                                Theme.of(context).colorScheme.primaryContainer,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: Column(
                            children: [
                              Text(
                                '오늘은 운동하기 좋을까?',
                                style: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSecondaryContainer,
                                  fontSize: 10,
                                  fontFamily: 'SpoqaHanSans',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                '오늘은 비가 예상되는 날씨이므로\n외출을 자제하고 외출 시 우산을 챙겨\n비를 피하세요!',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSecondaryContainer,
                                  fontSize: 8,
                                  fontFamily: 'SpoqaHanSans',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: const Column(
                      children: [
                        WeatherPost(),
                        SizedBox(
                          height: 10,
                        ),
                        AdviceCard(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
