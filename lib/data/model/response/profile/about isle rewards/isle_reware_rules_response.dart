/// statusCode : 200
/// status : "success"
/// message : "membership tiers get successfully"
/// data : [{"id":2,"tiers_name":"EXPLORER","is_default":true,"upgrade_point":50000,"upgrade_amount":0,"upgrade_time_limit":365,"short_description":"EXPLORER is the first tier of ISLE Rewards programme, bringing you incredible rewards & bonuses at any purchase","color_code":"#9b908c","image":"/public/uploads/isle-reward-point-stickers-v2-04-MqV2IfgVE.png","created_at":"2023-12-30T06:25:48.000Z","updated_at":"2024-02-07T10:17:46.000Z","membership_isle_reward_rules":[{"id":149,"isle_reward_rule_id":1,"membership_tiers_id":2,"reward_point":1,"reward_amount":null,"minimum_point":null,"available":null,"bonus_point_multiplier":null,"createdAt":"2024-01-16T03:21:56.000Z","updatedAt":"2024-01-16T03:21:56.000Z","isle_reward_rule":{"id":1,"placeholder":"Earn Reward Points for Every Purchase (100tk = 1 point)","rule":"reward_point_per_spent","sort_order":1,"reward_message":"","spent_amount":100,"per_reward_point":null,"first_order_discount":null,"first_order_discount_type":"percent","early_access_hours":null,"purchase_amount":null,"status":true,"createdAt":"2024-01-02T10:33:42.000Z","updatedAt":"2024-02-06T14:02:33.000Z"}}]},{"id":3,"tiers_name":"TREND SETTER","is_default":false,"upgrade_point":25000,"upgrade_amount":0,"upgrade_time_limit":365,"short_description":"Spend 25000tk in a year and you’ll upgrade to TREND SETTER with access to even more benefits","color_code":"#74899e","image":"/public/uploads/isle-reward-point-card-02-LhvCdLfS3.png","created_at":"2023-12-30T06:29:03.000Z","updated_at":"2024-01-29T07:08:58.000Z","membership_isle_reward_rules":[{"id":150,"isle_reward_rule_id":1,"membership_tiers_id":3,"reward_point":2,"reward_amount":null,"minimum_point":null,"available":null,"bonus_point_multiplier":null,"createdAt":"2024-01-16T03:21:56.000Z","updatedAt":"2024-01-16T03:21:56.000Z","isle_reward_rule":{"id":1,"placeholder":"Earn Reward Points for Every Purchase (100tk = 1 point)","rule":"reward_point_per_spent","sort_order":1,"reward_message":"","spent_amount":100,"per_reward_point":null,"first_order_discount":null,"first_order_discount_type":"percent","early_access_hours":null,"purchase_amount":null,"status":true,"createdAt":"2024-01-02T10:33:42.000Z","updatedAt":"2024-02-06T14:02:33.000Z"}}]},{"id":4,"tiers_name":"STYLE MUSE","is_default":false,"upgrade_point":75000,"upgrade_amount":0,"upgrade_time_limit":365,"short_description":"Shop over 75000 tk in 12 months & you’ll be upgrade to STYLE MUSE. This tier offers your increased privileges along with style muse tier.","color_code":"#28524e","image":"/public/uploads/isle-reward-point-card-03-g0i2nJi4a.png","created_at":"2023-12-30T06:30:05.000Z","updated_at":"2024-01-29T07:09:22.000Z","membership_isle_reward_rules":[{"id":151,"isle_reward_rule_id":1,"membership_tiers_id":4,"reward_point":3,"reward_amount":null,"minimum_point":null,"available":null,"bonus_point_multiplier":null,"createdAt":"2024-01-16T03:21:56.000Z","updatedAt":"2024-01-16T03:21:56.000Z","isle_reward_rule":{"id":1,"placeholder":"Earn Reward Points for Every Purchase (100tk = 1 point)","rule":"reward_point_per_spent","sort_order":1,"reward_message":"","spent_amount":100,"per_reward_point":null,"first_order_discount":null,"first_order_discount_type":"percent","early_access_hours":null,"purchase_amount":null,"status":true,"createdAt":"2024-01-02T10:33:42.000Z","updatedAt":"2024-02-06T14:02:33.000Z"}}]},{"id":5,"tiers_name":"STYLE ICON","is_default":false,"upgrade_point":150000,"upgrade_amount":0,"upgrade_time_limit":365,"short_description":"Spend over 150000 tk in a year and you’ll upgrade a prestigious STYLE ICON tier, this tier offers added benefits & further rewards when buy your loving products","color_code":"#151515","image":"/public/uploads/isle-reward-point-card-04-NhKN15olc.png","created_at":"2023-12-30T06:32:28.000Z","updated_at":"2024-01-29T07:09:38.000Z","membership_isle_reward_rules":[{"id":152,"isle_reward_rule_id":1,"membership_tiers_id":5,"reward_point":4,"reward_amount":null,"minimum_point":null,"available":null,"bonus_point_multiplier":null,"createdAt":"2024-01-16T03:21:56.000Z","updatedAt":"2024-01-16T03:21:56.000Z","isle_reward_rule":{"id":1,"placeholder":"Earn Reward Points for Every Purchase (100tk = 1 point)","rule":"reward_point_per_spent","sort_order":1,"reward_message":"","spent_amount":100,"per_reward_point":null,"first_order_discount":null,"first_order_discount_type":"percent","early_access_hours":null,"purchase_amount":null,"status":true,"createdAt":"2024-01-02T10:33:42.000Z","updatedAt":"2024-02-06T14:02:33.000Z"}}]}]

