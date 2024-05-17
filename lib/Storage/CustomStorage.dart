import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Storage {
  // shared_preferences
  Storage._();

  static final Storage instance = Storage._();
  late SharedPreferences sharedpreferences;

  Future<void> initializeStorage() async {
    sharedpreferences = await SharedPreferences.getInstance();
  }

  Future<void> setUser(String token) async {
    debugPrint('set token $token');
    await sharedpreferences.setString("token", token);
    await sharedpreferences.setBool("isLoggedIn", true);
  }

  Future<void> setToken(String token) async {
    debugPrint('set token $token');
    await sharedpreferences.setString("token", token);
  }


  Future<void> setOnBoarding() async {
    await sharedpreferences.setBool("isOnBoarding", true);
  }

  Future<void> setDarkMode(bool selected) async {
    await sharedpreferences.setBool("dark", selected);
    debugPrint('setDarkMode');
  }


  Future<void> setIsNew(bool val) async {
    await sharedpreferences.setBool("isNew", val);
  }

  get isLoggedIn => sharedpreferences.getBool("isLoggedIn") ?? false;

  get isDarkMode => sharedpreferences.getBool("dark") ?? false;


  get isNew => sharedpreferences.getBool("isNew") ?? false;

  get isOnBoarding => sharedpreferences.getBool("isOnBoarding") ?? false;

  get token => sharedpreferences.getString("token") ?? "";


  // void logout() {}
  Future<void> logout() async {
    await sharedpreferences.clear();
  }
}