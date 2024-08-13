import 'package:flutter/material.dart';
import 'package:linksei/app/core/consts/app_styles.dart';
import 'package:linksei/app/core/utils/custom_buttons.dart';


class CustomText{

  showDestinationText({required String text}){
    return Text(text,style:CustomTextStyles().black700Text(18));
  }

  proText(String text){
    return  Row(
      children: [
        CustomText().showDestinationText(text: text),
        SizedBox(width: 8),
        CustomButtons().proButton(),
      ],
    );
  }

  proWithSwitchRow({required String text,required double width,required ValueChanged<bool>? onChanged,required bool value}){
    return Padding(
      padding: const EdgeInsets.only(top: 20,bottom: 20),
      child: SizedBox(
        width:width ,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            proText(text),
            CustomButtons().customSwitch(onChanged: onChanged, value: value),
          ],
        ),
      ),
    );
  }

}