import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../../Api/api_provider.dart';
import '../../../Constants/common_function.dart';
import '../../../Constants/constants.dart';

class DrivingLicenseCard extends StatefulWidget {
  const DrivingLicenseCard(
      {super.key,
      required this.dlNumber,
      this.dl_photo,
      required this.onTap,
      required this.dl_url,
      required this.fetchDetails});

  final TextEditingController dlNumber;
  final File? dl_photo;
  final Function(File) onTap;
  final String dl_url;
  final Function fetchDetails;

  @override
  State<DrivingLicenseCard> createState() => _DrivingLicenseCardState();
}

class _DrivingLicenseCardState extends State<DrivingLicenseCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.zero,
      child: ExpansionTile(
        backgroundColor: Constants.primaryColor,
        collapsedBackgroundColor: Constants.primaryColor,
        title: AutoSizeText.rich(
          TextSpan(
            children: [
              TextSpan(
                text: "Driving License",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.black87,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
          textAlign: TextAlign.start,
        ),
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        childrenPadding: EdgeInsets.symmetric(
          horizontal: 2.w,
          vertical: 1.h,
        ),
        children: [
          AutoSizeText.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "DL Number",
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.black87,
                        fontSize: 16.sp,
// fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
            textAlign: TextAlign.start,
          ),
          SizedBox(
            height: 1.h,
          ),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 1.w,
            ),
            height: 5.5.h,
            child: TextField(
// maxLength: 10,
              keyboardType: TextInputType.text,
              controller: widget.dlNumber,
              decoration: InputDecoration(
                counterStyle: const TextStyle(
                  height: double.minPositive,
                ),
                counterText: "",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                    color: Constants.fourthColor,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                    color: Constants.fourthColor,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                    color: Constants.fourthColor,
                  ),
                ),
                filled: true,
                hintStyle: TextStyle(
                  color: Colors.grey[800],
                  fontSize: 15.sp,
                ),
                hintText: "Please enter your DL number",
                fillColor: Constants.bgColor,
// prefixIcon: const Icon(
//   Icons.phone,
//   color: Constants.fourthColor,
// ),
              ),
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Constants.fourthColor,
                    fontSize: 15.sp,
                  ),
              textAlign: TextAlign.start,
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          AutoSizeText.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "Document",
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.black87,
                        fontSize: 16.sp,
// fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
            textAlign: TextAlign.start,
          ),
          SizedBox(
            height: 1.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 2.w,
            ),
            child: DottedBorder(
              color: Colors.black,
              strokeWidth: 1,
              child: Container(
                color: Constants.bgColor,
                height: 20.h,
                width: double.infinity,
                child: Center(
                  child: widget.dl_photo == null
                      ? (widget.dl_url.isEmpty)
                          ? GestureDetector(
                              onTap: () {
                                pickImage((path) {
                                  widget.onTap(File(path));
                                });
                              },
                              child: Icon(
                                Icons.folder,
                                size: 35.sp,
                              ),
                            )
                          : SfPdfViewer.network(widget.dl_url??"")
                      : GestureDetector(
                          onTap: () {
                            pickImage((path) {
                              widget.onTap(File(path));
                            });
                          },
                          child: Image.file(File(widget.dl_photo!.path))),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 1.h,
          ),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 1.w,
            ),
            height: 5.5.h,
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Constants.secondaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12), // <-- Radius
                ),
              ),
              onPressed: () {
                if (widget.dlNumber.text.isNotEmpty) {
                  updateDrivingLicense();
                } else {
                  var snackBar = SnackBar(
                    backgroundColor: Constants.secondaryColor,
                    content: Text(
                      'Please Enter all information',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: 17.sp,
                        color: Constants.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              },
              child: Text(
                "Update Driving License",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontSize: 17.sp,
                      color: Constants.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ),
          SizedBox(
            height: 1.h,
          ),
        ],
      ),
    );
  }

  Future<void> pickImage(Function(String path) onTap) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    onTap(image!.path);
  }

  void updateDrivingLicense() async {
    await CommonFunction().showLoadingDialog(context);
    final response = await ApiProvider.instance.updateDrivingLicence(
        widget.dlNumber.text, widget.dl_photo?.path ?? "");
    if (response.success ?? false) {
      CommonFunction().hideLoadingDialog(context);
      var snackBar = SnackBar(
        backgroundColor: Constants.secondaryColor,
        content: Text(
          response.message ?? 'Update Driving License Successfully',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontSize: 17.sp,
                color: Constants.primaryColor,
                fontWeight: FontWeight.bold,
              ),
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      CommonFunction().hideLoadingDialog(context);
      var snackBar = SnackBar(
        backgroundColor: Constants.secondaryColor,
        content: Text(
          response.message ?? 'Something went wrong',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontSize: 17.sp,
                color: Constants.primaryColor,
                fontWeight: FontWeight.bold,
              ),
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
