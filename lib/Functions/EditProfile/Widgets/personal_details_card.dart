import 'dart:convert';
import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:home_plate/Repository/repository.dart';
import 'package:http/http.dart' as http;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/resources/arrays.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:geocoding/geocoding.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../Api/api_provider.dart';
import '../../../Constants/common_function.dart';
import '../../../Constants/constants.dart';
import '../../../Model/suggestion.dart';
import '../../../Navigation/Navigate.dart';
import '../../../Router/routes.dart';

class PersonalDetailsCard extends StatefulWidget {
  const PersonalDetailsCard(
      {super.key,
      required this.province,
      required this.postalcode,
      required this.address,
      required this.password,
      required this.confirmPassword,
      required this.firstname,
      required this.lastname,
      required this.dob,
      required this.updateDOB,
      required this.document,
      required this.profile_pic, required this.loadProfile, required this.city});

  final TextEditingController firstname;
  final TextEditingController lastname;
  final TextEditingController province;
  final TextEditingController postalcode;
  final TextEditingController address;
  final TextEditingController password;
  final TextEditingController confirmPassword;
  final String dob, document, profile_pic,city;
  final Function(String) updateDOB;
  final Function loadProfile;
  @override
  State<PersonalDetailsCard> createState() => _PersonalDetailsCardState();
}

