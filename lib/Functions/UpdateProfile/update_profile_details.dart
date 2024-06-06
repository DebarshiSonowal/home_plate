import 'dart:convert';
import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:http/http.dart' as http;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/resources/arrays.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:geocoding/geocoding.dart';
import 'package:home_plate/Api/api_provider.dart';
import 'package:home_plate/Storage/CustomStorage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
// import 'package:pluto_grid/pluto_grid.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Constants/constants.dart';
import '../../Model/suggestion.dart';

class UpdateProfileDetails extends StatefulWidget {
  const UpdateProfileDetails({super.key});

  @override
  State<UpdateProfileDetails> createState() => _UpdateProfileDetailsState();
}

class _UpdateProfileDetailsState extends State<UpdateProfileDetails> {

  final firstname = TextEditingController();
  final lastname = TextEditingController();
  final province = TextEditingController();
  final postalcode = TextEditingController();
  final address = TextEditingController();
  String city ="";
  List<Suggestion> _suggestions = [];
  Suggestion? currentSuggestion;
  String? dob = "Please select your date of birth";
  File? address_proof,profile_photo;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.primaryColor,
        title: AutoSizeText(
          "Update Personal Details",
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
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "First Name",
                      style:
                      Theme.of(context).textTheme.bodySmall?.copyWith(
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
                  keyboardType: TextInputType.text,
                  controller: firstname,
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
                      text: "Last Name",
                      style:
                      Theme.of(context).textTheme.bodySmall?.copyWith(
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
                  controller: lastname,
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
                      text: "Date of Birth",
                      style:
                      Theme.of(context).textTheme.bodySmall?.copyWith(
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
              GestureDetector(
                onTap: () {
                  BottomPicker.date(
                    pickerTitle: Text(
                      'Set your Birthday',
                      style:
                      Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Constants.secondaryColor,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    dateOrder: DatePickerDateOrder.dmy,
                    initialDateTime: DateTime(1996, 10, 22),
                    maxDateTime: DateTime(1998),
                    minDateTime: DateTime(1980),
                    pickerTextStyle:
                    Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Constants.fourthColor,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    buttonSingleColor: Constants.seventhColor,
                    onChange: (index) {
                      print(index);
                    },
                    onSubmit: (index) {
                      setState(() {
                        dob = DateFormat("dd-MMM-yyyy").format(
                            DateFormat("yyyy-MM-dd").parse(
                                DateTime.parse(index.toString())
                                    .toString()));
                      });
                    },
                    bottomPickerTheme: BottomPickerTheme.plumPlate,
                  ).show(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Constants.primaryColor,
                    border: Border.all(
                      color: Constants.fourthColor,

// borderSide: const BorderSide(
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  margin: EdgeInsets.symmetric(
                    horizontal: 1.w,
                  ),
                  height: 5.5.h,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: 2.w,
                    vertical: 1.2.h,
                  ),
                  child: Text(
                    dob ?? "Please select your date of birth",
                    style:
                    Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.black87,
                      fontSize: 15.sp,
// fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              AutoSizeText.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "Address",
                      style:
                      Theme.of(context).textTheme.bodySmall?.copyWith(
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
                  controller: address,
                  onChanged: (val) {
                    // _onSearchChanged();
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
              _suggestions.isNotEmpty
                  ? Card(
                elevation: 4,
                child: Container(
                  color: Constants.primaryColor,
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: _suggestions.length,
                    itemBuilder: (context, index) {
                      final suggestion =
                      _suggestions[index];
                      return ListTile(
                        title: Text(suggestion
                            .description
                            .trim() ??
                            ''),
                        // Text(''),
                        subtitle: Text(
                            suggestion.city?.trim() ??
                                ''),
                        // suggestion.locality ?? ''),
                        onTap: () {
                          // Handle location selection
                          _fetchPlaceDetails(
                              suggestion);

                          // Clear suggestions
                        },
                      );
                    },
                    separatorBuilder:
                        (BuildContext context,
                        int index) {
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
                      style:
                      Theme.of(context).textTheme.bodySmall?.copyWith(
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
                  controller: province,
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
                height: 1.h,
              ),
              AutoSizeText.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "Postal Code",
                      style:
                      Theme.of(context).textTheme.bodySmall?.copyWith(
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
                  controller: postalcode,
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
                    fillColor:Constants.primaryColor,
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
                            ? Icon(
                          Icons.folder,
                          size: 35.sp,
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
                            ? Icon(
                          Icons.folder,
                          size: 35.sp,
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
                    if (firstname.text.isNotEmpty&&lastname.text.isNotEmpty&&address.text.isNotEmpty&&province.text.isNotEmpty) {
                      updateProfileDetails();
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
                    "Update Details",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontSize: 17.sp,
                      color: Constants.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
            ],
          ),
        ),
      ),
    );
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
        address.text = suggestion.description;
        province.text = suggestion.state ?? "";
        postalcode.text = suggestion.zipCode ?? "";
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

  void updateProfileDetails() async{
    final response = await ApiProvider.instance.updatePersonalDetails(Storage.instance.token, firstname.text, lastname.text, address.text, province.text, city, postalcode.text, currentSuggestion!.latitude.toString(), currentSuggestion!.longitude.toString(), address_proof!.path, profile_photo!.path);
  }
}
