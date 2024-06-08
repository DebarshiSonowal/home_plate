import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:home_plate/Constants/common_function.dart';
import 'package:home_plate/Navigation/Navigate.dart';
import 'package:home_plate/Router/routes.dart';
import 'package:home_plate/Storage/CustomStorage.dart';
import 'package:provider/provider.dart';

import '../../Api/api_provider.dart';
import '../../Constants/assets.dart';
import '../../Repository/repository.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
    Future.delayed(const Duration(seconds: 5), () async {
      if (Storage.instance.isLoggedIn) {
        await fetchProfile();
      } else {
        Navigation.instance.navigateAndReplace(Routes.introSlidesScreen);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values); // to re-show bars
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: Image
                .asset(Assets.splash)
                .image,
            fit: BoxFit.fill,
          ),
        ),
        // child: Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     Image.asset(Assets.logo),
        //   ],
        // ),
      ),
    );
  }

  fetchProfile() async {
    final response = await ApiProvider.instance.getMyDetails();
    if (response.success ?? false) {
      Provider.of<Repository>(context, listen: false)
          .setProfileModel(response.data!);
      final data = response.data;
      // if (((data?.is_address_proof_document_completed ?? 0) == 1) &&
      //     ((data?.is_bank_document_detail ?? 0) == 1) &&
      //     ((data?.is_driving_license_document_completed ?? 0) == 1) &&
      //     ((data?.is_personal_details_completed ?? 0) == 1) &&
      //     ((data?.is_tax_document_completed ?? 0) == 1) &&
      //     ((data?.is_email_verified ?? 0) == 1)) {
      // if ((data?.status ?? 0) == 1) {
      //   Navigation.instance.navigateAndReplace(Routes.homeScreen);
      // } else if ((data?.status ?? 0) == 2||(data?.status ?? 0) == 0) {
      //   Navigation.instance.navigateAndReplace(
      //     Routes.profileVerificationScreen,
      //   );
      // } else {
      CommonFunction().accountDeactivate(context);
      CommonFunction().logout();
      // }
    } else {
      CommonFunction().logout();
    }
  }
}
// if (response) {
//           Navigation.instance.navigateAndReplace(Routes.homeScreen);
//         } else {
//           Navigation.instance
//               .navigateAndReplace(Routes.profileVerificationScreen);
//         }
