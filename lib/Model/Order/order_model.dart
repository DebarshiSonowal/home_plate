class OrderResponse{
  bool? success;
  String? message;
  List<OrderModel> orders=[];

  OrderResponse.fromJson(json){
    success = json['success']??false;
    message = json['message']??"";
    orders = json['data']==null?[] : (json['data'] as List).map((e) => OrderModel.fromJson(e)).toList();
  }

  OrderResponse.withError(msg){
    success = false;
    message = msg;
  }

}



class OrderModel {
  int? id;
  String? orderId;
  String? subOrderId;
  String? chefId;
  int? chefCommission;
  double? chefCommissionAmount;
  String? chefCommissionTaxes;
  String? chefSaleTaxes;
  String? trackId;
  String? itemTotal;
  String? amount;
  String? tip;
  String? tipType;
  String? tipAmount;
  String? status;
  String? reason;
  String? driverId;
  String? deliveryToken;
  String? customerDeliveryToken;
  String? deletedAt;
  String? createdAt;
  String? updatedAt;
  Orders? orders;
  Chefs? chefs;
  List<OrderItems>? orderItems;
  List<OrderTrack>? orderTrack;

  OrderModel(
      {this.id,
        this.orderId,
        this.subOrderId,
        this.chefId,
        this.chefCommission,
        this.chefCommissionAmount,
        this.chefCommissionTaxes,
        this.chefSaleTaxes,
        this.trackId,
        this.itemTotal,
        this.amount,
        this.tip,
        this.tipType,
        this.tipAmount,
        this.status,
        this.reason,
        this.driverId,
        this.deliveryToken,
        this.customerDeliveryToken,
        this.deletedAt,
        this.createdAt,
        this.updatedAt,
        this.orders,
        this.chefs,
        this.orderItems,
        this.orderTrack});

  OrderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderId = json['order_id'];
    subOrderId = json['sub_order_id'];
    chefId = json['chef_id'];
    chefCommission = json['chef_commission'];
    chefCommissionAmount = json['chef_commission_amount'];
    chefCommissionTaxes = json['chef_commission_taxes'];
    chefSaleTaxes = json['chef_sale_taxes'];
    trackId = json['track_id'];
    itemTotal = json['item_total'];
    amount = json['amount'];
    tip = json['tip'];
    tipType = json['tip_type'];
    tipAmount = json['tip_amount'];
    status = json['status'];
    reason = json['reason'];
    driverId = json['driver_id'];
    deliveryToken = json['delivery_token'];
    customerDeliveryToken = json['customer_delivery_token'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    orders =
    json['orders'] != null ? new Orders.fromJson(json['orders']) : null;
    chefs = json['chefs'] != null ? new Chefs.fromJson(json['chefs']) : null;
    if (json['order_items'] != null) {
      orderItems = <OrderItems>[];
      json['order_items'].forEach((v) {
        orderItems!.add(new OrderItems.fromJson(v));
      });
    }
    if (json['order_track'] != null) {
      orderTrack = <OrderTrack>[];
      json['order_track'].forEach((v) {
        orderTrack!.add(new OrderTrack.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['order_id'] = this.orderId;
    data['sub_order_id'] = this.subOrderId;
    data['chef_id'] = this.chefId;
    data['chef_commission'] = this.chefCommission;
    data['chef_commission_amount'] = this.chefCommissionAmount;
    data['chef_commission_taxes'] = this.chefCommissionTaxes;
    data['chef_sale_taxes'] = this.chefSaleTaxes;
    data['track_id'] = this.trackId;
    data['item_total'] = this.itemTotal;
    data['amount'] = this.amount;
    data['tip'] = this.tip;
    data['tip_type'] = this.tipType;
    data['tip_amount'] = this.tipAmount;
    data['status'] = this.status;
    data['reason'] = this.reason;
    data['driver_id'] = this.driverId;
    data['delivery_token'] = this.deliveryToken;
    data['customer_delivery_token'] = this.customerDeliveryToken;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.orders != null) {
      data['orders'] = this.orders!.toJson();
    }
    if (this.chefs != null) {
      data['chefs'] = this.chefs!.toJson();
    }
    if (this.orderItems != null) {
      data['order_items'] = this.orderItems!.map((v) => v.toJson()).toList();
    }
    if (this.orderTrack != null) {
      data['order_track'] = this.orderTrack!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Orders {
  int? id;
  String? orderId;
  List<TaxTypes>? taxTypes;
  String? orderTotal;
  String? orderTax;
  String? orderDate;
  String? shipping;
  String? shippingTax;
  String? discountAmount;
  String? grandTotal;
  String? userId;
  String? shippingAddress;
  Null? city;
  String? state;
  String? latitude;
  String? longitude;
  String? postalCode;
  String? paymentMode;
  String? deliveryDate;
  String? deliveryTime;
  String? foodInstruction;
  String? deliveryOption;
  Null? optionDesc;
  String? deliveryInstructions;
  String? paymentStatus;
  String? transactonId;
  String? totalOrderItem;
  String? tipTotal;
  String? userMobileNo;
  String? username;
  Null? deletedAt;
  String? createdAt;
  String? updatedAt;

  Orders(
      {this.id,
        this.orderId,
        this.taxTypes,
        this.orderTotal,
        this.orderTax,
        this.orderDate,
        this.shipping,
        this.shippingTax,
        this.discountAmount,
        this.grandTotal,
        this.userId,
        this.shippingAddress,
        this.city,
        this.state,
        this.latitude,
        this.longitude,
        this.postalCode,
        this.paymentMode,
        this.deliveryDate,
        this.deliveryTime,
        this.foodInstruction,
        this.deliveryOption,
        this.optionDesc,
        this.deliveryInstructions,
        this.paymentStatus,
        this.transactonId,
        this.totalOrderItem,
        this.tipTotal,
        this.userMobileNo,
        this.username,
        this.deletedAt,
        this.createdAt,
        this.updatedAt});

  Orders.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderId = json['order_id'];
    if (json['tax_types'] != null) {
      taxTypes = <TaxTypes>[];
      json['tax_types'].forEach((v) {
        taxTypes!.add(new TaxTypes.fromJson(v));
      });
    }
    orderTotal = json['order_total'];
    orderTax = json['order_tax'];
    orderDate = json['order_date'];
    shipping = json['shipping'];
    shippingTax = json['shipping_tax'];
    discountAmount = json['discount_amount'];
    grandTotal = json['grand_total'];
    userId = json['user_id'];
    shippingAddress = json['shipping_address'];
    city = json['city'];
    state = json['state'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    postalCode = json['postal_code'];
    paymentMode = json['payment_mode'];
    deliveryDate = json['delivery_date'];
    deliveryTime = json['delivery_time'];
    foodInstruction = json['food_instruction'];
    deliveryOption = json['delivery_option'];
    optionDesc = json['option_desc'];
    deliveryInstructions = json['delivery_instructions'];
    paymentStatus = json['payment_status'];
    transactonId = json['transacton_id'];
    totalOrderItem = json['total_order_item'];
    tipTotal = json['tip_total'];
    userMobileNo = json['user_mobile_no'];
    username = json['username'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['order_id'] = this.orderId;
    if (this.taxTypes != null) {
      data['tax_types'] = this.taxTypes!.map((v) => v.toJson()).toList();
    }
    data['order_total'] = this.orderTotal;
    data['order_tax'] = this.orderTax;
    data['order_date'] = this.orderDate;
    data['shipping'] = this.shipping;
    data['shipping_tax'] = this.shippingTax;
    data['discount_amount'] = this.discountAmount;
    data['grand_total'] = this.grandTotal;
    data['user_id'] = this.userId;
    data['shipping_address'] = this.shippingAddress;
    data['city'] = this.city;
    data['state'] = this.state;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['postal_code'] = this.postalCode;
    data['payment_mode'] = this.paymentMode;
    data['delivery_date'] = this.deliveryDate;
    data['delivery_time'] = this.deliveryTime;
    data['food_instruction'] = this.foodInstruction;
    data['delivery_option'] = this.deliveryOption;
    data['option_desc'] = this.optionDesc;
    data['delivery_instructions'] = this.deliveryInstructions;
    data['payment_status'] = this.paymentStatus;
    data['transacton_id'] = this.transactonId;
    data['total_order_item'] = this.totalOrderItem;
    data['tip_total'] = this.tipTotal;
    data['user_mobile_no'] = this.userMobileNo;
    data['username'] = this.username;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class TaxTypes {
  int? gST;
  double? amount;
  double? qST;

  TaxTypes({this.gST, this.amount, this.qST});

  TaxTypes.fromJson(Map<String, dynamic> json) {
    gST = json['GST'];
    amount = json['Amount'];
    qST = json['QST'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['GST'] = this.gST;
    data['Amount'] = this.amount;
    data['QST'] = this.qST;
    return data;
  }
}

class Chefs {
  int? id;
  String? isHfcPaid;
  String? isRccPaid;
  String? firstName;
  String? lastName;
  String? dateOfBirth;
  String? type;
  String? subType;
  String? addressLine1;
  String? addressLine2;
  String? state;
  String? city;
  String? postalCode;
  String? latitude;
  String? longitude;
  String? mobile;
  Null? profilePic;
  int? isMobileVerified;
  String? email;
  int? isEmailVerified;
  Null? emailVerifiedAt;
  String? isPersonalDetailComplete;
  String? addressProof;
  String? addressProofPath;
  String? idProof1;
  String? idProofPath1;
  String? idProof2;
  String? idProofPath2;
  Null? areYouA;
  Null? areYouAFilePath;
  Null? twitterLink;
  Null? facebookLink;
  Null? tiktokLink;
  String? kitchenName;
  String? chefBannerImage;
  String? chefCardImage;
  List<String>? kitchenTypes;
  Null? otherKitchenTypes;
  String? aboutKitchen;
  String? gstNo;
  String? qstNo;
  String? gstImage;
  String? qstImage;
  Null? bankName;
  Null? transitNumber;
  Null? accountNumber;
  Null? institutionNumber;
  String? rating;
  int? newToCanada;
  int? status;
  int? chefAvailibilityStatus;
  List<String>? chefAvailibilityWeek;
  String? chefAvailibilityFromTime;
  String? chefAvailibilityToTime;
  Null? blacklistedUser;
  Null? resetToken;
  int? profilePercenatge;
  Null? story;
  Null? storyImg;
  int? isKitchenDetailCompleted;
  int? isSocialDetailCompleted;
  int? isBankDetailCompleted;
  int? isRrcCertificateDocumentCompleted;
  int? isFhcDocumentCompleted;
  int? isDocumentDetailsCompleted;
  int? isSpecialBenefitDocumentCompleted;
  int? isPersonalDetailsCompleted;
  int? isTaxDocumentCompleted;
  Null? deletedAt;
  String? createdAt;
  String? updatedAt;

  Chefs(
      {this.id,
        this.isHfcPaid,
        this.isRccPaid,
        this.firstName,
        this.lastName,
        this.dateOfBirth,
        this.type,
        this.subType,
        this.addressLine1,
        this.addressLine2,
        this.state,
        this.city,
        this.postalCode,
        this.latitude,
        this.longitude,
        this.mobile,
        this.profilePic,
        this.isMobileVerified,
        this.email,
        this.isEmailVerified,
        this.emailVerifiedAt,
        this.isPersonalDetailComplete,
        this.addressProof,
        this.addressProofPath,
        this.idProof1,
        this.idProofPath1,
        this.idProof2,
        this.idProofPath2,
        this.areYouA,
        this.areYouAFilePath,
        this.twitterLink,
        this.facebookLink,
        this.tiktokLink,
        this.kitchenName,
        this.chefBannerImage,
        this.chefCardImage,
        this.kitchenTypes,
        this.otherKitchenTypes,
        this.aboutKitchen,
        this.gstNo,
        this.qstNo,
        this.gstImage,
        this.qstImage,
        this.bankName,
        this.transitNumber,
        this.accountNumber,
        this.institutionNumber,
        this.rating,
        this.newToCanada,
        this.status,
        this.chefAvailibilityStatus,
        this.chefAvailibilityWeek,
        this.chefAvailibilityFromTime,
        this.chefAvailibilityToTime,
        this.blacklistedUser,
        this.resetToken,
        this.profilePercenatge,
        this.story,
        this.storyImg,
        this.isKitchenDetailCompleted,
        this.isSocialDetailCompleted,
        this.isBankDetailCompleted,
        this.isRrcCertificateDocumentCompleted,
        this.isFhcDocumentCompleted,
        this.isDocumentDetailsCompleted,
        this.isSpecialBenefitDocumentCompleted,
        this.isPersonalDetailsCompleted,
        this.isTaxDocumentCompleted,
        this.deletedAt,
        this.createdAt,
        this.updatedAt});

  Chefs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isHfcPaid = json['is_hfc_paid'];
    isRccPaid = json['is_rcc_paid'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    dateOfBirth = json['date_of_birth'];
    type = json['type'];
    subType = json['sub_type'];
    addressLine1 = json['address_line1'];
    addressLine2 = json['address_line2'];
    state = json['state'];
    city = json['city'];
    postalCode = json['postal_code'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    mobile = json['mobile'];
    profilePic = json['profile_pic'];
    isMobileVerified = json['is_mobile_verified'];
    email = json['email'];
    isEmailVerified = json['is_email_verified'];
    emailVerifiedAt = json['email_verified_at'];
    isPersonalDetailComplete = json['is_personal_detail_complete'];
    addressProof = json['address_proof'];
    addressProofPath = json['address_proof_path'];
    idProof1 = json['id_proof_1'];
    idProofPath1 = json['id_proof_path1'];
    idProof2 = json['id_proof_2'];
    idProofPath2 = json['id_proof_path2'];
    areYouA = json['are_you_a'];
    areYouAFilePath = json['are_you_a_file_path'];
    twitterLink = json['twitter_link'];
    facebookLink = json['facebook_link'];
    tiktokLink = json['tiktok_link'];
    kitchenName = json['kitchen_name'];
    chefBannerImage = json['chef_banner_image'];
    chefCardImage = json['chef_card_image'];
    kitchenTypes = json['kitchen_types'].cast<String>();
    otherKitchenTypes = json['other_kitchen_types'];
    aboutKitchen = json['about_kitchen'];
    gstNo = json['gst_no'];
    qstNo = json['qst_no'];
    gstImage = json['gst_image'];
    qstImage = json['qst_image'];
    bankName = json['bank_name'];
    transitNumber = json['transit_number'];
    accountNumber = json['account_number'];
    institutionNumber = json['institution_number'];
    rating = json['rating'];
    newToCanada = json['new_to_canada'];
    status = json['status'];
    chefAvailibilityStatus = json['chefAvailibilityStatus'];
    chefAvailibilityWeek = json['chefAvailibilityWeek'].cast<String>();
    chefAvailibilityFromTime = json['chefAvailibilityFromTime'];
    chefAvailibilityToTime = json['chefAvailibilityToTime'];
    blacklistedUser = json['blacklistedUser'];
    resetToken = json['resetToken'];
    profilePercenatge = json['profilePercenatge'];
    story = json['story'];
    storyImg = json['story_img'];
    isKitchenDetailCompleted = json['is_kitchen_detail_completed'];
    isSocialDetailCompleted = json['is_social_detail_completed'];
    isBankDetailCompleted = json['is_bank_detail_completed'];
    isRrcCertificateDocumentCompleted =
    json['is_rrc_certificate_document_completed'];
    isFhcDocumentCompleted = json['is_fhc_document_completed'];
    isDocumentDetailsCompleted = json['is_document_details_completed'];
    isSpecialBenefitDocumentCompleted =
    json['is_special_benefit_document_completed'];
    isPersonalDetailsCompleted = json['is_personal_details_completed'];
    isTaxDocumentCompleted = json['is_tax_document_completed'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['is_hfc_paid'] = this.isHfcPaid;
    data['is_rcc_paid'] = this.isRccPaid;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['date_of_birth'] = this.dateOfBirth;
    data['type'] = this.type;
    data['sub_type'] = this.subType;
    data['address_line1'] = this.addressLine1;
    data['address_line2'] = this.addressLine2;
    data['state'] = this.state;
    data['city'] = this.city;
    data['postal_code'] = this.postalCode;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['mobile'] = this.mobile;
    data['profile_pic'] = this.profilePic;
    data['is_mobile_verified'] = this.isMobileVerified;
    data['email'] = this.email;
    data['is_email_verified'] = this.isEmailVerified;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['is_personal_detail_complete'] = this.isPersonalDetailComplete;
    data['address_proof'] = this.addressProof;
    data['address_proof_path'] = this.addressProofPath;
    data['id_proof_1'] = this.idProof1;
    data['id_proof_path1'] = this.idProofPath1;
    data['id_proof_2'] = this.idProof2;
    data['id_proof_path2'] = this.idProofPath2;
    data['are_you_a'] = this.areYouA;
    data['are_you_a_file_path'] = this.areYouAFilePath;
    data['twitter_link'] = this.twitterLink;
    data['facebook_link'] = this.facebookLink;
    data['tiktok_link'] = this.tiktokLink;
    data['kitchen_name'] = this.kitchenName;
    data['chef_banner_image'] = this.chefBannerImage;
    data['chef_card_image'] = this.chefCardImage;
    data['kitchen_types'] = this.kitchenTypes;
    data['other_kitchen_types'] = this.otherKitchenTypes;
    data['about_kitchen'] = this.aboutKitchen;
    data['gst_no'] = this.gstNo;
    data['qst_no'] = this.qstNo;
    data['gst_image'] = this.gstImage;
    data['qst_image'] = this.qstImage;
    data['bank_name'] = this.bankName;
    data['transit_number'] = this.transitNumber;
    data['account_number'] = this.accountNumber;
    data['institution_number'] = this.institutionNumber;
    data['rating'] = this.rating;
    data['new_to_canada'] = this.newToCanada;
    data['status'] = this.status;
    data['chefAvailibilityStatus'] = this.chefAvailibilityStatus;
    data['chefAvailibilityWeek'] = this.chefAvailibilityWeek;
    data['chefAvailibilityFromTime'] = this.chefAvailibilityFromTime;
    data['chefAvailibilityToTime'] = this.chefAvailibilityToTime;
    data['blacklistedUser'] = this.blacklistedUser;
    data['resetToken'] = this.resetToken;
    data['profilePercenatge'] = this.profilePercenatge;
    data['story'] = this.story;
    data['story_img'] = this.storyImg;
    data['is_kitchen_detail_completed'] = this.isKitchenDetailCompleted;
    data['is_social_detail_completed'] = this.isSocialDetailCompleted;
    data['is_bank_detail_completed'] = this.isBankDetailCompleted;
    data['is_rrc_certificate_document_completed'] =
        this.isRrcCertificateDocumentCompleted;
    data['is_fhc_document_completed'] = this.isFhcDocumentCompleted;
    data['is_document_details_completed'] = this.isDocumentDetailsCompleted;
    data['is_special_benefit_document_completed'] =
        this.isSpecialBenefitDocumentCompleted;
    data['is_personal_details_completed'] = this.isPersonalDetailsCompleted;
    data['is_tax_document_completed'] = this.isTaxDocumentCompleted;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class OrderItems {
  int? id;
  String? subOrderId;
  int? foodId;
  String? quantity;
  String? price;
  String? total;
  Null? deletedAt;
  String? createdAt;
  Null? updatedAt;

  OrderItems(
      {this.id,
        this.subOrderId,
        this.foodId,
        this.quantity,
        this.price,
        this.total,
        this.deletedAt,
        this.createdAt,
        this.updatedAt});

  OrderItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    subOrderId = json['sub_order_id'];
    foodId = json['food_id'];
    quantity = json['quantity'];
    price = json['price'];
    total = json['total'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['sub_order_id'] = this.subOrderId;
    data['food_id'] = this.foodId;
    data['quantity'] = this.quantity;
    data['price'] = this.price;
    data['total'] = this.total;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class OrderTrack {
  int? id;
  String? trackId;
  String? trackDesc;
  String? status;
  Null? deletedAt;
  String? createdAt;
  String? updatedAt;

  OrderTrack(
      {this.id,
        this.trackId,
        this.trackDesc,
        this.status,
        this.deletedAt,
        this.createdAt,
        this.updatedAt});

  OrderTrack.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    trackId = json['track_id'];
    trackDesc = json['track_desc'];
    status = json['status'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['track_id'] = this.trackId;
    data['track_desc'] = this.trackDesc;
    data['status'] = this.status;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
