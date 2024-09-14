import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/src/router.dart';
import 'package:notes/app/modules/home_page/views/details.dart';
import 'package:notes/app/routes/go_routes.dart';
import '../../../utils/app_color.dart';
import '../controllers/home_page_controller.dart';

class HomePageView extends StatelessWidget {

  final controller = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.pageBackground,
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.edit,
            size: 20,
            color: AppColors.textButtonPrimary,
          ),
          onPressed: () {
            GoRouter.of(context).go('/addnote_page');
          },
          backgroundColor: AppColors.primaryLight,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(30))),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                height: 90,
                width: double.infinity,
                color: Colors.red,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, right: 10, left: 10),
                  child: Row(
                    children: [
                      Expanded(child: Container()),
                      Align(
                          alignment: Alignment.center,
                          child: Text(
                            'My Note',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: AppColors.textDark),
                          )),
                      Spacer(),
                      InkWell(
                        onTap: () {},
                        child: Icon(
                          Icons.logout,
                          size: 20,
                          color: Colors.black,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                height: MediaQuery.sizeOf(context).height * 0.86,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  child:Obx(()=> GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          mainAxisExtent: 220),
                      itemCount:controller.dataList.length,
                      itemBuilder: (context, index) {
                         final item = controller.dataList[index];
                        return GestureDetector(
                          onTap: () {
                            GoRouter.of(context).go('/details_page',extra: item.title,);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              color: Colors.amber,
                            ),
                            height: 220,
                            width: double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.title,
                                    maxLines: 2,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.textDark),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    item.details,
                                    maxLines: 10,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.textDark),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }),)

                ),
              ),
            ],
          ),
        ));
  }
}
