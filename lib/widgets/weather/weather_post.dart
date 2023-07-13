import 'package:flutter/material.dart';
import 'package:los_app/design/dimensions.dart';
import 'package:los_app/widgets/weather/weather_item.dart';

class WeatherPost extends StatelessWidget {
  const WeatherPost({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      width: 160 * getScaleFactorFromWidth(context),
      height: 110,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimaryContainer,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.push_pin_rounded,
                color: Theme.of(context).colorScheme.background,
                size: 10 * getScaleFactorFromWidth(context),
              ),
              const SizedBox(
                width: 30,
              ),
              Text(
                '날씨 게시판',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.background,
                  fontSize: 10 * getScaleFactorFromWidth(context),
                  fontFamily: 'SpoqaHanSans',
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              Icon(
                Icons.push_pin_rounded,
                color: Theme.of(context).colorScheme.background,
                size: 10 * getScaleFactorFromWidth(context),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          const Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  WeatherInfoItem(),
                  SizedBox(
                    width: 20,
                  ),
                  WeatherInfoItem(),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  WeatherInfoItem(),
                  SizedBox(
                    width: 20,
                  ),
                  WeatherInfoItem(),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  WeatherInfoItem(),
                  SizedBox(
                    width: 20,
                  ),
                  WeatherInfoItem(),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
