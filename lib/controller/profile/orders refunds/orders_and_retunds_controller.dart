
import 'package:get/get.dart';
import 'package:isletestapp/data/api/api_checker.dart';
import 'package:isletestapp/data/model/response/FAQ/faq_response.dart';
import 'package:isletestapp/data/model/response/FAQ/faq_type_response.dart';
import 'package:isletestapp/data/model/response/main%20page/featured_brands_pagi_response.dart';
import 'package:isletestapp/data/model/response/main%20page/main_page_data_response.dart';
import 'package:isletestapp/data/model/response/order/account_order_and_returns_track_response.dart';
import 'package:isletestapp/data/model/response/profile/orders%20returns/invoice_top_bottom_photo_response.dart';
import 'package:isletestapp/data/model/response/profile/orders%20returns/invoice_trems_and_conditions_response.dart';
import 'package:isletestapp/data/model/response/profile/orders%20returns/orders_and_returns_details_track_response.dart';
import 'package:isletestapp/data/model/response/profile/orders%20returns/orders_and_returns_response.dart';
import 'package:isletestapp/data/model/response/profile/orders%20returns/orders_and_returns_track_details_response.dart';
import 'package:isletestapp/data/model/response/profile/orders%20returns/returns_exchange/exchange_details_response.dart';
import 'package:isletestapp/data/model/response/profile/orders%20returns/returns_exchange/exchange_response.dart';
import 'package:isletestapp/data/model/response/profile/orders%20returns/returns_exchange/returns_details_response.dart';
import 'package:isletestapp/data/model/response/profile/orders%20returns/returns_exchange/returns_response.dart';
import 'package:isletestapp/data/repository/main%20page/main_page_repo.dart';
import 'package:isletestapp/data/repository/profile/FAQ/faq_repo.dart';
import 'package:isletestapp/data/repository/profile/orders%20returns/orders_and_retunds_repo.dart';



class OrdersReturnsController extends GetxController implements GetxService {
  final OrdersReturnsRepo ordersReturnsRepo;
  OrdersReturnsController({required this.ordersReturnsRepo});

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  OrdersReturnsListResponse ? recentOrdersReturnsListResponse =null;
  OrdersReturnsListResponse ? pendingOrdersReturnsListResponse =null;
  OrdersReturnsListResponse ? confirmOrdersReturnsListResponse =null;
  OrdersReturnsListResponse ? rejectOrdersReturnsListResponse =null;
  OrdersAndReturnsDetailsResponse ? ordersAndReturnsDetailsResponse =null;
  AccountOrderReturnTrackResponse ? accountOrderReturnTrackResponse =null;
  InvoiceTopBottomPhotoResponse ? invoiceTopBottomPhotoResponse =null;
  InvoiceTermsAndConditionsResponse ? invoiceTermsAndConditionsResponse =null;
  ///exchange part
  // ReturnsResponse ? returnsResponse =null;
  ReturnsResponse ? returnsResponse =null;
  ExchangeResponse ? exchangeResponse =null;
  ReturnsDetailsResponse ? returnsDetailsResponse =null;
  ExchangeDetailsResponse ? exchangeDetailsResponse =null;

  double total = 0.0;


  Future<void> dataInitialize()async {
    await getRecentOrdersReturnData();
    await getPendingOrdersReturnData();
    await getConfirmOrdersReturnData();
    await getRejectOrdersReturnData();
    /// exchange part
    await getReturnsData();
    await getExchangeData();
  }
  Future<void> dataInitializeForDetails()async {
    await getInvoiceTopBottomImageData();
    await getOrderTermsConditionsData();
  }
  Future<void> dataInitializeForReturnDetails()async {
    await getInvoiceTopBottomImageData();
    await getOrderTermsConditionsData();
  }

  Future<void> dataClose()async {
    recentOrdersReturnsListResponse =null;
    pendingOrdersReturnsListResponse =null;
    confirmOrdersReturnsListResponse =null;
    rejectOrdersReturnsListResponse =null;
  }

  Future<void> getRecentOrdersReturnData() async {
    _isLoading = true;
    update();
    Response response = await ordersReturnsRepo.getRecentOrdersReturnData();

    if (response.statusCode == 200) {
      recentOrdersReturnsListResponse= OrdersReturnsListResponse.fromJson(response.body);
    } else {
      ApiChecker.checkApi(response);
      // showCustomSnackBar(response.statusCode!.toString());
    }
    _isLoading = false;
    update();
  }

  /// pending
  Future<void> getPendingOrdersReturnData() async {
    _isLoading = true;
    update();
    Response response = await ordersReturnsRepo.getPendingOrdersReturnData();

    if (response.statusCode == 200) {
      pendingOrdersReturnsListResponse = OrdersReturnsListResponse.fromJson(response.body);
    } else {
      ApiChecker.checkApi(response);
      // showCustomSnackBar(response.statusCode!.toString());
    }
    _isLoading = false;
    update();
  }

  /// confirmed
  Future<void> getConfirmOrdersReturnData() async {
    _isLoading = true;
    update();
    Response response = await ordersReturnsRepo.getConfirmOrdersReturnData();

    if (response.statusCode == 200) {
      confirmOrdersReturnsListResponse = OrdersReturnsListResponse.fromJson(response.body);
    } else {
      ApiChecker.checkApi(response);
      // showCustomSnackBar(response.statusCode!.toString());
    }
    _isLoading = false;
    update();
  }

