import 'package:get/get.dart';
import 'package:isletestapp/data/api/api_checker.dart';
import 'package:isletestapp/data/model/response/profile/customer_user_me_response.dart';
import 'package:isletestapp/data/model/response/profile/my%20reward/my_offer_response.dart';
import 'package:isletestapp/data/model/response/profile/my%20reward/redeem_reward_response.dart';
import 'package:isletestapp/data/model/response/profile/my%20reward/reward_history_response.dart';
import 'package:isletestapp/data/repository/profile/my%20reward%20repo/my_reward_repo.dart';

class MyRewardController extends GetxController implements GetxService {
  final MyRewardRepo myRewardRepo;
  MyRewardController({required this.myRewardRepo});


  bool _isLoading = false;
  bool get isLoading => _isLoading;

  RewardHistoryResponse ? rewardHistoryResponse =null;
  ReedeemHistoryResponse ? reedeemHistoryResponse =null;
  CustomerUserMeResponse ? customerUserMeResponse =null;
  MyOfferResponse ? myOfferResponse =null;

  Future<void> dataInitialize()async {
    await getRewarddData();
    await getCustomerUserMeData();
    await getRedeemRewardData();
    await getOfferData();
  }

  ///
  Future<void> getCustomerUserMeData() async {
    _isLoading = true;
    update();
    Response response = await myRewardRepo.getCustomerUserMeData();
    if (response.statusCode == 200) {
      customerUserMeResponse= CustomerUserMeResponse.fromJson(response.body);
    } else {
      ApiChecker.checkApi(response);
      // showCustomSnackBar(response.statusCode!.toString());
    }
    _isLoading = false;
    update();
  }

  /// my reward
  Future<void> getRewarddData() async {
    try {
      _isLoading = true;
      update();
      Response response = await myRewardRepo.getRewarddData();
      if (response.statusCode == 200) {
        rewardHistoryResponse = RewardHistoryResponse.fromJson(response.body);
      } else {
        ApiChecker.checkApi(response);
        // showCustomSnackBar(response.statusCode!.toString());
      }
    } catch (error) {
      // Handle the error here
      print('Error fetching data: $error');
      // You can choose to show a custom snackbar or handle the error in some other way
    } finally {
      _isLoading = false;
      update();
    }
  }


  /// redeem reward
  Future<void> getRedeemRewardData() async {
    try {
      _isLoading = true;
      update();
      Response response = await myRewardRepo.getRedeemRewardData();
      if (response.statusCode == 200) {
        reedeemHistoryResponse = ReedeemHistoryResponse.fromJson(response.body);
      } else {
        ApiChecker.checkApi(response);
        // showCustomSnackBar(response.statusCode!.toString());
      }
    } catch (error) {
      // Handle the error here
      print('Error fetching data: $error');
      // You can choose to show a custom snackbar or handle the error in some other way
    } finally {
      _isLoading = false;
      update();
    }
  }

  /// my offers
  Future<void> getOfferData() async {
    _isLoading = true;
    update();
    Response response = await myRewardRepo.getOfferData();
    if (response.statusCode == 200) {
      myOfferResponse= MyOfferResponse.fromJson(response.body);
    } else {
      ApiChecker.checkApi(response);
      // showCustomSnackBar(response.statusCode!.toString());
    }
    _isLoading = false;
    update();
  }







}
