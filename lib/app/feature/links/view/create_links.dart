import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:linksei/app/core/consts/app_styles.dart';
import 'package:linksei/app/core/utils/custom_buttons.dart';
import 'package:linksei/app/core/utils/custom_text.dart';
import 'package:linksei/app/core/utils/custom_textfield.dart';

class CreateLinks extends StatefulWidget {
  const CreateLinks({super.key});

  @override
  State<CreateLinks> createState() => _CreateLinksState();
}

class _CreateLinksState extends State<CreateLinks> {
  TextEditingController destinationController = TextEditingController();
  TextEditingController shortLinkController = TextEditingController();
  TextEditingController referralController = TextEditingController();
  TextEditingController utmSourceController = TextEditingController();
  TextEditingController utmMediumController = TextEditingController();
  TextEditingController utmCampaignController = TextEditingController();
  TextEditingController utmTermController = TextEditingController();
  TextEditingController passwordProtectionController = TextEditingController();
  TextEditingController linkExpirationController = TextEditingController();
  TextEditingController expirationController = TextEditingController();
  TextEditingController iosTargetingController = TextEditingController();
  TextEditingController androidTargetingController = TextEditingController();

  FocusNode destinationFocus= FocusNode();
  FocusNode shortLink= FocusNode();
  FocusNode referralFocus= FocusNode();
  FocusNode utmSourceFocus= FocusNode();
  FocusNode utmMediumFocus= FocusNode();
  FocusNode utmCampaignFocus= FocusNode();
  FocusNode utmTermFocus= FocusNode();
  FocusNode protectionFocus= FocusNode();
  FocusNode linkExpirationFocus= FocusNode();
  FocusNode expirationFocus= FocusNode();
  FocusNode iosTargetingFocus= FocusNode();
  FocusNode androidTargetingFocus= FocusNode();

  Color destinationBorder = Colors.grey.withOpacity(0.5);
  Color shortLinkBorder = Colors.grey.withOpacity(0.5);
  Color referralBorder = Colors.grey.withOpacity(0.5);
  Color utmSourceBorder = Colors.grey.withOpacity(0.5);
  Color utmMediumBorder = Colors.grey.withOpacity(0.5);
  Color utmCampaignBorder = Colors.grey.withOpacity(0.5);
  Color utmTermBorder = Colors.grey.withOpacity(0.5);
  Color protectionBorder = Colors.grey.withOpacity(0.5);
  Color linkExpirationBorder = Colors.grey.withOpacity(0.5);
  Color expirationBorder = Colors.grey.withOpacity(0.5);
  Color iosTargetingBorder = Colors.grey.withOpacity(0.5);
  Color androidTargetingBorder = Colors.grey.withOpacity(0.5);


  bool forIos = false;
  bool customSocial = false;
  bool utmBuilder = false;
  bool passwordProtection = false;
  bool linkExpiration = false;
  bool iosTargeting = false;
  bool androidTargeting = false;
  bool geoTargeting = false;
  bool searchEngine = false;
  bool comments = false;

