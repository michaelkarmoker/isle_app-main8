import 'package:get/get.dart';
import 'package:isletestapp/controller/auth_controller.dart';
import 'package:isletestapp/data/api/api_client.dart';
import 'package:isletestapp/util/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrdersReturnsRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  OrdersReturnsRepo({required this.apiClient, required this.sharedPreferences});

/*  /// orders returns
  Future<Response> getOrdersReturnData() async {
    Response _response = await apiClient.getData(AppConstants.ORDERS_RETURNS_URI);
    return _response;
  }*/


  /// orders returns
  Future<Response> getRecentOrdersReturnData() async {
    String deviceID = await Get.find<AuthController>().getDeviceID();
    String customerID = await Get.find<AuthController>().isLoggedIn()? await Get.find<AuthController>().getUserId() : ''  ;
    // String guestID = await Get.find<AuthController>().isLoggedInGuest()? await Get.find<AuthController>().getUserIdGuest() : "";
/*    String status = "recent";*/
    print(deviceID);
    Response _response = await apiClient.getData(AppConstants.ORDERS_RETURNS_URI,query: {"corelation_id":deviceID, "customer_id": customerID,
      // "status": status
    });
    return _response;
  }


  /// pending returns
  Future<Response> getPendingOrdersReturnData() async {
    String deviceID = await Get.find<AuthController>().getDeviceID();
    String customerID = await Get.find<AuthController>().isLoggedIn()? await Get.find<AuthController>().getUserId() : ''  ;
    String status = "pending";
    print(deviceID);
    Response _response = await apiClient.getData(AppConstants.ORDERS_RETURNS_URI,query: {"corelation_id":deviceID, "customer_id": customerID, "status": status
    });
    return _response;
  }


  /// confirm returns
  Future<Response> getConfirmOrdersReturnData() async {
    String deviceID = await Get.find<AuthController>().getDeviceID();
    String customerID = await Get.find<AuthController>().isLoggedIn()? await Get.find<AuthController>().getUserId() : ''  ;
    String status = "completed";
    print(deviceID);
    Response _response = await apiClient.getData(AppConstants.ORDERS_RETURNS_URI,query: {"corelation_id":deviceID, "customer_id": customerID, "status": status
    });
    return _response;
  }



  /// reject returns
  Future<Response> getRejectOrdersReturnData() async {
    String deviceID = await Get.find<AuthController>().getDeviceID();
    String customerID = await Get.find<AuthController>().isLoggedIn()? await Get.find<AuthController>().getUserId() : ''  ;
    String status = "rejected";
    print(deviceID);
    Response _response = await apiClient.getData(AppConstants.ORDERS_RETURNS_URI,query: {"corelation_id":deviceID, "customer_id": customerID, "status": status
    });
    return _response;
  }


  /// orders returns details
  Future<Response> getRecentOrdersReturnDetailsData(String id) async {
    String deviceID = await Get.find<AuthController>().getDeviceID();
/*    String status = "recent";*/
    print(deviceID);
    Response _response = await apiClient.getData(AppConstants.ORDERS_RETURNS_DETAILS_TRACK_URI+"/$id",);
    return _response;
  }

  /// top bottom photo
  Future<Response> getInvoiceTopBottomImageData() async {
    Response _response = await apiClient.getData(AppConstants.ORDERS_RETURNS_DETAILS_INVOICE_PHOTO_URI,);
    return _response;
  }

  /// orders returns details
  Future<Response> getRecentOrdersReturnDetailsTrackData(String id) async {
    String deviceID = await Get.find<AuthController>().getDeviceID();
/*    String status = "recent";*/
    print(deviceID);
    Response _response = await apiClient.getData(AppConstants.ACCOUNT_ORDERS_RETURNS_DETAILS_URI+"/$id",);
    return _response;
  }

  /// terms conditions order
  Future<Response> getOrderTermsConditionsData() async {
    Response _response = await apiClient.getData(AppConstants.ORDERS_TERMS_CONDITIONS_URI,);
    return _response;
  }

  /// returns exchange(returns)
  Future<Response> getReturnsData() async {
    String deviceID = await Get.find<AuthController>().getDeviceID();
    String customerID = await Get.find<AuthController>().getUserId();
    // String guestID = await Get.find<AuthController>().isLoggedInGuest()? await Get.find<AuthController>().getUserIdGuest() : "";
/*    String status = "recent";*/
    print(deviceID);
    Response _response = await apiClient.getData(AppConstants.RETURNS_URI,query: { "customer_id": customerID,
      // "status": status
    });
    return _response;
  }
  /// returns exchange(Exchange)
  Future<Response> getExchangeData() async {
    String deviceID = await Get.find<AuthController>().getDeviceID();
    String customerID = await Get.find<AuthController>().getUserId();
    // String guestID = await Get.find<AuthController>().isLoggedInGuest()? await Get.find<AuthController>().getUserIdGuest() : "";
/*    String status = "recent";*/
    print(deviceID);
    Response _response = await apiClient.getData(AppConstants.EXCHANGE_URI,query: { "customer_id": customerID,
      // "status": status
    });
    print("dfkds ==${_response.request?.url??""}");
    return _response;
  }

  /// returns exchange(returns Details)
  Future<Response> getReturnDetailsData(String id) async {
    String deviceID = await Get.find<AuthController>().getDeviceID();
/*    String status = "recent";*/
    print(deviceID);
    Response _response = await apiClient.getData(AppConstants.RETURNS_DETAILS_URI+"/$id",);
    return _response;
  }
  /// exchange(exchange Details)
  Future<Response> getExchangeDetailsData(String id) async {
    String deviceID = await Get.find<AuthController>().getDeviceID();
/*    String status = "recent";*/
    print(deviceID);
    Response _response = await apiClient.getData(AppConstants.EXCHANGE_DETAILS_URI+"/$id",);
    return _response;
  }












}