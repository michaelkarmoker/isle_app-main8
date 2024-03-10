import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isletestapp/util/color.dart';
import 'package:isletestapp/util/dimensions.dart';
import 'package:isletestapp/util/images.dart';
import 'package:isletestapp/util/styles.dart';

class ForCheckOutCustomPopUp extends StatelessWidget {
 final String? username;
 final String? msg;
  const ForCheckOutCustomPopUp({super.key,  this.username, this.msg});
  // const CustomPopUp({super.key,  this.title="Exam Time is Over.",});
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0)),
      insetPadding: EdgeInsets.all(8),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.only(right: 10,top: 15),
              alignment: Alignment.topRight,
              child: InkWell(
                  onTap: () {
                    Get.back();
                    // Get.back();
                  },
                  child: Image.asset(Images.error,height: 20,width: 20,)),
            ) ,
            SizedBox(height: 2),
            Text('Hello',style: railwaybold.copyWith(fontSize: 28)),
            SizedBox(height: 8),
            Text('${username??""}',style: railwaybold.copyWith(fontSize: 15)),
            SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child:  Padding(
                    padding: const EdgeInsets.only(left: 8,right: 10,bottom: 12),
                    child: Text('${msg??""}',
                      textAlign: TextAlign.center,
                      style: poppins.copyWith(fontSize: 16 , color: gold, fontWeight: FontWeight.bold),),
                  ),
                ),
              ],
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