class IsleRewareRulesResponse {
  IsleRewareRulesResponse({
      this.statusCode, 
      this.status, 
      this.message, 
      this.data,});

  IsleRewareRulesResponse.fromJson(dynamic json) {
    statusCode = json['statusCode'];
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }
  num? statusCode;
  String? status;
  String? message;
  List<Data>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['statusCode'] = statusCode;
    map['status'] = status;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 2
/// tiers_name : "EXPLORER"
/// is_default : true
/// upgrade_point : 50000
/// upgrade_amount : 0
/// upgrade_time_limit : 365
/// short_description : "EXPLORER is the first tier of ISLE Rewards programme, bringing you incredible rewards & bonuses at any purchase"
/// color_code : "#9b908c"
/// image : "/public/uploads/isle-reward-point-stickers-v2-04-MqV2IfgVE.png"
/// created_at : "2023-12-30T06:25:48.000Z"
/// updated_at : "2024-02-07T10:17:46.000Z"
/// membership_isle_reward_rules : [{"id":149,"isle_reward_rule_id":1,"membership_tiers_id":2,"reward_point":1,"reward_amount":null,"minimum_point":null,"available":null,"bonus_point_multiplier":null,"createdAt":"2024-01-16T03:21:56.000Z","updatedAt":"2024-01-16T03:21:56.000Z","isle_reward_rule":{"id":1,"placeholder":"Earn Reward Points for Every Purchase (100tk = 1 point)","rule":"reward_point_per_spent","sort_order":1,"reward_message":"","spent_amount":100,"per_reward_point":null,"first_order_discount":null,"first_order_discount_type":"percent","early_access_hours":null,"purchase_amount":null,"status":true,"createdAt":"2024-01-02T10:33:42.000Z","updatedAt":"2024-02-06T14:02:33.000Z"}}]

class Data {
  Data({
      this.id, 
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
      this.membershipIsleRewardRules,});

