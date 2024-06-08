import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:home_plate/Api/api_provider.dart';
import 'package:home_plate/Storage/CustomStorage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:popup_menu_plus/popup_menu_plus.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../Constants/common_function.dart';
import '../../Constants/constants.dart';
import '../../Navigation/Navigate.dart';
import '../../Repository/repository.dart';

class UpdateDocumentScreen extends StatefulWidget {
  const UpdateDocumentScreen({super.key});

  @override
  State<UpdateDocumentScreen> createState() => _UpdateDocumentScreenState();
}

class _UpdateDocumentScreenState extends State<UpdateDocumentScreen> {
  File? dl_photo;
  String? dl_url = "";
  final dlNumber = TextEditingController();
  PopupMenu? menu;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 0), () {
      loadDrivingDetails();
      menu = PopupMenu(
        context: context,
        config: const MenuConfig(
          backgroundColor: Colors.green,
          lineColor: Colors.greenAccent,
          highlightColor: Colors.lightGreenAccent,
        ),
        items: [
          PopUpMenuItem(
            title: 'View Existing',
            image: const Icon(Icons.picture_as_pdf),
          ),
          PopUpMenuItem(
            title: 'PickUp New',
            image: const Icon(
              Icons.photo_outlined,
              color: Colors.white,
            ),
          ),
        ],
        onClickMenu: (PopUpMenuItemProvider val) {
          if (val.menuTitle == "View Existing") {
          } else {}
        },
        onShow: () {},
        onDismiss: () {},
      );
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
          "Update DL Details",
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
                    text: "Driving License",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.black87,
                          fontSize: 19.sp,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
              textAlign: TextAlign.start,
            ),
            SizedBox(
              height: 1.h,
            ),
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
                controller: dlNumber,
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
                  fillColor: Colors.white70,
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
                  color: Constants.primaryColor,
                  height: 30.h,
                  width: double.infinity,
                  child: Center(
                    child: dl_photo == null
                        ? (dl_url?.isEmpty ?? false)
                            ? GestureDetector(
                                onTap: () {
                                  pickImage((path) {
                                    setState(() {
                                      dl_photo = File(path);
                                    });
                                  });
                                },
                                child: Icon(
                                  Icons.folder,
                                  size: 35.sp,
                                ),
                              )
                            : SfPdfViewer.network(dl_url!)
                        : GestureDetector(
                            onTap: () {
                              pickImage((path) {
                                setState(() {
                                  dl_photo = File(path);
                                });
                              });
                            },
                            child: Image.file(File(dl_photo!.path))),
                  ),
                ),
              ),
            ),
            const Spacer(),
            status == 2
                ? Container()
                : Container(
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
                        if (dlNumber.text.isNotEmpty) {
                          updateDrivingLicense();
                        } else {
                          var snackBar = SnackBar(
                              backgroundColor: Constants.secondaryColor,
                              content: Text(
                                'Enter all the details',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                      fontSize: 17.sp,
                                      color: Constants.primaryColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      },
                      child: Text(
                        "Update Document",
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

  void updateDrivingLicense() async {
    await CommonFunction().showLoadingDialog(context);
    final response = await ApiProvider.instance
        .updateDrivingLicence(dlNumber.text, dl_photo?.path ?? "");
    if (response.success ?? false) {
      await CommonFunction().hideLoadingDialog(context);
      var snackBar = SnackBar(
          backgroundColor: Constants.seventhColor,
          content: Text(
            response.message ?? 'Document Updated Successfully',
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
      // Navigation.instance.goBack();
    }
  }

  void loadDrivingDetails() {
    final data = Provider.of<Repository>(context, listen: false).profile;
    dlNumber.text = data?.driving_licence_no ?? "";
    dl_url = data?.driving_licence_proof ?? "";
    debugPrint("db ${data?.driving_licence_proof ?? ""}");
    setState(() {});
  }
}
