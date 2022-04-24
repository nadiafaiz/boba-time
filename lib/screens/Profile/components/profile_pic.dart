import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:image_picker/image_picker.dart';

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    Key? key,
  }) : super(key: key);

  // File? image;
  //
  // Future pickImage() async {
  //   final image = await ImagePicker().pickImage(source: ImageSource.gallery);
  //   if(image == null) return;
  //
  //   final imageTemp = File(image.path);
  //   this.image = imageTemp;
  // }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      width: 130,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          const CircleAvatar(
            radius: 30.0,
            backgroundImage:
                // image != null ?
                // Image.file(image!):
                AssetImage('assets/images/default_profile.png'),
            backgroundColor: Colors.transparent,
          ),
          Positioned(
            right: -15,
            bottom: 0,
            child: SizedBox(
              height: 50,
              width: 50,
              child: TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: const BorderSide(color: Colors.white),
                  ),
                  primary: Colors.black,
                  backgroundColor: const Color(0xFFF5F6F9),
                ),
                onPressed: () {},
                // onPressed: () => pickImage(),
                child: SvgPicture.asset("assets/icons/camera.svg"),
              ),
            ),
          )
        ],
      ),
    );
  }
}
