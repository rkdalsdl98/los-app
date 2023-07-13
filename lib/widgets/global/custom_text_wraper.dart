import 'package:flutter/material.dart';

class CustomTextWraper extends StatefulWidget {
  String? title;
  final String content;
  Image? assetImage;
  Icon? icon;
  MainAxisAlignment alignment;
  bool showAssetLeft;
  bool showAssetRight;
  EdgeInsetsGeometry? padding;

  CustomTextWraper({
    super.key,
    required this.content,
    this.title,
    this.assetImage,
    this.alignment = MainAxisAlignment.start,
    this.showAssetLeft = false,
    this.showAssetRight = true,
    this.icon,
    this.padding,
  });

  @override
  State<CustomTextWraper> createState() => _CustomTextWraperState();
}

class _CustomTextWraperState extends State<CustomTextWraper> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: widget.padding,
      child: Row(
        mainAxisAlignment: widget.alignment,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.assetImage != null && widget.showAssetLeft)
            widget.assetImage!,
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              if (widget.title != null)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.title!,
                      style: TextStyle(
                        color: Theme.of(context)
                            .colorScheme
                            .onBackground
                            .withOpacity(.5),
                        fontSize: 8,
                        fontFamily: 'SpoqaHanSans',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              Text(
                widget.content,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontSize: 16,
                  fontFamily: 'SpoqaHanSans',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          if (widget.assetImage != null && widget.showAssetRight)
            widget.assetImage!,
          if (widget.icon != null) widget.icon!,
        ],
      ),
    );
  }
}
