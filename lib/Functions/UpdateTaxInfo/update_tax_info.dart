import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:home_plate/Api/api_provider.dart';
import 'package:home_plate/Navigation/Navigate.dart';
import 'package:home_plate/Storage/CustomStorage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Constants/common_function.dart';
import '../../Constants/constants.dart';
import '../../Repository/repository.dart';

class UpdateTaxInfoDetails extends StatefulWidget {
  const UpdateTaxInfoDetails({super.key});

  @override
  State<UpdateTaxInfoDetails> createState() => _UpdateTaxInfoDetailsState();
}

class _UpdateTaxInfoDetailsState extends State<UpdateTaxInfoDetails> {
  final gst = TextEditingController();
  final qst = TextEditingController();
  File? gst_doc, qst_doc;
  String? gst_pic = "", qst_pic = "";

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      loadGSTDetails();
    });
  }

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<Repository>(context, listen: false).profile;
    final int status = data?.status ?? 0;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.primaryColor,
        title: AutoSizeText(
          "Update Tax Details",
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Constants.secondaryColor,
                fontSize: 18.sp,
              ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 3.w,
          vertical: 1.h,
        ),
        color: Constants.bgColor,
        height: double.infinity,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                controller: gst,
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
                  fillColor: Constants.primaryColor,
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
                controller: qst,
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
                  fillColor: Constants.primaryColor,
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
                    setState(() {
                      gst_doc = File(path);
                    });
                  });
                },
                child: DottedBorder(
                  color: Colors.black,
                  strokeWidth: 1,
                  child: Container(
                    color: Constants.primaryColor,
                    height: 20.h,
                    width: double.infinity,
                    child: Center(
                      child: gst_doc == null
                          ? (gst_pic?.isEmpty ?? false)
                              ? Icon(
                                  Icons.folder,
                                  size: 35.sp,
                                )
                              : CachedNetworkImage(
                                  imageUrl: gst_pic ?? "",
                                )
                          : Image.file(File(gst_doc!.path)),
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
                    setState(() {
                      qst_doc = File(path);
                    });
                  });
                },
                child: DottedBorder(
                  color: Colors.black,
                  strokeWidth: 1,
                  child: Container(
                    color: Constants.primaryColor,
                    height: 20.h,
                    width: double.infinity,
                    child: Center(
                      child: qst_doc == null
                          ? (qst_pic?.isEmpty ?? false)
                              ? Icon(
                                  Icons.folder,
                                  size: 35.sp,
                                )
                              : CachedNetworkImage(
                                  imageUrl: qst_pic ?? "",
                                )
                          : Image.file(File(qst_doc!.path)),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            const Spacer(),
            status==2?Container():Container(
              margin: EdgeInsets.symmetric(
                horizontal: 1.w,
              ),
              height: 7.h,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Constants.secondaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // <-- Radius
                  ),
                ),
                onPressed: () {
                  if (gst.text.isNotEmpty &&
                      qst.text.isNotEmpty) {
                    updateTaxInfo();
                  } else {
                    var snackBar = SnackBar(
                        backgroundColor: Constants.secondaryColor,
                        content: Text(
                          'Enter all the details',
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    fontSize: 17.sp,
                                    color: Constants.primaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    // Navigation.instance.goBack();
                  }
                },
                child: Text(
                  "Update Tax Details",
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
      ),
    );
  }

  Future<void> pickImage(Function(String path) onTap) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    onTap(image!.path);
  }

  void updateTaxInfo() async {
    await CommonFunction().showLoadingDialog(context);
    final response = await ApiProvider.instance.updateTaxationNo(
        gst_doc?.path ?? "", qst_doc?.path ?? "", gst.text, qst.text);
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
      Navigation.instance.goBack();
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

  void loadGSTDetails() {
    final data = Provider.of<Repository>(context, listen: false).profile;
    gst.text = data?.gst_no ?? "";
    qst.text = data?.qst_no ?? "";
    gst_pic = data?.gst_image ?? "";
    qst_pic = data?.qst_image ?? "";
    setState(() {});
  }
}