  Data.fromJson(dynamic json) {
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
      membershipIsleRewardRules = [];
      json['membership_isle_reward_rules'].forEach((v) {
        membershipIsleRewardRules?.add(MembershipIsleRewardRules.fromJson(v));
      });
    }
  }
  num? id;
  String? tiersName;
  bool? isDefault;
  num? upgradePoint;
  num? upgradeAmount;
  num? upgradeTimeLimit;
  String? shortDescription;
  String? colorCode;
  String? image;
  String? createdAt;
  String? updatedAt;
  List<MembershipIsleRewardRules>? membershipIsleRewardRules;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['tiers_name'] = tiersName;
    map['is_default'] = isDefault;
    map['upgrade_point'] = upgradePoint;
    map['upgrade_amount'] = upgradeAmount;
    map['upgrade_time_limit'] = upgradeTimeLimit;
    map['short_description'] = shortDescription;
    map['color_code'] = colorCode;
    map['image'] = image;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    if (membershipIsleRewardRules != null) {
      map['membership_isle_reward_rules'] = membershipIsleRewardRules?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 149
/// isle_reward_rule_id : 1
/// membership_tiers_id : 2
/// reward_point : 1
/// reward_amount : null
/// minimum_point : null
/// available : null
/// bonus_point_multiplier : null
/// createdAt : "2024-01-16T03:21:56.000Z"
/// updatedAt : "2024-01-16T03:21:56.000Z"
/// isle_reward_rule : {"id":1,"placeholder":"Earn Reward Points for Every Purchase (100tk = 1 point)","rule":"reward_point_per_spent","sort_order":1,"reward_message":"","spent_amount":100,"per_reward_point":null,"first_order_discount":null,"first_order_discount_type":"percent","early_access_hours":null,"purchase_amount":null,"status":true,"createdAt":"2024-01-02T10:33:42.000Z","updatedAt":"2024-02-06T14:02:33.000Z"}

class MembershipIsleRewardRules {
  MembershipIsleRewardRules({
      this.id, 
      this.isleRewardRuleId, 
      this.membershipTiersId, 
      this.rewardPoint, 
      this.rewardAmount, 
      this.minimumPoint, 
      this.available, 
      this.bonusPointMultiplier, 
      this.createdAt, 
      this.updatedAt, 
      this.isleRewardRule,});

  MembershipIsleRewardRules.fromJson(dynamic json) {
    id = json['id'];
    isleRewardRuleId = json['isle_reward_rule_id'];
    membershipTiersId = json['membership_tiers_id'];
    rewardPoint = json['reward_point'];
    rewardAmount = json['reward_amount'];
    minimumPoint = json['minimum_point'];
    available = json['available'];
    bonusPointMultiplier = json['bonus_point_multiplier'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    isleRewardRule = json['isle_reward_rule'] != null ? IsleRewardRule.fromJson(json['isle_reward_rule']) : null;
  }
  num? id;
  num? isleRewardRuleId;
  num? membershipTiersId;
  num? rewardPoint;
  dynamic rewardAmount;
  dynamic minimumPoint;
  dynamic available;
  dynamic bonusPointMultiplier;
  String? createdAt;
  String? updatedAt;
  IsleRewardRule? isleRewardRule;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['isle_reward_rule_id'] = isleRewardRuleId;
    map['membership_tiers_id'] = membershipTiersId;
    map['reward_point'] = rewardPoint;
    map['reward_amount'] = rewardAmount;
    map['minimum_point'] = minimumPoint;
    map['available'] = available;
    map['bonus_point_multiplier'] = bonusPointMultiplier;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    if (isleRewardRule != null) {
      map['isle_reward_rule'] = isleRewardRule?.toJson();
    }
    return map;
  }

}

/// id : 1
/// placeholder : "Earn Reward Points for Every Purchase (100tk = 1 point)"
/// rule : "reward_point_per_spent"
/// sort_order : 1
/// reward_message : ""
/// spent_amount : 100
/// per_reward_point : null
/// first_order_discount : null
/// first_order_discount_type : "percent"
/// early_access_hours : null
/// purchase_amount : null
/// status : true
/// createdAt : "2024-01-02T10:33:42.000Z"
/// updatedAt : "2024-02-06T14:02:33.000Z"

class IsleRewardRule {
  IsleRewardRule({
      this.id, 
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
      this.status, 
      this.createdAt, 
      this.updatedAt,});

  IsleRewardRule.fromJson(dynamic json) {
    id = json['id'];
    placeholder = json['placeholder'];
    rule = json['rule'];
    sortOrder = json['sort_order'];
    rewardMessage = json['reward_message'];
    spentAmount = json['spent_amount'];
    perRewardPoint = json['per_reward_point'];
    firstOrderDiscount = json['first_order_discount'];
    firstOrderDiscountType = json['first_order_discount_type'];
    earlyAccessHours = json['early_access_hours'];
    purchaseAmount = json['purchase_amount'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
  num? id;
  String? placeholder;
  String? rule;
  num? sortOrder;
  String? rewardMessage;
  num? spentAmount;
  dynamic perRewardPoint;
  dynamic firstOrderDiscount;
  String? firstOrderDiscountType;
  dynamic earlyAccessHours;
  dynamic purchaseAmount;
  bool? status;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['placeholder'] = placeholder;
    map['rule'] = rule;
    map['sort_order'] = sortOrder;
    map['reward_message'] = rewardMessage;
    map['spent_amount'] = spentAmount;
    map['per_reward_point'] = perRewardPoint;
    map['first_order_discount'] = firstOrderDiscount;
    map['first_order_discount_type'] = firstOrderDiscountType;
    map['early_access_hours'] = earlyAccessHours;
    map['purchase_amount'] = purchaseAmount;
    map['status'] = status;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    return map;
  }

}