  /// reject
  Future<void> getRejectOrdersReturnData() async {
    _isLoading = true;
    update();
    Response response = await ordersReturnsRepo.getRejectOrdersReturnData();

    if (response.statusCode == 200) {
      rejectOrdersReturnsListResponse = OrdersReturnsListResponse.fromJson(response.body);
    } else {
      ApiChecker.checkApi(response);
      // showCustomSnackBar(response.statusCode!.toString());
    }
    _isLoading = false;
    update();
  }

  ///  details
  Future<void> getRecentOrdersReturnDetailsData({required String id}) async {
    try {
      _isLoading = true;
      update();
      Response response = await ordersReturnsRepo.getRecentOrdersReturnDetailsData(id);
      if (response.statusCode == 200) {
        ordersAndReturnsDetailsResponse = OrdersAndReturnsDetailsResponse.fromJson(response.body);
        ordersAndReturnsDetailsResponse!.data!.orderPackages!.map((e) {
          total= total+(double.parse(e.price!.toString()))/100;
          print(total);
        }).toList();
      } else {
        ApiChecker.checkApi(response);
        // showCustomSnackBar(response.statusCode!.toString());
      }
      _isLoading = false;
      update();
    }
    catch (e) {
      // Handle the exception (e.g., log, show an error message, etc.)
      print('Error accessing orderTrackresponse data: $e');
    }

  }
  ///  invoice photo
  Future<void> getInvoiceTopBottomImageData() async {
    try {
      _isLoading = true;
      update();
      Response response = await ordersReturnsRepo.getInvoiceTopBottomImageData();
      if (response.statusCode == 200) {
        invoiceTopBottomPhotoResponse = InvoiceTopBottomPhotoResponse.fromJson(response.body);
      } else {
        ApiChecker.checkApi(response);
        // showCustomSnackBar(response.statusCode!.toString());
      }
      _isLoading = false;
      update();
    }
    catch (e) {
      // Handle the exception (e.g., log, show an error message, etc.)
      print('Error accessing orderTrackresponse data: $e');
    }
  }

  /// track details
  Future<void> getRecentOrdersReturnDetailsTrackData({required String id}) async {
    try {
      _isLoading = true;
      update();
      Response response = await ordersReturnsRepo.getRecentOrdersReturnDetailsTrackData(id);
      if (response.statusCode == 200) {
        accountOrderReturnTrackResponse = AccountOrderReturnTrackResponse.fromJson(response.body);
      } else {
        ApiChecker.checkApi(response);
        // showCustomSnackBar(response.statusCode!.toString());
      }
      _isLoading = false;
      update();
    }
    catch (e) {
      // Handle the exception (e.g., log, show an error message, etc.)
      print('Error accessing orderTrackresponse data: $e');
    }

  }
  ///  order terms conditions
  Future<void> getOrderTermsConditionsData() async {
    try {
      _isLoading = true;
      update();
      Response response = await ordersReturnsRepo.getOrderTermsConditionsData();
      if (response.statusCode == 200) {
        invoiceTermsAndConditionsResponse = InvoiceTermsAndConditionsResponse.fromJson(response.body);
      } else {
        ApiChecker.checkApi(response);
        // showCustomSnackBar(response.statusCode!.toString());
      }
      _isLoading = false;
      update();
    }
    catch (e) {
      // Handle the exception (e.g., log, show an error message, etc.)
      print('Error accessing orderTrackresponse data: $e');
    }
  }
  /// returns exchange(returns)
  Future<void> getReturnsData() async {
    _isLoading = true;
    update();
    Response response = await ordersReturnsRepo.getReturnsData();

    if (response.statusCode == 200) {
      returnsResponse= ReturnsResponse.fromJson(response.body);
    } else {
      ApiChecker.checkApi(response);
      // showCustomSnackBar(response.statusCode!.toString());
    }
    _isLoading = false;
    update();
  }
  /// returns exchange(Exchange)
  Future<void> getExchangeData() async {
    _isLoading = true;
    update();
    Response response = await ordersReturnsRepo.getExchangeData();

    if (response.statusCode == 200) {
      exchangeResponse= ExchangeResponse.fromJson(response.body);
    } else {
      ApiChecker.checkApi(response);
      // showCustomSnackBar(response.statusCode!.toString());
    }
    _isLoading = false;
    update();
  }
  /// returns exchange(returns details)
  Future<void> getReturnDetailsData({required String id}) async {
    try {
      _isLoading = true;
      update();
      Response response = await ordersReturnsRepo.getReturnDetailsData(id);
      if (response.statusCode == 200) {
        returnsDetailsResponse = ReturnsDetailsResponse.fromJson(response.body);
      } else {
        ApiChecker.checkApi(response);
        // showCustomSnackBar(response.statusCode!.toString());
      }
      _isLoading = false;
      update();
    }
    catch (e) {
      // Handle the exception (e.g., log, show an error message, etc.)
      print('Error accessing orderTrackresponse data: $e');
    }
  }
  /// exchange(exchange details)
  Future<void> getExchangeDetailsData({required String id}) async {
    try {
      _isLoading = true;
      update();
      Response response = await ordersReturnsRepo.getExchangeDetailsData(id);
      if (response.statusCode == 200) {
        exchangeDetailsResponse = ExchangeDetailsResponse.fromJson(response.body);
      } else {
        ApiChecker.checkApi(response);
        // showCustomSnackBar(response.statusCode!.toString());
      }
      _isLoading = false;
      update();
    }
    catch (e) {
      // Handle the exception (e.g., log, show an error message, etc.)
      print('Error accessing orderTrackresponse data: $e');
    }
  }









}
