import 'package:flutter/material.dart';
import 'package:home_plate/Functions/ContactUs/contact_us.dart';
import 'package:home_plate/Functions/EditProfile/edit_profile.dart';
import 'package:home_plate/Functions/HomePage/home_screen.dart';
import 'package:home_plate/Functions/IntroSlides/intro_slides.dart';
import 'package:home_plate/Functions/PickArea/pick_area.dart';
import 'package:home_plate/Functions/Profile/profile_screen.dart';
import 'package:home_plate/Functions/UpdateDocument/update_document.dart';
import 'package:home_plate/Functions/Verify/delivery_verify_screen.dart';
import 'package:home_plate/Router/routes.dart';
import 'package:intro_slider/intro_slider.dart';
import '../CommonWidget/transition_page_router.dart';
import '../Functions/Delivered/order_delivered.dart';
import '../Functions/GetOrder/get_order.dart';
import '../Functions/IntroScreen/intro_screen.dart';
import '../Functions/LocatePickup/locate_pickup.dart';
import '../Functions/Location/location_details.dart';
import '../Functions/Login/login_page.dart';
import '../Functions/Main/main_screen.dart';
import '../Functions/MyEarnings/my_earnings.dart';
import '../Functions/OTP/otp_verification.dart';

// import '../Functions/SignIn/sign_up_page.dart';
import '../Functions/OrderDetails/order_details.dart';
import '../Functions/SignUp/sign_up_page.dart';
import '../Functions/SplashScreen/splash_screen.dart';
import '../Functions/Tasks/tasks_screen.dart';
import '../Functions/UpdateBankDetails/update_bank_details.dart';
import '../Functions/UpdateProfile/update_profile_details.dart';
import '../Functions/UpdateTaxInfo/update_tax_info.dart';
import '../Functions/VerificationPending/verification_pending_screen.dart';
import '../Functions/Verified/verified_screen.dart';
import '../Functions/Verify/pickup_verify_screen.dart';
import '../Functions/VerifyEmail/verify_email_screen.dart';
import '../Model/pass_arguments.dart';
import '../PickAddress/pick_address.dart';
import '../ProfileCreate/profile_create_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Routes.splashScreen:
      return FadeTransitionPageRouteBuilder(page: const SplashScreen());
    case Routes.introSlidesScreen:
      return FadeTransitionPageRouteBuilder(page: const IntroSlides());
    case Routes.introScreen:
      return FadeTransitionPageRouteBuilder(page: const IntroScreen());
    case Routes.loginScreen:
      return FadeTransitionPageRouteBuilder(page: const LoginScreen());
    case Routes.signUpScreen:
      return FadeTransitionPageRouteBuilder(
          page: SignInPage(
        are_you_a: settings.arguments as String,
      ));
    case Routes.homeScreen:
      // return FadeTransitionPageRouteBuilder(page: const MainScreen());
      return FadeTransitionPageRouteBuilder(page: const HomeScreen());
    case Routes.tasksScreen:
      return FadeTransitionPageRouteBuilder(
        // page: OrderDetails(
        //   id: settings.arguments as int,
        // ),
        page: TasksScreen(
          id: settings.arguments as int,
        ),
      );
    case Routes.otpScreen:
      final ScreenArguments args = settings.arguments as ScreenArguments;
      return FadeTransitionPageRouteBuilder(
        page: OTPVerificationPage(
          info: args,
        ),
      );
    case Routes.locationScreen:
      return FadeTransitionPageRouteBuilder(
        page: LocationDetails(
          id: settings.arguments as int,
        ),
      );
    case Routes.deliverySuccessScreen:
      return FadeTransitionPageRouteBuilder(
        page: OrderDelivered(
          id: settings.arguments as int,
        ),
      );
    case Routes.pickupScreen:
      return FadeTransitionPageRouteBuilder(
        page: LocatePickup(
          id: settings.arguments as int,
        ),
      );
    case Routes.pickUpVerificationScreen:
      return FadeTransitionPageRouteBuilder(
        page: PickUpVerifyScreen(
          id: settings.arguments as int,
        ),
      );
    case Routes.deliveryVerificationScreen:
      return FadeTransitionPageRouteBuilder(
        page: DeliveryVerifyScreen(
          id: settings.arguments as int,
        ),
      );
    case Routes.profileScreen:
      return FadeTransitionPageRouteBuilder(page: const ProfileScreen());
    case Routes.profileUpdateScreen:
      return FadeTransitionPageRouteBuilder(page: const EditProfileScreen());
    case Routes.pickLocationScreen:
      return FadeTransitionPageRouteBuilder(page: const PickArea());
    case Routes.pickAddressScreen:
      return FadeTransitionPageRouteBuilder(page: const PickAddress());
    case Routes.profileCreateScreen:
      final ScreenArguments args = settings.arguments as ScreenArguments;
      return FadeTransitionPageRouteBuilder(
          page: CreateProfileScreen(
        email: args.email,
        mobile: args.mobile,
        are_you_a: args.are_you_a,
        firstname: args.firstname,
        lastname: args.lastname,
      ));
    case Routes.profileVerificationScreen:
      return FadeTransitionPageRouteBuilder(
          page: const VerificationPendingScreen());
    case Routes.profileVerifiedScreen:
      return FadeTransitionPageRouteBuilder(page: const VerifiedScreen());
    case Routes.profileUpdateDocumentScreen:
      return FadeTransitionPageRouteBuilder(page: const UpdateDocumentScreen());
    case Routes.getOrderScreen:
      return FadeTransitionPageRouteBuilder(page: const GetOrder());
    case Routes.myEarningsScreen:
      return FadeTransitionPageRouteBuilder(page: const MyEarnings());
    case Routes.profileUpdateBankDetailsScreen:
      return FadeTransitionPageRouteBuilder(page: const UpdateBankDetails());
    case Routes.profileUpdateTaxDetailsScreen:
      return FadeTransitionPageRouteBuilder(page: const UpdateTaxInfoDetails());
    case Routes.profileUpdatePersonalDetailsScreen:
      return FadeTransitionPageRouteBuilder(page: const UpdateProfileDetails());
    case Routes.profileVerifyEmailScreen:
      return FadeTransitionPageRouteBuilder(page: const VerifyEmailScreen());
    case Routes.contactUsScreen:
      return FadeTransitionPageRouteBuilder(page: const ContactUsScreen());
    default:
      return FadeTransitionPageRouteBuilder(
        page: Container(),
      );
  }
}
