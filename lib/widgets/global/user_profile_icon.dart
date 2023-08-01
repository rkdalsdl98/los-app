import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:los_app/widgets/global/default_user_profile_icon.dart';

class UserProfileIcon extends StatelessWidget {
  XFile? profileImage;

  UserProfileIcon({
    super.key,
    required this.profileImage,
  });

  @override
  Widget build(BuildContext context) {
    return profileImage == null
        ? const DefaultUserProfileIcon()
        : Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: const BorderRadius.all(
                Radius.circular(100),
              ),
              image: DecorationImage(
                image: FileImage(
                  File(profileImage!.path),
                ),
              ),
            ),
          );
  }
}
