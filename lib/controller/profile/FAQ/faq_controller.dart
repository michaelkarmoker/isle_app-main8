import 'package:get/get.dart';
import 'package:isletestapp/data/api/api_checker.dart';
import 'package:isletestapp/data/model/response/FAQ/faq_tab_click_data_response.dart';
import 'package:isletestapp/data/model/response/FAQ/faq_tab_response.dart';
import 'package:isletestapp/data/repository/profile/FAQ/faq_repo.dart';

class FAQController extends GetxController implements GetxService {
  final FAQRepo faqRepo;
  FAQController({required this.faqRepo});

 Future<void> dataInitialize()async {
    await getFAQTabData();
 }
  bool _isLoading = false;
  bool get isLoading => _isLoading;


  FaqTabResponse ? faqTabResponse =null;
  FaqTabClickDataResponse ? faqTabClickDataResponse =null;

  // List<Result>? result =null;


  Future<void> getFAQTabData() async {
    _isLoading = true;
    update();
    Response response = await faqRepo.getFAQTabData();

    if (response.statusCode == 200) {
      faqTabResponse= FaqTabResponse.fromJson(response.body);
    } else {
      ApiChecker.checkApi(response);
     // showCustomSnackBar(response.statusCode!.toString());
    }
    _isLoading = false;
    update();
  }


  /// faq tab click data
  Future<void> getFAQTabClickData(String id) async {
    _isLoading = true;
    update();
    Response response = await faqRepo.getFAQTabClickData(id);

    if (response.statusCode == 200) {
      faqTabClickDataResponse= FaqTabClickDataResponse.fromJson(response.body);
    } else {
      ApiChecker.checkApi(response);
      // showCustomSnackBar(response.statusCode!.toString());
    }
    _isLoading = false;
    update();
  }





}
