import 'package:flutter/material.dart';
import 'package:my_dorm/constant/constant.dart';
import 'package:my_dorm/service/image_service.dart';

class FormPhotoPicker extends StatefulWidget {
  final String title;
  const FormPhotoPicker({super.key, required this.title});

  @override
  State<FormPhotoPicker> createState() => _FormPhotoPickerState();
}

class _FormPhotoPickerState extends State<FormPhotoPicker> {
  final ImageService _imageService = ImageService();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: (_imageService.selectedImage == null)
          ? GestureDetector(
              onTap: () async {
                await _imageService.pickImage();
                setState(() {});
              },
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: 150,
                decoration: BoxDecoration(
                    border: const Border.fromBorderSide(
                      BorderSide(color: Color(0xFFE2E2E2), width: 2),
                    ),
                    borderRadius: BorderRadius.circular(8),
                    color: kFormBG),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.camera_alt_outlined,
                      size: 56,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      'Unggah foto ${widget.title}',
                      style: kSemiBoldTextStyle.copyWith(fontSize: 14),
                    )
                  ],
                ),
              ))
          : InputDecorator(
            decoration: basicInputDecoration('Foto ${widget.title}'),
            child: Stack(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Image.file(_imageService.selectedImage!)),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    margin: const EdgeInsets.all(12),
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: kGrey.withOpacity(0.5)),
                    child: GestureDetector(
                        onTap: () async {
                          _imageService.clearImage();
                          setState(() {});
                        },
                        child: const Icon(
                          Icons.close,
                          color: kWhite,
                        )),
                  ),
                )
              ],
            ),
          ),
    );
  }
}
