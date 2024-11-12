import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:test_order_life_cycle/core/styles/Colors.dart';
import 'package:test_order_life_cycle/core/styles/text_style.dart';
import 'package:test_order_life_cycle/core/widgets/custom_primary_button_widget.dart';

File? images;

class KImagePickerFunction extends StatefulWidget {
  const KImagePickerFunction({super.key});

  @override
  State<KImagePickerFunction> createState() => _KImagePickerFunctionState();
}

class _KImagePickerFunctionState extends State<KImagePickerFunction> {
  File? selectedImage;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CustomIMageButton(
          onTap: () => pickImageFromCamera(),
          icon: Icons.camera_alt,
          title: "إلتقاط",
        ),
        SizedBox(
          height: 10.h,
        ),
        CustomIMageButton(
          onTap: () => pickImageFromGalary(),
          icon: Icons.image_rounded,
          title: "المعرض",
        ),
        SizedBox(
          height: 10.h,
        ),

        // /////////
        // IconButton(
        // onPressed: (){
        //   pickImageFromGalary();
        // },
        // ////////////////////

        // icon: const Icon(Icons.image_rounded)),

        selectedImage != null
            ? SizedBox(
                height: 200.h, width: 200, child: Image.file(selectedImage!))
            : const Text(""),
        // KCustomPrimaryButtonWidget(buttonName: "تاكيد", onPressed: () {})
      ],
    );
  }

  Future pickImageFromCamera() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnImage == null) return;
    setState(() {
      selectedImage = File(returnImage.path);
      images = selectedImage;
    });
  }

  Future pickImageFromGalary() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImage == null) return;
    setState(() {
      selectedImage = File(returnImage.path);
      images = selectedImage;
    });
  }
}

class CustomIMageButton extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;
  final String title;

  const CustomIMageButton({
    super.key,
    required this.onTap,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: KTextStyle.secondaryTitle.copyWith(color: AppColors.white),
            ),
            const SizedBox(width: 10),
            Icon(
              icon,
              size: 25,
              color: AppColors.white,
            ),
          ],
        ),
      ),
    );
  }
}
