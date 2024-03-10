class UserAddressBookResponse {
  int? statusCode;
  String? status;
  String? message;
  List<UserAddressBookData>? data;

  UserAddressBookResponse(
      {this.statusCode, this.status, this.message, this.data});

  UserAddressBookResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <UserAddressBookData>[];
      json['data'].forEach((v) {
        data!.add(UserAddressBookData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['statusCode'] = statusCode;
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UserAddressBookData {
  int? id;
  int? customerId;
  String? addressType;
  String? firstName;
  String? lastName;
  String? phone;
  int? stateId;
  int? districtId;
  int? subDistrictId;
  String? address;
  bool? isPrimary;
  bool? status;
  String? createdAt;
  String? updatedAt;
  UserAddressBookState? state;
  UserAddressBookDistrict? district;
  UserAddressBookSubDistrict? subDistrict;

  UserAddressBookData(
      {this.id,
        this.customerId,
        this.addressType,
        this.firstName,
        this.lastName,
        this.phone,
        this.stateId,
        this.districtId,
        this.subDistrictId,
        this.address,
        this.isPrimary,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.state,
        this.district,
        this.subDistrict});

  UserAddressBookData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerId = json['customer_id'];
    addressType = json['address_type'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    phone = json['phone'];
    stateId = json['state_id'];
    districtId = json['district_id'];
    subDistrictId = json['sub_district_id'];
    address = json['address'];
    isPrimary = json['is_primary'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    state = json['state'] != null ? UserAddressBookState.fromJson(json['state']) : null;
    district = json['district'] != null
        ? UserAddressBookDistrict.fromJson(json['district'])
        : null;
    subDistrict = json['sub_district'] != null
        ? UserAddressBookSubDistrict.fromJson(json['sub_district'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['customer_id'] = customerId;
    data['address_type'] = addressType;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['phone'] = phone;
    data['state_id'] = stateId;
    data['district_id'] = districtId;
    data['sub_district_id'] = subDistrictId;
    data['address'] = address;
    data['is_primary'] = isPrimary;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (state != null) {
      data['state'] = state!.toJson();
    }
    if (district != null) {
      data['district'] = district!.toJson();
    }
    if (subDistrict != null) {
      data['sub_district'] = subDistrict!.toJson();
    }
    return data;
  }
}

class UserAddressBookState {
  int? id;
  String? name;
  bool? status;
  String? createdAt;
  String? updatedAt;

  UserAddressBookState({this.id, this.name, this.status, this.createdAt, this.updatedAt});

  UserAddressBookState.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class UserAddressBookDistrict {
  int? id;
  int? stateId;
  String? name;
  bool? status;
  String? createdAt;
  String? updatedAt;

  UserAddressBookDistrict(
      {this.id,
        this.stateId,
        this.name,
        this.status,
        this.createdAt,
        this.updatedAt});

  UserAddressBookDistrict.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    stateId = json['state_id'];
    name = json['name'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['state_id'] = stateId;
    data['name'] = name;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class UserAddressBookSubDistrict {
  int? id;
  int? districtId;
  String? name;
  bool? status;
  String? createdAt;
  String? updatedAt;

  UserAddressBookSubDistrict(
      {this.id,
        this.districtId,
        this.name,
        this.status,
        this.createdAt,
        this.updatedAt});

  UserAddressBookSubDistrict.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    districtId = json['district_id'];
    name = json['name'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['district_id'] = districtId;
    data['name'] = name;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
