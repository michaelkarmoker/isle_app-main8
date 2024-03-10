import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isletestapp/util/dimensions.dart';
import 'package:isletestapp/util/html_tag_remover.dart';
import 'package:isletestapp/util/images.dart';
import 'package:isletestapp/util/styles.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final String desc;

  const CustomDialog({super.key, required this.title, required this.desc,});
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(2)),
      insetPadding: EdgeInsets.all(8),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.only(right: 10,top: 10),
              alignment: Alignment.topRight,
              child: InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Image.asset(Images.error,height: 20,width: 20,)),
            ) ,
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 35, right: 35),
              child: Center(child: Text( title,
                  textAlign: TextAlign.center,
                  style: railwaybold.copyWith(fontSize: 20))),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 35,right: 35,bottom: 8),
                    child:   Text('${
                        HtmlTags.removeTag(
                          htmlString: "${desc}",
                        )
                    }',
                      textAlign: TextAlign.center,
                      style: poppins.copyWith(fontSize: 13),
                      // maxLines: 1,
                      // overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 35),
          ],
        ),
      ),
    );
  }
}
