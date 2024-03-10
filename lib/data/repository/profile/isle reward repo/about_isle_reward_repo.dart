import 'dart:developer';

import 'package:get/get.dart';
import 'package:isletestapp/controller/auth_controller.dart';
import 'package:isletestapp/data/api/api_client.dart';
import 'package:isletestapp/util/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AboutIsleRewardRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  AboutIsleRewardRepo({required this.apiClient, required this.sharedPreferences});

  /// membership tier 2
  Future<Response> getIsleRewardRulesData() async {
    Response _response = await apiClient.getData(AppConstants.ISLE_REWARD_RULES_URI);
    return _response;
  }

  ///
  Future<Response> getIsleRewardSettingsData() async {
    Response _response = await apiClient.getData(AppConstants.ABOUT_ISLE_REWARD_SETTINGS_URI);
    return _response;
  }

  /// how it work
  Future<Response> getHowitWorkData() async {
    Response _response = await apiClient.getData(AppConstants.HOW_IT_WORK_URI,);
    return _response;
  }

  /// membership tier
  Future<Response> getMembershiptierData() async {
    Response _response = await apiClient.getData(AppConstants.MEMBERSHIP_TIER_URI,);
    return _response;
  }

  // Future<Response> getMembershiptierData() async {
  //   Response response = await apiClient.getData(AppConstants.MEMBERSHIP_TIER_URI);
  //
  //   log("Calculator: $response");
  //   log("Calculator: ${response.runtimeType}");
  //   log('====/@ Query Api 1: ${response.request?.url ?? ''}');
  //
  //   return response;
  // }

  /// membership benefit
  Future<Response> getAboutIsleMembershipBenefitData() async {
    Response _response = await apiClient.getData(AppConstants.ABOUT_ISLE_MEMBERSHIP_BENEFIT_URI,);
    return _response;
  }

  // Future<List<AboutIsleMembershipBenefitData>> getAboutIsleMembershipBenefitData() async{
  //
  // }

  /// redeem points
  Future<Response> getRedeemPointsData() async {
    Response _response = await apiClient.getData(AppConstants.ABOUT_ISLE_REDEEM_POINTS_URI,);
    return _response;
  }

  /// exclusive offer
  Future<Response> getExclusiveOfferData() async {
    Response _response = await apiClient.getData(AppConstants.EXCLUSIVE_OFFER_URI,);
    return _response;
  }

  /// member tearms conditions
  Future<Response> getMemberTermsConditionsData() async {
    Response _response = await apiClient.getData(AppConstants.MEMBER_TERMS_CONDITIONS_URI,);
    return _response;
  }








}