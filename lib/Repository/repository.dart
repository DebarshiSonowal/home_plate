


import 'package:flutter/material.dart';
import 'package:home_plate/Model/Details/profile_details.dart';
import 'package:home_plate/Model/Profile/profile_model.dart';

import '../Model/Order/order_model.dart';

class Repository extends ChangeNotifier{
  List<OrderModel> _opportunities=[];
  ProfileModel? profile;

  void setOpportunities(List<OrderModel> val){
    _opportunities = val;
    notifyListeners();
  }
  void setProfileModel(ProfileModel val){
    profile = val;
    notifyListeners();
  }

  List<OrderModel> get opportunities => _opportunities;
}