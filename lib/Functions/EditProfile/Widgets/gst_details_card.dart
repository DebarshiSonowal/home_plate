import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../Api/api_provider.dart';
import '../../../Constants/common_function.dart';
import '../../../Constants/constants.dart';

class GstDetailsCard extends StatefulWidget {
  const GstDetailsCard(
      {super.key,
      required this.gst,
      required this.qst,
      this.gst_doc,
      required this.onGST,
      this.qst_doc,
      required this.onQST,
      required this.gst_url,
      required this.qst_url,
      required this.fetchDetails});

  final TextEditingController gst;
  final TextEditingController qst;
  final File? gst_doc, qst_doc;
  final Function(File) onGST, onQST;
  final String gst_url, qst_url;
  final Function fetchDetails;

  @override
  State<GstDetailsCard> createState() => _GstDetailsCardState();
}

class _GstDetailsCardState extends State<GstDetailsCard> {
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
                text: "GST and QST Details",
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
                  text: "GST Number",
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
              keyboardType: TextInputType.number,
              controller: widget.gst,
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
                hintText: "Please enter your gst",
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
                  text: "QST Number",
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
              keyboardType: TextInputType.number,
              controller: widget.qst,
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
                hintText: "Please enter your qst",
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
                  text: "GST Document",
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
            child: GestureDetector(
              onTap: () {
                pickImage((path) {
                  widget.onGST(File(path));
                });
              },
              child: DottedBorder(
                color: Colors.black,
                strokeWidth: 1,
                child: Container(
                  color: Constants.bgColor,
                  height: 20.h,
                  width: double.infinity,
                  child: Center(
                    child: widget.gst_doc == null
                        ? (widget.gst_url.isEmpty)
                            ? Icon(
                                Icons.folder,
                                size: 35.sp,
                              )
                            : CachedNetworkImage(
                                imageUrl: widget.gst_url,
                              )
                        : Image.file(File(widget.gst_doc!.path)),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 1.h,
          ),
          SizedBox(
            height: 2.h,
          ),
          AutoSizeText.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "QST Document",
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
            child: GestureDetector(
              onTap: () {
                pickImage((path) {
                  widget.onQST(File(path));
                });
              },
              child: DottedBorder(
                color: Colors.black,
                strokeWidth: 1,
                child: Container(
                  color: Constants.bgColor,
                  height: 20.h,
                  width: double.infinity,
                  child: Center(
                    child: widget.qst_doc == null
                        ? (widget.qst_url.isEmpty)
                            ? Icon(
                                Icons.folder,
                                size: 35.sp,
                              )
                            : CachedNetworkImage(
                                imageUrl: widget.qst_url,
                              )
                        : Image.file(File(widget.qst_doc!.path)),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 2.h,
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
                if (widget.gst.text.isNotEmpty&&widget.qst.text.isNotEmpty) {
                  updateGSTDetails();
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
                "Update GST & QST",
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

  void updateGSTDetails() async {
    await CommonFunction().showLoadingDialog(context);
    final response = await ApiProvider.instance.updateTaxationNo(
        widget.gst_doc?.path ?? "",
        widget.qst_doc?.path ?? "",
        widget.gst.text,
        widget.qst.text);
    if (response.success ?? false) {
      CommonFunction().hideLoadingDialog(context);
      var snackBar = SnackBar(
          backgroundColor: Constants.seventhColor,
          content: Text(
            response.message ?? 'Tax Info Updated Successfully',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontSize: 17.sp,
                  color: Constants.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
          ));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      widget.fetchDetails();
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
          ));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
