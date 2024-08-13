import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:linksei/app/core/consts/app_images.dart';
import 'package:linksei/app/core/consts/app_styles.dart';
import 'package:linksei/app/core/utils/animated_routes.dart';
import 'package:linksei/app/core/utils/custom_buttons.dart';
import 'package:linksei/app/core/utils/custom_list_animation.dart';
import 'package:linksei/app/feature/workspace/view/create_workspace.dart';
import 'package:linksei/app/feature/workspace/view/workspace_screen.dart';


class WorkspaceDashboard extends StatefulWidget {
  const WorkspaceDashboard({super.key});

  @override
  State<WorkspaceDashboard> createState() => _WorkspaceDashboardState();
}

class _WorkspaceDashboardState extends State<WorkspaceDashboard>
    with TickerProviderStateMixin {
  bool showPage = true;
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
    Size pageSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: pageSize.height * 8 / 100,
        leading: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: CircleAvatar(
              backgroundImage: AssetImage(
                'assets/avatar.jpg',
              ),
            )),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(14),
              bottomRight: Radius.circular(14)),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          "My Workspaces",
          style: CustomTextStyles().whiteBoldText(18),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  showPage = !showPage;
                });
              },
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 3)),
                child: Center(
                    child: Icon(
                  Icons.add,
                  color: Colors.white,
                )),
              ),
            ),
          )
        ],
      ),
      body: showPage
          ? SingleChildScrollView(
              child: Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: totalItems,
                    itemBuilder: (BuildContext context, int index) {
                      return AnimatedListWidget(
                        index: index,
                        animationController: _animationController!,
                        duration: animationDuration,
                        pageSize: pageSize,
                        page: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 10),
                          child: GestureDetector(
                            onTap: () {
                              CustomAnimatedRoutes().slideNavigatePush(
                                  context: context,
                                  child: WorkspaceScreen(
                                    workspaceName: "Arun Kumar",
                                  ));
                            },
                            child: Container(
                              height: pageSize.height * 13 / 100,
                              width: pageSize.width * 80 / 100,
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
                                    SizedBox(height: 13),
                                    Padding(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Row(
                                        children: [
                                          for (int i = 0; i < 3; i++)
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: i == 0 ? 0 : 20),
                                              child: SizedBox(
                                                child: Row(
                                                  children: [
                                                    FaIcon(
                                                      i == 0
                                                          ? FontAwesomeIcons
                                                              .globe
                                                          : i == 1
                                                              ? FontAwesomeIcons
                                                                  .link
                                                              : FontAwesomeIcons
                                                                  .chartSimple,
                                                      color: Colors.black
                                                          .withOpacity(0.2),
                                                      size: 20,
                                                    ),
                                                    SizedBox(width: 5),
                                                    Text(
                                                      "2 ",
                                                      style: CustomTextStyles().blackOpacity600Text(18),
                                                    ),
                                                    Text(
                                                      i == 0
                                                          ? " domains"
                                                          : i == 1
                                                              ? "links  "
                                                              : "clicks  ",
                                                      style: CustomTextStyles().blackOpacity600Text(16),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  )
                ],
              ),
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("You don't have any workspace yet!",
                      style: CustomTextStyles().blackOpacityText(22),
                      textAlign: TextAlign.center),
                  Image.asset(
                    AppImages().noData,
                    height: pageSize.height * 40 / 100,
                    width: pageSize.width * 75 / 100,
                    fit: BoxFit.contain,
                  ),
                  CustomButtons().createWorkspaceButton(
                      height: 50,
                      text: "Create a workspace",
                      width: pageSize.width * 50 / 100,
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (_) => CreateWorkspace(pageSize: pageSize),
                        );
                      })
                ],
              ),
            ),
    );
  }
}