  @override
  void initState() {
    destinationFocus.addListener(() {
      setState(() {
        destinationBorder = destinationFocus.hasFocus ? Colors.black : Colors.grey.withOpacity(0.5);
      });
    });
    shortLink.addListener(() {
      setState(() {
        shortLinkBorder = shortLink.hasFocus ? Colors.black : Colors.grey.withOpacity(0.5);
      });
    });
    referralFocus.addListener(() {
      setState(() {
        referralBorder = referralFocus.hasFocus ? Colors.black : Colors.grey.withOpacity(0.5);
      });
    });
    utmSourceFocus.addListener(() {
      setState(() {
        utmSourceBorder = utmSourceFocus.hasFocus ? Colors.black : Colors.grey.withOpacity(0.5);
      });
    });
    utmMediumFocus.addListener(() {
      setState(() {
        utmMediumBorder = utmMediumFocus.hasFocus ? Colors.black : Colors.grey.withOpacity(0.5);
      });
    });
    utmCampaignFocus.addListener(() {
      setState(() {
        utmCampaignBorder = utmCampaignFocus.hasFocus ? Colors.black : Colors.grey.withOpacity(0.5);
      });
    });
    utmTermFocus.addListener(() {
      setState(() {
        utmTermBorder = utmTermFocus.hasFocus ? Colors.black : Colors.grey.withOpacity(0.5);
      });
    });
    protectionFocus.addListener(() {
      setState(() {
        protectionBorder = protectionFocus.hasFocus ? Colors.black : Colors.grey.withOpacity(0.5);
      });
    });
    linkExpirationFocus.addListener(() {
      setState(() {
        linkExpirationBorder = linkExpirationFocus.hasFocus ? Colors.black : Colors.grey.withOpacity(0.5);
      });
    });
    expirationFocus.addListener(() {
      setState(() {
        expirationBorder = expirationFocus.hasFocus ? Colors.black : Colors.grey.withOpacity(0.5);
      });
    });
    iosTargetingFocus.addListener(() {
      setState(() {
        iosTargetingBorder = iosTargetingFocus.hasFocus ? Colors.black : Colors.grey.withOpacity(0.5);
      });
    });
    androidTargetingFocus.addListener(() {
      setState(() {
        androidTargetingBorder = androidTargetingFocus.hasFocus ? Colors.black : Colors.grey.withOpacity(0.5);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size pageSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child:Icon(Icons.arrow_back_ios,color: Colors.white,)),
        ),
        toolbarHeight: pageSize.height * 8/100,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(14), bottomRight: Radius.circular(14)),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text("Create a new links",style:CustomTextStyles().whiteBoldText(18),),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            showPaddingBox(children: [
              CustomText().showDestinationText(text: "Destination URL"),
              SizedBox(height: 14),
              CustomTextField().showDestinationField(
                  hintText: "https://linksei.deepsense.dev/",
                  width: pageSize.width * 90/100 ,
                  focusNode: destinationFocus,
                  controller: destinationController,
                  borderColor: destinationBorder)
            ],page: pageSize),
            showPaddingBox(children: [
              CustomText().showDestinationText(text: "Short Link"),
              SizedBox(height: 14),
              CustomTextField().shortLinkTextField(
                  pageSize: pageSize,
                  focusNode: shortLink,
                  controller: shortLinkController,
                  hintText: "(optional)" ,
                  borderColor: shortLinkBorder,
                  smallBoxWidth: pageSize.width * 27/100 ,
                  bigBoxWidth: pageSize.width * 60/100),
            ], page: pageSize),
            SizedBox(height: 25),
            SizedBox(
              width:pageSize.width * 90/100,
              child: Row(
                children: [
                  CustomDivider().showDivider(pageSize.width * 35/100),
                  Text("Optional",style: CustomTextStyles().blackOpacity600Text(18)),
                  CustomDivider().showDivider(pageSize.width * 35/100),

                ],
              ),
            ),
            SizedBox(height: 25),
            Container(
              height: 45,
              width:pageSize.width * 90/100 ,
              decoration:CustomBoxDecoration().showBlackOpacityDecoration(color:  Colors.grey.withOpacity(0.5))
            ),
            SizedBox(height: 35),
            CustomDivider().showDivider(pageSize.width * 90/100 ),
            CustomText().proWithSwitchRow(text: "Custom Social Media Cards", width: pageSize.width * 90/100 ,
                onChanged: (value) => setState(() => customSocial = value),
                value: customSocial),
            CustomDivider().showDivider(pageSize.width * 90/100 ),
            CustomText().proWithSwitchRow(text: "UTM Builder", width: pageSize.width * 90/100 ,
                onChanged: (value) => setState(() => utmBuilder = value),
                value: utmBuilder),
            Padding(
              padding:  EdgeInsets.only(top: 30),
              child:CustomTextField().shortLinkTextField(
                  pageSize: pageSize,
                  focusNode: referralFocus,
                  controller: referralController,
                  hintText: "twitter,facebook",
                  borderColor: referralBorder,
                  smallBoxWidth: pageSize.width * 37/100,
                  bigBoxWidth: pageSize.width * 51/100)
            ),
            Padding(
              padding:  EdgeInsets.only(top: 30),
              child:CustomTextField().shortLinkTextField(
                  pageSize: pageSize,
                  focusNode: utmSourceFocus,
                  controller: utmSourceController,
                  hintText: "twitter,facebook",
                  borderColor: utmSourceBorder,
                  smallBoxWidth: pageSize.width * 37/100,
                  bigBoxWidth: pageSize.width * 51/100)
            ),
            Padding(
              padding:  EdgeInsets.only(top: 30),
              child:CustomTextField().shortLinkTextField(
                  pageSize: pageSize,
                  focusNode: utmMediumFocus,
                  controller: utmMediumController,
                  hintText: "social, email",
                  borderColor: utmMediumBorder,
                  smallBoxWidth: pageSize.width * 37/100,
                  bigBoxWidth: pageSize.width * 51/100)
            ),
            Padding(
              padding:  EdgeInsets.only(top: 30),
              child:CustomTextField().shortLinkTextField(
                  pageSize: pageSize,
                  focusNode: utmCampaignFocus,
                  controller: utmCampaignController,
                  hintText: "summer_sale",
                  borderColor: utmCampaignBorder,
                  smallBoxWidth: pageSize.width * 37/100,
                  bigBoxWidth: pageSize.width * 51/100)
            ),
            Padding(
              padding:  EdgeInsets.only(top: 30),
              child:CustomTextField().shortLinkTextField(
                  pageSize: pageSize,
                  focusNode: utmTermFocus,
                  controller: utmTermController,
                  hintText: "blue_shoes",
                  borderColor: utmTermBorder,
                  smallBoxWidth: pageSize.width * 37/100,
                  bigBoxWidth: pageSize.width * 51/100)
            ),
            SizedBox(height: 30),
            CustomDivider().showDivider(pageSize.width * 90/100 ),
            CustomText().proWithSwitchRow(
                text: "Password Protection",
                width:pageSize.width * 90/100 ,
                onChanged: (value) => setState(() => passwordProtection = value),
                value: passwordProtection),
            CustomTextField().showDestinationField(
                 width:pageSize.width * 90/100,
                focusNode: protectionFocus,
                controller: passwordProtectionController,
                borderColor: protectionBorder,
                hintText: "Enter Password"),
            CustomDivider().showDivider(pageSize.width * 90/100 ),
            CustomText().proWithSwitchRow(
                text: "Link Expiration",
                width:pageSize.width * 90/100 ,
                onChanged: (value) => setState(() => linkExpiration = value),
                value: linkExpiration),
            CustomTextField().showDestinationField(
                width:pageSize.width * 90/100,
                focusNode: linkExpirationFocus,
                controller: linkExpirationController,
                borderColor: linkExpirationBorder,
                hintText: 'Eg."tomorrow at 5pm", or "in 2hours"'),
            showPaddingBox(children: [
              CustomText().showDestinationText(text: "Expiration URL"),
              SizedBox(height: 20),
              CustomTextField().showDestinationField(
                  hintText: "https://linksei.deepsense.dev/",
                  width: pageSize.width * 90/100 ,
                  focusNode: expirationFocus,
                  controller: expirationController,
                  borderColor: expirationBorder)
            ],page: pageSize),
            Padding(
              padding:  EdgeInsets.only(top: 15,bottom: 20),
              child: SizedBox(
                width:pageSize.width * 90/100 ,
                child: Text("Or set a default expiration URL for your domain >",textAlign: TextAlign.start,
                style: CustomTextStyles().blackOpacity600Text(14),),
              ),
            ),
            CustomDivider().showDivider(pageSize.width * 90/100 ),
            CustomText().proWithSwitchRow(text: "IOS Targeting", width: pageSize.width * 90/100 ,
                onChanged: (value) => setState(() => iosTargeting = value),
                value: iosTargeting),
            CustomTextField().showDestinationField(
                hintText: "https://linksei.deepsense.dev/",
                width: pageSize.width * 90/100 ,
                focusNode: iosTargetingFocus,
                controller: iosTargetingController,
                borderColor: iosTargetingBorder),
            CustomDivider().showDivider(pageSize.width * 90/100),
            CustomText().proWithSwitchRow(text: "Android Targeting", width: pageSize.width * 90/100 ,
                onChanged: (value) => setState(() => androidTargeting = value),
                value: androidTargeting),
            CustomTextField().showDestinationField(
                hintText: "https://linksei.deepsense.dev/",
                width: pageSize.width * 90/100 ,
                focusNode: androidTargetingFocus,
                controller: androidTargetingController,
                borderColor: androidTargetingBorder),
            CustomDivider().showDivider(pageSize.width * 90/100 ),
            CustomText().proWithSwitchRow(text: "Geo Targeting", width: pageSize.width * 90/100 ,
                onChanged: (value) => setState(() => geoTargeting = value),
                value: geoTargeting),
            CustomTextField().shortLinkTextField(
                pageSize: pageSize,
                focusNode: shortLink,
                controller: shortLinkController,
                hintText: "(optional)" ,
                borderColor: shortLinkBorder,
                smallBoxWidth: pageSize.width * 30/100 ,
                bigBoxWidth: pageSize.width * 40/100),
            SizedBox(height: 20),
            Container(
              height: 35,
              width: pageSize.width * 90 / 100,
              decoration: BoxDecoration(
                  color: Colors.blueAccent.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                  border: Border(right: BorderSide(color: Colors.grey.withOpacity(0.5)))
                  // border: Border.all(color: Colors.black.withOpacity(0.3))
                  ),
              child: Center(
                child: Text("Add location",style: CustomTextStyles().blackOpacity600Text(18),),
              ),
            ),
            SizedBox(height: 20),
            CustomDivider().showDivider(pageSize.width * 90/100 ),
            CustomText().proWithSwitchRow(text: "Search Engine Indexing", width: pageSize.width * 90/100 ,
                onChanged: (value) => setState(() => searchEngine = value),
                value: searchEngine),
            CustomDivider().showDivider(pageSize.width * 90/100 ),
            CustomText().proWithSwitchRow(text: "Comments", width: pageSize.width * 90/100 ,
                onChanged: (value) => setState(() => comments = value),
                value: comments),
            SizedBox(height: 50),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 20,left: 15,right: 15),
        child: CustomButtons().createWorkspaceButton(height: 50, width:pageSize.width * 90/100 , onTap: (){}, text: "Create link"),
      ),
    );
  }

  showPaddingBox({required List<Widget> children,required Size page}){
    return Padding(
      padding:  EdgeInsets.only(top: 20),
      child: Center(
        child: SizedBox(
          width:page.width * 90/100 ,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children,
          ),
        ),
      ),
    );
  }


}
