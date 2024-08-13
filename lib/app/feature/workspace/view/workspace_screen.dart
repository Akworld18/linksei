import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:linksei/app/core/consts/app_images.dart';
import 'package:linksei/app/core/consts/app_styles.dart';
import 'package:linksei/app/feature/links/view/links_list_screen.dart';
import 'package:linksei/app/feature/workspace/model/widget_models.dart';

class WorkspaceScreen extends StatefulWidget {
  final String workspaceName;
  const WorkspaceScreen({super.key, required this.workspaceName});

  @override
  State<WorkspaceScreen> createState() => _WorkspaceScreenState();
}

class _WorkspaceScreenState extends State<WorkspaceScreen> {
  List <BottomBarModel> bottomButton=[
    BottomBarModel(image: AppImages().link, text: "Links"),
    BottomBarModel(image: AppImages().analytics, text: "Analytics"),
    BottomBarModel(image: AppImages().setting, text: "Settings")
  ];
  int  selectIndex = 0;

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
        title: Text(widget.workspaceName,style:CustomTextStyles().whiteBoldText(18),),
      ),
      body:showPage(pageSize) ,
      bottomNavigationBar: Container(
        height: 80,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12)
          )
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              for(int i=0;i<bottomButton.length;i++)
                GestureDetector(
                  onTap: (){
                    setState(() {
                      selectIndex = i;
                    });
                  },
                  child:Column(
                    children: [
                      Image.asset(bottomButton[i].image,height: 30,width: 30,fit: BoxFit.contain,color: selectIndex==i?Colors.white:Colors.white.withOpacity(0.4),),
                      SizedBox(height: 5),
                      Text(bottomButton[i].text.toString(),style: GoogleFonts.openSans(
                        fontSize: 14,fontWeight: FontWeight.w600,
                        color: selectIndex==i?Colors.white:Colors.white.withOpacity(0.4)
                      ),)
                    ],
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }

  showPage(Size page){
    switch(selectIndex){
      case 0:
        return LinksListScreen(pageSize: page);
      case 1:
        return const SizedBox();
      case 2:{}
        return const SizedBox();
      default:
    }
  }
}
