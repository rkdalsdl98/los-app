import 'package:flutter/material.dart';
import 'package:los_app/widgets/global/default_user_profile_icon.dart';

class UserProfileIcon extends StatelessWidget {
  String? profileImage;

  UserProfileIcon({
    super.key,
    required this.profileImage,
  });

  @override
  Widget build(BuildContext context) {
    return profileImage == null || profileImage!.isEmpty
        ? const DefaultUserProfileIcon()
        : Container(
            width: 100,
            height: 100,
            decoration: const BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.all(
                Radius.circular(100),
              ),
            ),
            child: Image.asset(
              profileImage!,
              fit: BoxFit.contain,
            ),
          );
  }
}