class _PersonalDetailsCardState extends State<PersonalDetailsCard> {
  bool _isValidPassword = true, _isValidConfirmPassword = true;
  bool isPasswordVisible = false, isConfirmPasswordVisible = false;
  Suggestion? currentSuggestion;
  List<Suggestion> _suggestions = [];
  File? address_proof, profile_photo;


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
                text: "Personal Info",
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
                  text: "First Name",
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
              controller: widget.firstname,
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
                hintText: "Please enter your firstname",
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
                  text: "Last Name",
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
              controller: widget.lastname,
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
                hintText: "Please enter your lastname",
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
//           AutoSizeText.rich(
//             TextSpan(
//               children: [
//                 TextSpan(
//                   text: "Date of Birth",
//                   style: Theme.of(context).textTheme.bodySmall?.copyWith(
//                         color: Colors.black87,
//                         fontSize: 16.sp,
// // fontWeight: FontWeight.bold,
//                       ),
//                 ),
//               ],
//             ),
//             textAlign: TextAlign.start,
//           ),
//           SizedBox(
//             height: 1.h,
//           ),
//           GestureDetector(
//             onTap: () {
//               BottomPicker.date(
//                 pickerTitle: Text(
//                   'Set your Birthday',
//                   style: Theme.of(context).textTheme.bodySmall?.copyWith(
//                         color: Constants.secondaryColor,
//                         fontSize: 15.sp,
//                         fontWeight: FontWeight.bold,
//                       ),
//                 ),
//                 dateOrder: DatePickerDateOrder.dmy,
//                 initialDateTime: DateTime(1996, 10, 22),
//                 maxDateTime: DateTime(1998),
//                 minDateTime: DateTime(1980),
//                 pickerTextStyle:
//                     Theme.of(context).textTheme.bodySmall!.copyWith(
//                           color: Constants.fourthColor,
//                           fontSize: 15.sp,
//                           fontWeight: FontWeight.bold,
//                         ),
//                 buttonSingleColor: Constants.seventhColor,
//                 onChange: (index) {
//                   print(index);
//                 },
//                 onSubmit: (index) {
//                   widget.updateDOB(DateFormat("dd-MMM-yyyy").format(
//                       DateFormat("yyyy-MM-dd")
//                           .parse(DateTime.parse(index.toString()).toString())));
//                 },
//                 bottomPickerTheme: BottomPickerTheme.plumPlate,
//               ).show(context);
//             },
//             child: Container(
//               decoration: BoxDecoration(
//                 color: Constants.bgColor,
//                 border: Border.all(
//                   color: Constants.fourthColor,
//
// // borderSide: const BorderSide(
//                 ),
//                 borderRadius: BorderRadius.circular(10.0),
//               ),
//               margin: EdgeInsets.symmetric(
//                 horizontal: 1.w,
//               ),
//               height: 5.5.h,
//               width: double.infinity,
//               padding: EdgeInsets.symmetric(
//                 horizontal: 2.w,
//                 vertical: 1.2.h,
//               ),
//               child: Text(
//                 widget.dob ?? "Please select your date of birth",
//                 style: Theme.of(context).textTheme.bodySmall?.copyWith(
//                       color: Colors.black87,
//                       fontSize: 15.sp,
// // fontWeight: FontWeight.bold,
//                     ),
//                 textAlign: TextAlign.start,
//               ),
//             ),
//           ),
//           SizedBox(
//             height: 2.h,
//           ),
          AutoSizeText.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "Address",
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
            // color: Constants.bgColor,
            margin: EdgeInsets.symmetric(
              horizontal: 1.w,
            ),
            height: 5.5.h,
            child: TextField(
// maxLength: 10,
              keyboardType: TextInputType.text,
              controller: widget.address,
              onChanged: (val) {
                fetchSuggestions(val);
              },
              onSubmitted: (val) {},
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
                hintText: "Please enter your address",
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
          _suggestions.isNotEmpty
              ? Card(
                  elevation: 4,
                  child: Container(
                    color: Constants.primaryColor,
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemCount: _suggestions.length,
                      itemBuilder: (context, index) {
                        final suggestion = _suggestions[index];
                        return ListTile(
                          title: Text(suggestion.description.trim() ?? ''),
                          // Text(''),
                          subtitle: Text(suggestion.city?.trim() ?? ''),
                          // suggestion.locality ?? ''),
                          onTap: () {
                            // Handle location selection
                            _fetchPlaceDetails(suggestion);

                            // Clear suggestions
                          },
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const Divider();
                      },
                    ),
                  ),
                )
              : Container(),
          SizedBox(
            height: 2.h,
          ),
          AutoSizeText.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "Province",
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
              controller: widget.province,
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
                hintText: "Please enter your province",
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
            height: 1.h,
          ),
          AutoSizeText.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "Postal Code",
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.black87,
                        fontSize: 16.sp,
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
              controller: widget.postalcode,
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
                hintText: "Please enter your postal code",
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
            height: 1.h,
          ),
          SizedBox(
            height: 1.h,
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
            child: GestureDetector(
              onTap: () {
                pickImage((path) {
                  setState(() {
                    address_proof = File(path);
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
                    child: address_proof == null
                        ? (widget.document.isEmpty)
                            ? Icon(
                                Icons.folder,
                                size: 35.sp,
                              )
                            : CachedNetworkImage(
                                imageUrl: widget.document!,
                              )
                        : Image.file(File(address_proof!.path)),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 1.h,
          ),
          AutoSizeText.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "Profile Picture",
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
                    profile_photo = File(path);
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
                    child: profile_photo == null
                        ? (widget.profile_pic.isEmpty)
                            ? Icon(
                                Icons.folder,
                                size: 35.sp,
                              )
                            : CachedNetworkImage(
                                imageUrl: widget.profile_pic!,
                              )
                        : Image.file(File(profile_photo!.path)),
                  ),
                ),
              ),
            ),
          ),
          // const Spacer(),
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
                if (widget.firstname.text.isNotEmpty &&
                        widget.lastname.text.isNotEmpty &&
                        // widget.dob != null &&
                        widget.address.text.isNotEmpty &&
                        widget.province.text.isNotEmpty &&
                        widget.postalcode.text.isNotEmpty
                    // &&
                    // widget.password.text.isNotEmpty &&
                    // widget.confirmPassword.text.isNotEmpty
                    ) {
                  // if (validatePassword(widget.password.text)) {
                  //   if (widget.password.text == widget.confirmPassword.text) {
                  updateProfile();
                  //   } else {
                  //     var snackBar = SnackBar(
                  //       backgroundColor: Constants.secondaryColor,
                  //       content: Text(
                  //         'Please ensure both passwords match',
                  //         style:
                  //             Theme.of(context).textTheme.bodySmall?.copyWith(
                  //                   fontSize: 17.sp,
                  //                   color: Constants.primaryColor,
                  //                   fontWeight: FontWeight.bold,
                  //                 ),
                  //       ),
                  //     );
                  //     ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  //   }
                  // } else {
                  //   var snackBar = SnackBar(
                  //     backgroundColor: Constants.secondaryColor,
                  //     content: Text(
                  //       'Please ensure to enter a valid password',
                  //       style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  //             fontSize: 17.sp,
                  //             color: Constants.primaryColor,
                  //             fontWeight: FontWeight.bold,
                  //           ),
                  //     ),
                  //   );
                  //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  // }
                } else {
                  var snackBar = SnackBar(
                    backgroundColor: Constants.secondaryColor,
                    content: Text(
                      'Please enter all the information',
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
                "Update Personal Details",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontSize: 17.sp,
                      color: Constants.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool validatePassword(String password) {
// Regex pattern for password validation
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regex = RegExp(pattern);
    return regex.hasMatch(password);
  }

  bool validationPassword(String password) {
// Regex pattern for password validation
    if (password.isEmpty) {
      return true;
    }
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regex = RegExp(pattern);
    return regex.hasMatch(password);
  }

  bool hasUppercase(String password) {
    return password.contains(RegExp(r'[A-Z]'));
  }

  bool hasLowercase(String password) {
    return password.contains(RegExp(r'[a-z]'));
  }

  bool hasNumber(String password) {
    return password.contains(RegExp(r'[0-9]'));
  }

  bool hasSpecialCharacter(String password) {
    return password.contains(RegExp(r'[!@#\$&*~]'));
  }

  bool hasMinLength(String password) {
    return password.length >= 8;
  }

  Future<void> pickImage(Function(String path) onTap) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    onTap(image!.path);
  }

  Future<List<Suggestion>> fetchSuggestions(String input) async {
    final apiKey = dotenv.env['MAPS']; // Replace with your API key
    final request =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$input&types=address&language=en&components=country:ca&key=$apiKey';
    final response = await http.get(Uri.parse(request));
    if (response.statusCode == 200) {
      print("Address ${response.body}");
      final result = json.decode(response.body);
      if (result['status'] == 'OK') {
        setState(() {
          _suggestions = result['predictions']
              .map<Suggestion>((p) => Suggestion(
                    placeId: p['place_id'],
                    description: p['description'],
                  ))
              .toList();
        });
        return result['predictions']
            .map<Suggestion>((p) => Suggestion(
                  placeId: p['place_id'],
                  description: p['description'],
                ))
            .toList();
      }
      if (result['status'] == 'ZERO_RESULTS') {
        return [];
      }
      throw Exception(result['error_message']);
    } else {
      throw Exception('Failed to fetch suggestions');
    }
  }

  Future<void> _fetchPlaceDetails(Suggestion suggestion) async {
    final apiKey = dotenv.env['MAPS']; // Replace with your API key

    // 1. Fetch address components
    final request =
        'https://maps.googleapis.com/maps/api/place/details/json?place_id=${suggestion.placeId}&fields=address_component,geometry&key=$apiKey';
    final response = await http.get(Uri.parse(request));

    if (response.statusCode == 200) {
      print("Address Details ${response.body}");
      final result = json.decode(response.body);
      if (result['status'] == 'OK') {
        // Extract address components
        final components =
            result['result']['address_components'] as List<dynamic>;
        for (var component in components) {
          final types = component['types'] as List<dynamic>;
          if (types.contains('street_number')) {
            suggestion.streetNumber = component['long_name'];
          } else if (types.contains('route')) {
            suggestion.street = component['long_name'];
          } else if (types.contains('locality')) {
            suggestion.city = component['long_name'];
          } else if (types.contains('administrative_area_level_1')) {
            suggestion.state = component['short_name'];
          } else if (types.contains('postal_code')) {
            suggestion.zipCode = component['long_name'];
          } else if (types.contains('country')) {
            suggestion.country = component['long_name'];
          }
        }

        // 2. Extract Latitude & Longitude from Geometry
        suggestion.latitude = result['result']['geometry']['location']['lat'];
        suggestion.longitude = result['result']['geometry']['location']['lng'];
        print("address location ${result}");
        widget.address.text = suggestion.description;
        widget.province.text = suggestion.state ?? "";
        widget.postalcode.text = suggestion.zipCode ?? "";
        _suggestions = [];
        currentSuggestion = suggestion;
        setState(() {}); // Update the state to reflect changes
      } else {
        throw Exception(result['error_message']);
      }
    } else {
      throw Exception('Failed to fetch place details');
    }
  }

  void updateProfile() async {
    await CommonFunction().showLoadingDialog(context);
    final data = Provider.of<Repository>(context,listen: false).profile;
    final response = await ApiProvider.instance.updatePersonalDetails(
        widget.firstname.text,
        widget.lastname.text,
        widget.address.text,
        widget.province.text,
        widget.city,
        widget.postalcode.text,
        (currentSuggestion?.latitude??data?.latitude).toString(),
        (currentSuggestion?.longitude??data?.longitude).toString(),
        (address_proof?.path??""),
        (profile_photo?.path??""));
    if(response.success??false){
      CommonFunction().hideLoadingDialog(context);
      var snackBar = SnackBar(
        backgroundColor: Constants.seventhColor,
        content: Text(
          response.message??'Profile Updated Successfully',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            fontSize: 17.sp,
            color: Constants.primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      widget.loadProfile();
    }else{
      CommonFunction().hideLoadingDialog(context);
      var snackBar = SnackBar(
        backgroundColor: Constants.secondaryColor,
        content: Text(
          response.message??'Profile Updated Unsuccessfully',
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
