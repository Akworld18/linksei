

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:linksei/app/core/consts/app_styles.dart';
import 'package:linksei/app/core/utils/custom_box.dart';

class CustomTextField{

  showDestinationField({required double width,required FocusNode? focusNode,required TextEditingController controller,required Color borderColor,required String hintText}){
    return Container(
      height: 45,
      width:width,
      decoration: CustomBoxDecoration().showBlackOpacityDecoration(color: borderColor),
      child: customField(focusNode: focusNode, controller: controller, hintText: hintText),
    );
  }

  customField({required FocusNode? focusNode,required TextEditingController controller,required String hintText}){
    return TextFormField(
      focusNode: focusNode,
      controller: controller,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 10),
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: CustomTextStyles().blackOpacity600Text(16)
      ),
    );
  }


  shortLinkTextField({required Size pageSize,required FocusNode? focusNode,required TextEditingController controller,required String hintText,required Color borderColor,required double smallBoxWidth,required double bigBoxWidth}){
    return Container(
      height: 45,
      width:pageSize.width * 90/100 ,
      decoration: CustomBoxDecoration().showBlackOpacityDecoration(color: borderColor),
      child: Row(
        children: [
          CustomBox().showShortLinkBox(
              width:smallBoxWidth ,
              child: SizedBox()),
          SizedBox(
            height: 45,
            width:bigBoxWidth,
            child: CustomTextField().customField(focusNode: focusNode, controller: controller, hintText: hintText),
          )
        ],
      ),
    );
  }
}