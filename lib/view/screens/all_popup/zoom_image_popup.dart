import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isletestapp/util/app_constants.dart';
import 'package:isletestapp/util/color.dart';
import 'package:isletestapp/util/dimensions.dart';
import 'package:isletestapp/view/base/custom_Image_cached.dart';

class ZoomCarusalPopUp extends StatefulWidget {
  final String clickImage;
  const ZoomCarusalPopUp({super.key,required this.clickImage,});
  @override
  State<ZoomCarusalPopUp> createState() => _CarusalPopUpState();
}
class _CarusalPopUpState extends State<ZoomCarusalPopUp> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0)),
      insetPadding: EdgeInsets.all(0),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Container(
        color: Colors.transparent,
        height: Get.height,
        child: Stack(
          children:
          [
            CarouselSlider.builder(
              itemCount: widget.clickImage.length??0,
              itemBuilder: (BuildContext context, int index, _) {
                return CustomImageCached(
                  isRound: false,
                  image: '${widget.clickImage}',
                  fit: BoxFit.fill,
                );
              },
              options: CarouselOptions(
                // autoPlay: true,
                // Enable auto-sliding
                autoPlayInterval: const Duration(seconds: 2),
                // Set the auto-sliding interval
                enableInfiniteScroll: true,
                height: Get.height,
                // enlargeCenterPage: true,
                reverse: false,
                aspectRatio: 10 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                // autoPlayAnimationDuration: Duration(milliseconds: 800),
                viewportFraction: 1,
              ),
            ),





      /*    Container(
            height: Get.height,
            child: InkWell(
              onTap: (){
                // Get.dialog(CarusalPopUp(btnfn: () {  }, data: ));
              },
              child: CustomImageCached(
                isRound: false,
                image: '${widget.clickImage}',
                fit: BoxFit.fill,
                //br: BorderRadius.only(bottomLeft: Radius.circular(18), bottomRight: Radius.circular(18)),
              ),
            ),
          ),*/

            Positioned(
               top: 5,
                right: 5,
                child:  GestureDetector(
              onTap: (){
                Get.back();
              },
              child: Container(
                color: Colors.transparent,
                height: 50,
                width: 50,
                child: Icon(Icons.close_sharp, color: gold,),
              ),
            )
            )

          ],
        ),
      ),);
  }
}
