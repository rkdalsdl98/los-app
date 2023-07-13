import 'package:flutter/material.dart';

class CustomSliderBox extends StatefulWidget {
  final String title;

  const CustomSliderBox({
    super.key,
    required this.title,
  });

  @override
  State<CustomSliderBox> createState() => _CustomSliderBoxState();
}

class _CustomSliderBoxState extends State<CustomSliderBox> {
  double sliderValue = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      height: 70,
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 5,
      ),
      margin: const EdgeInsets.only(
        top: 5,
        bottom: 5,
        right: 10,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
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
        children: [
          Text(
            widget.title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onBackground.withOpacity(.5),
              fontSize: 8,
              fontFamily: 'SpoqaHanSans',
              fontWeight: FontWeight.w400,
              height: 1.5,
            ),
          ),
          Stack(
            children: [
              Positioned(
                left: 0,
                bottom: 30,
                child: Text(
                  "OFF",
                  style: TextStyle(
                    color: Color.lerp(
                      const Color(0xFFD9DDEB),
                      Theme.of(context).colorScheme.onBackground,
                      (sliderValue - 1).abs(),
                    ),
                    fontSize: 10,
                    fontFamily: 'SpoqaHanSans',
                    fontWeight: FontWeight.w600,
                    height: 1.5,
                  ),
                ),
              ),
              SizedBox(
                width: 100,
                child: SliderTheme(
                  data: const SliderThemeData(
                    disabledActiveTrackColor: Colors.blue,
                    disabledInactiveTrackColor: Colors.black12,
                    trackHeight: 10,
                  ),
                  child: Slider(
                    value: sliderValue,
                    divisions: 1,
                    onChanged: (value) => setState(() {
                      sliderValue = value;
                    }),
                    activeColor: const Color(0xFF1CBA3E),
                    inactiveColor: const Color(0xFFD9DDEB),
                    thumbColor: const Color(0xFFD9DDEB),
                    min: 0,
                    max: 1,
                  ),
                ),
              ),
              Positioned(
                right: 0,
                bottom: 30,
                child: Text(
                  "ON",
                  style: TextStyle(
                    color: Color.lerp(
                      const Color(0xFFD9DDEB),
                      Theme.of(context).colorScheme.onBackground,
                      sliderValue,
                    ),
                    fontSize: 10,
                    fontFamily: 'SpoqaHanSans',
                    fontWeight: FontWeight.w600,
                    height: 1.5,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
