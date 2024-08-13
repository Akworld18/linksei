import 'package:flutter/material.dart';
import 'package:linksei/app/core/consts/app_styles.dart';
import 'package:linksei/app/core/utils/animated_routes.dart';
import 'package:linksei/app/core/utils/custom_buttons.dart';
import 'package:linksei/app/core/utils/custom_list_animation.dart';
import 'package:linksei/app/feature/links/view/create_links.dart';
import 'package:linksei/app/feature/workspace/view/workspace_screen.dart';

class LinksListScreen extends StatefulWidget {
  final Size pageSize;
  const LinksListScreen({super.key, required this.pageSize});

  @override
  State<LinksListScreen> createState() => _LinksListScreenState();
}

class _LinksListScreenState extends State<LinksListScreen> with SingleTickerProviderStateMixin{
  AnimationController? _animationController;
  double animationDuration = 0.0;
  int totalItems = 10;

  @override
  void initState() {
    super.initState();
    final int totalDuration = 4000;
    _animationController = AnimationController(
        vsync: this, duration: new Duration(milliseconds: totalDuration));
    animationDuration = totalDuration / (100 * (totalDuration / totalItems));
    _animationController?.forward();
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: widget.pageSize.width * 92 / 100,
          height: 70,
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 45,
                  width:widget.pageSize.width * 65/100 ,
                  decoration: BoxDecoration(
                    boxShadow: CustomBoxShadows().boxShadow,
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(7),
                    // border: Border.all(color: Colors.black.withOpacity(0.3))
                  ),
                ),
                CustomButtons().createWorkspaceButton(height: 45, width: widget.pageSize.width * 25 / 100, onTap: (){
                  CustomAnimatedRoutes().navigatePush(
                      context: context,
                      child: CreateLinks());
                }, text: "Create")
              ],
            ),
          ),
        ),
        Expanded(
          child:SizedBox(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: totalItems,
              itemBuilder: (BuildContext context, int index) {
                return AnimatedListWidget(
                  index: index,
                  animationController: _animationController!,
                  duration: animationDuration,
                  pageSize: widget.pageSize,
                  page: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 10),
                    child: GestureDetector(
                      onTap: () {

                      },
                      child: Container(
                        height: widget.pageSize.height * 8 / 100,
                        width: widget.pageSize.width * 80 / 100,
                        decoration: BoxDecoration(
                          boxShadow: CustomBoxShadows().boxShadow,
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(13),
                          // border: Border.all(color: Colors.black.withOpacity(0.3))
                        ),
                        child: Padding(
                          padding:
                          const EdgeInsets.only(left: 15, right: 15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: 60,
                                        width: 60,
                                        decoration: BoxDecoration(
                                          color: Colors.green,
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/avatar.jpg'),
                                              fit: BoxFit.cover),
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Arun Kumar",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w800,
                                            ),
                                          ),
                                          Text(
                                            "https://linksei.deepsense.dev/",
                                            style: TextStyle(
                                              decoration:
                                              TextDecoration.underline,
                                              decorationColor: Colors.black
                                                  .withOpacity(0.2),
                                              color: Colors.black
                                                  .withOpacity(0.4),
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 27,
                                        width:widget.pageSize.height * 8 / 100 ,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(7),
                                          color: Colors.blueAccent.withOpacity(0.2)
                                        ),
                                        child: Center(
                                          child: Text("3 clicks",style: CustomTextStyles().blackOpacityText(16),),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        )
      ],
    );
  }
}
