import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isletestapp/controller/auth_controller.dart';
import 'package:isletestapp/controller/product/product_controller.dart';
import 'package:isletestapp/controller/profile/product%20feedback/product_feedback_controller.dart';
import 'package:isletestapp/util/color.dart';
import 'package:isletestapp/util/styles.dart';
import 'package:isletestapp/view/base/custom_button.dart';
import 'package:isletestapp/view/base/custom_snackbar.dart';
import 'package:isletestapp/view/base/my_text_field.dart';

class AccountProductFeedbackPopup extends StatefulWidget {
  final String id;
  final String productId;
  AccountProductFeedbackPopup({
    Key? key, required this.id, required this.productId,
  }) : super(key: key);
  @override
  State<AccountProductFeedbackPopup> createState() => _ProductReviewPopupState();
}
class _ProductReviewPopupState extends State<AccountProductFeedbackPopup> {
TextEditingController smsCtr = TextEditingController();
FocusNode smsFcs = FocusNode();
int selectedRating = 0;

@override
void initState()  {
  // TODO: implement initState
  super.initState();
  WidgetsBinding.instance.addPostFrameCallback((_) {
    // Get.find<ProductFeedbackController>().getViewProductFeedbackData(widget.orderNo!).then((value) => Get.find<ProductFeedbackController>().dataInitializeForDetails());
    Get.find<ProductFeedbackController>().getFeedbackOrNotData(widget.productId);
    setState(() {

    });
  }
  );
}
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductFeedbackController>(
        builder: (controller) {
          return SingleChildScrollView(
            child: controller.getProductFeedbackResponse!=null? controller.getProductFeedbackResponse!.data!.length>0?
            SingleChildScrollView(
              child: Container(
                // height: Get.height/2,
                child: Padding(
                  padding: const EdgeInsets.only(left: 0, right: 0, top: 5, bottom: 8),
                  child: Column(
                    children: [
                      ListTile(
                        title: Text('', style: railway.copyWith(fontSize: 20, fontWeight: FontWeight.bold),),
                        trailing: InkWell(
                            onTap: (){
                              Get.back();
                            },
                            child: Text("Close", style: railway.copyWith(fontSize: 12, fontWeight: FontWeight.bold, decoration: TextDecoration.underline),)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 8),
                        child: Card(
                              // margin: EdgeInsets.only(),
                              // color: Colors.green,
                              elevation: 3,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 50),
                                child: Column(
                                  children: [
                                    Row(
                                      // crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text("Rating: ", style: railwaybold.copyWith(fontSize: 14)),
                                        SizedBox(width: 0),
                                        controller.getProductFeedbackResponse?.data?[0]?.rating == 5 ?
                                        Row(
                                          children: [
                                            Container(
                                              height: 35,
                                              child: ListView.builder(
                                                  itemCount: 5,
                                                  shrinkWrap: true,
                                                  scrollDirection: Axis.horizontal,
                                                  itemBuilder: (BuildContext context, int index) {
                                                    return Icon(Icons.star, color: gold, size: 20,);
                                                  }
                                              ),
                                            ),
                                            Text("(${controller.getProductFeedbackResponse?.data?[0]?.rating??"0"})")
                                          ],
                                        )
                                            : SizedBox(),
                                        controller.getProductFeedbackResponse?.data?[0]?.rating == 4 ?
                                        Row(
                                          children: [
                                            Container(
                                              height: 35,
                                              child: ListView.builder(
                                                  itemCount: 4,
                                                  shrinkWrap: true,
                                                  scrollDirection: Axis.horizontal,
                                                  itemBuilder: (BuildContext context, int index) {
                                                    return Icon(Icons.star, color: gold, size: 20,);
                                                  }
                                              ),
                                            ),
                                            Text("(${controller.getProductFeedbackResponse?.data?[0]?.rating??"0"})")
                                          ],
                                        )  : SizedBox(),
                                        controller.getProductFeedbackResponse?.data?[0]?.rating == 3 ?
                                        Row(
                                          children: [
                                            Container(
                                              height: 35,
                                              child: ListView.builder(
                                                  itemCount: 3,
                                                  shrinkWrap: true,
                                                  scrollDirection: Axis.horizontal,
                                                  itemBuilder: (BuildContext context, int index) {
                                                    return Icon(Icons.star, color: gold, size: 20,);
                                                  }
                                              ),
                                            ),
                                            Text("(${controller.getProductFeedbackResponse?.data?[0]?.rating??"0"})")
                                          ],
                                        )  : SizedBox(),
                                        controller.getProductFeedbackResponse?.data?[0]?.rating == 2 ?
                                        Row(
                                          children: [
                                            Container(
                                              height: 35,
                                              child: ListView.builder(
                                                  itemCount: 2,
                                                  shrinkWrap: true,
                                                  scrollDirection: Axis.horizontal,
                                                  itemBuilder: (BuildContext context, int index) {
                                                    return Icon(Icons.star, color: gold, size: 20,);
                                                  }
                                              ),
                                            ),
                                            Text("(${controller.getProductFeedbackResponse?.data?[0]?.rating??"0"})")
                                          ],
                                        )  : SizedBox(),
                                        controller.getProductFeedbackResponse?.data?[0]?.rating == 1 ?
                                        Row(
                                          children: [
                                            Container(
                                              height: 35,
                                              child: ListView.builder(
                                                  itemCount: 1,
                                                  shrinkWrap: true,
                                                  scrollDirection: Axis.horizontal,
                                                  itemBuilder: (BuildContext context, int index) {
                                                    return Icon(Icons.star, color: gold, size: 20,);
                                                  }
                                              ),
                                            ),
                                            Text("(${controller.getProductFeedbackResponse?.data?[0]?.rating??"0"})")
                                          ],
                                        )
                                            : SizedBox(),

                                      ],
                                    ),

                                    SizedBox(height: 8),
                                    Text("Your Feedback:",style: railwaybold.copyWith(fontWeight: FontWeight.bold, fontSize: 15),),
                                    SizedBox(height: 4),
                                    Text("${controller.getProductFeedbackResponse?.data?[0]?.message??""}",style: railway.copyWith(fontWeight: FontWeight.bold, fontSize: 11),),
                                    SizedBox(height: 8),
                                    controller.getProductFeedbackResponse!.data![0]!.productFeedbackReplies!.length>0?
                                    Text("Admin Reply:",style: railwaybold.copyWith(fontWeight: FontWeight.bold, fontSize: 15),)
                                    : SizedBox.shrink(),
                                    controller.getProductFeedbackResponse!.data![0]!.productFeedbackReplies!.length>0?SizedBox(height: 4): SizedBox.shrink(),
                                    controller.getProductFeedbackResponse!.data![0]!.productFeedbackReplies!.length>0?
                                    Text("${controller.getProductFeedbackResponse?.data?[0]?.productFeedbackReplies?[0]?.message??""}",style: railway.copyWith(fontWeight: FontWeight.bold, fontSize: 11),)
                                    : SizedBox.shrink(),
                                    SizedBox(height: 8),
                                  ],
                                ),
                              ),
                            ),
                      ),
                      SizedBox(height: 10),
                      CustomButton(
                        radius: 0,
                        height: 40,
                        width: 70,
                          buttoncolor: gold,
                          buttontextcolor: Colors.white,
                          onPressed: (){
                            Get.back();
                          },
                          buttonText: "OK"
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                )
              ),
            )
           : Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    title: Text('', style: railway.copyWith(fontSize: 20, fontWeight: FontWeight.bold),),
                    trailing: InkWell(
                        onTap: (){
                          Get.back();
                        },
                        child: Text("Close", style: railway.copyWith(fontSize: 12, fontWeight: FontWeight.bold, decoration: TextDecoration.underline),)),
                  ),
                  SizedBox(height: 0),
                  Text("We would love to hear your thoughts",style: railwaybold.copyWith(fontWeight: FontWeight.bold, fontSize: 15),),
                  SizedBox(height: 8),
                  Text("How is your experience with ISLE",style: railway.copyWith(fontWeight: FontWeight.bold, fontSize: 11),),
                  SizedBox(height: 10),
                  Container(
                    height: 35,
                    child: ListView.builder(
                      itemCount: 5,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              selectedRating = index + 1;
                            });
                          },
                          child: Icon(
                            Icons.star,
                            color: index < selectedRating ? gold : Colors.grey, // Change color based on selection
                            size: 30,
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 8),
                  Text("We value your honest feedback, Tell us more below:",style: railway.copyWith(fontWeight: FontWeight.bold, fontSize: 11),),
                  SizedBox(height: 0),
                  Padding(
                    padding:  EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom, left: 8, right: 8),
                    child: MyTextField(
                      controller: smsCtr,
                      focusNode: smsFcs,
                      title: "",
                      minLines: 4,
                      maxLines: 4,
                      height: 120,
                      hintText: "Please Add your Feedback here",
                    ),
                  ),

                  SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomButton(
                      onPressed: () async {
                        if (selectedRating > 0) {
                          String customerID = await Get.find<AuthController>().getUserId();
                          controller.createProductFeedback(
                            product_id : widget.id,
                            message: smsCtr.text,
                            customer_id: customerID,
                            rating: selectedRating.toString(),
                          );
                        } else {
                          showCustomSnackBar("Enter Your Valuable text", isError: false, isPosition:  false);
                        }
                      },
                      buttonText: "Submit".toUpperCase(),
                      buttoncolor: Colors.black,
                      buttontextcolor: Colors.white,
                      fontSize: 12,
                      radius: 0,
                    ),
                  ),
                  SizedBox(height: 8),

                ]
            )
            :Text("data"),
          );
        }
    );
  }







}
