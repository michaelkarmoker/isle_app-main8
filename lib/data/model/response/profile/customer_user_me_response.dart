class CustomerUserMeResponse {
  int? statusCode;
  String? status;
  String? message;
  Data? data;

  CustomerUserMeResponse(
      {this.statusCode, this.status, this.message, this.data});

  CustomerUserMeResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? firstName;
  String? lastName;
  bool? isGuest;
  String? phone;
  String? email;
  String? gender;
  String? dateOfBirth;
  String? stateId;
  String? districtId;
  String? subDistrictId;
  String? address;
  String? otp;
  String? otpVerified;
  String? emailVerified;
  String? emailVerifiedAt;
  String? photo;
  int? membershipTierId;
  bool? currentTierFirstOrder;
  int? point;
  int? usePoint;
  bool? status;
  bool? isEmail;
  bool? isSms;
  String? createdAt;
  String? updatedAt;
  MembershipTier? membershipTier;

  Data(
      {this.id,
        this.firstName,
        this.lastName,
        this.isGuest,
        this.phone,
        this.email,
        this.gender,
        this.dateOfBirth,
        this.stateId,
        this.districtId,
        this.subDistrictId,
        this.address,
        this.otp,
        this.otpVerified,
        this.emailVerified,
        this.emailVerifiedAt,
        this.photo,
        this.membershipTierId,
        this.currentTierFirstOrder,
        this.point,
        this.usePoint,
        this.status,
        this.isEmail,
        this.isSms,
        this.createdAt,
        this.updatedAt,
        this.membershipTier});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    isGuest = json['is_guest'];
    phone = json['phone'];
    email = json['email'];
    gender = json['gender'];
    dateOfBirth = json['date_of_birth'];
    stateId = json['state_id'];
    districtId = json['district_id'];
    subDistrictId = json['sub_district_id'];
    address = json['address'];
    otp = json['otp'];
    otpVerified = json['otp_verified'];
    emailVerified = json['email_verified'];
    emailVerifiedAt = json['email_verified_at'];
    photo = json['photo'];
    membershipTierId = json['membership_tier_id'];
    currentTierFirstOrder = json['current_tier_first_order'];
    point = json['point'];
    usePoint = json['use_point'];
    status = json['status'];
    isEmail = json['is_email'];
    isSms = json['is_sms'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    membershipTier = json['membership_tier'] != null
        ? new MembershipTier.fromJson(json['membership_tier'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['is_guest'] = this.isGuest;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['gender'] = this.gender;
    data['date_of_birth'] = this.dateOfBirth;
    data['state_id'] = this.stateId;
    data['district_id'] = this.districtId;
    data['sub_district_id'] = this.subDistrictId;
    data['address'] = this.address;
    data['otp'] = this.otp;
    data['otp_verified'] = this.otpVerified;
    data['email_verified'] = this.emailVerified;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['photo'] = this.photo;
    data['membership_tier_id'] = this.membershipTierId;
    data['current_tier_first_order'] = this.currentTierFirstOrder;
    data['point'] = this.point;
    data['use_point'] = this.usePoint;
    data['status'] = this.status;
    data['is_email'] = this.isEmail;
    data['is_sms'] = this.isSms;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.membershipTier != null) {
      data['membership_tier'] = this.membershipTier!.toJson();
    }
    return data;
  }
}

class MembershipTier {
  int? id;
  String? tiersName;
  bool? isDefault;
  int? upgradePoint;
  int? upgradeAmount;
  int? upgradeTimeLimit;
  String? shortDescription;
  String? colorCode;
  String? image;
  String? createdAt;
  String? updatedAt;
  List<MembershipIsleRewardRules>? membershipIsleRewardRules;

  MembershipTier(
      {this.id,
        this.tiersName,
        this.isDefault,
        this.upgradePoint,
        this.upgradeAmount,
        this.upgradeTimeLimit,
        this.shortDescription,
        this.colorCode,
        this.image,
        this.createdAt,
        this.updatedAt,
        this.membershipIsleRewardRules});

  MembershipTier.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tiersName = json['tiers_name'];
    isDefault = json['is_default'];
    upgradePoint = json['upgrade_point'];
    upgradeAmount = json['upgrade_amount'];
    upgradeTimeLimit = json['upgrade_time_limit'];
    shortDescription = json['short_description'];
    colorCode = json['color_code'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['membership_isle_reward_rules'] != null) {
      membershipIsleRewardRules = <MembershipIsleRewardRules>[];
      json['membership_isle_reward_rules'].forEach((v) {
        membershipIsleRewardRules!
            .add(new MembershipIsleRewardRules.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['tiers_name'] = this.tiersName;
    data['is_default'] = this.isDefault;
    data['upgrade_point'] = this.upgradePoint;
    data['upgrade_amount'] = this.upgradeAmount;
    data['upgrade_time_limit'] = this.upgradeTimeLimit;
    data['short_description'] = this.shortDescription;
    data['color_code'] = this.colorCode;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.membershipIsleRewardRules != null) {
      data['membership_isle_reward_rules'] =
          this.membershipIsleRewardRules!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MembershipIsleRewardRules {
  int? id;
  int? isleRewardRuleId;
  int? membershipTiersId;
  int? rewardPoint;
  int? rewardAmount;
  double? minimumPoint;
  bool? available;
  int? bonusPointMultiplier;
  String? createdAt;
  String? updatedAt;
  IsleRewardRule? isleRewardRule;

  MembershipIsleRewardRules(
      {this.id,
        this.isleRewardRuleId,
        this.membershipTiersId,
        this.rewardPoint,
        this.rewardAmount,
        this.minimumPoint,
        this.available,
        this.bonusPointMultiplier,
        this.createdAt,
        this.updatedAt,
        this.isleRewardRule});

  MembershipIsleRewardRules.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isleRewardRuleId = json['isle_reward_rule_id'];
    membershipTiersId = json['membership_tiers_id'];
    rewardPoint = json['reward_point'];
    rewardAmount = json['reward_amount'];
    minimumPoint = double.parse(json['minimum_point']!=null?json['minimum_point'].toString():"0.0");
    available = json['available'];
    bonusPointMultiplier = json['bonus_point_multiplier'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    isleRewardRule = json['isle_reward_rule'] != null
        ? new IsleRewardRule.fromJson(json['isle_reward_rule'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['isle_reward_rule_id'] = this.isleRewardRuleId;
    data['membership_tiers_id'] = this.membershipTiersId;
    data['reward_point'] = this.rewardPoint;
    data['reward_amount'] = this.rewardAmount;
    data['minimum_point'] = this.minimumPoint;
    data['available'] = this.available;
    data['bonus_point_multiplier'] = this.bonusPointMultiplier;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.isleRewardRule != null) {
      data['isle_reward_rule'] = this.isleRewardRule!.toJson();
    }
    return data;
  }
}

class IsleRewardRule {
  int? id;
  String? placeholder;
  String? rule;
  int? sortOrder;
  String? rewardMessage;
  int? spentAmount;
  int? perRewardPoint;
  double? firstOrderDiscount;
  String? firstOrderDiscountType;
  int? earlyAccessHours;
  double? purchaseAmount;
  double? purchaseDiscount;
  bool? status;
  String? createdAt;
  String? updatedAt;

  IsleRewardRule(
      {this.id,
        this.placeholder,
        this.rule,
        this.sortOrder,
        this.rewardMessage,
        this.spentAmount,
        this.perRewardPoint,
        this.firstOrderDiscount,
        this.firstOrderDiscountType,
        this.earlyAccessHours,
        this.purchaseAmount,
        this.purchaseDiscount,
        this.status,
        this.createdAt,
        this.updatedAt});

  IsleRewardRule.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    placeholder = json['placeholder'];
    rule = json['rule'];
    sortOrder = json['sort_order'];
    rewardMessage = json['reward_message'];
    spentAmount = json['spent_amount'];
    perRewardPoint = json['per_reward_point'];
    firstOrderDiscount = double.parse(json['first_order_discount']!=null?json['first_order_discount'].toString():"0.0");
    firstOrderDiscountType = json['first_order_discount_type'];
    earlyAccessHours = json['early_access_hours'];
    purchaseAmount = double.parse(json['purchase_amount']!=null?json['purchase_amount'].toString():"0.0");
    purchaseDiscount = double.parse(json['purchase_discount']!=null?json['purchase_discount'].toString():"0.0");
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['placeholder'] = this.placeholder;
    data['rule'] = this.rule;
    data['sort_order'] = this.sortOrder;
    data['reward_message'] = this.rewardMessage;
    data['spent_amount'] = this.spentAmount;
    data['per_reward_point'] = this.perRewardPoint;
    data['first_order_discount'] = this.firstOrderDiscount;
    data['first_order_discount_type'] = this.firstOrderDiscountType;
    data['early_access_hours'] = this.earlyAccessHours;
    data['purchase_amount'] = this.purchaseAmount;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
