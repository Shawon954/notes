import 'package:flutter/material.dart';
import 'package:go_router/src/router.dart';
import 'package:notes/app/routes/go_routes.dart';

import '../../../utils/app_color.dart';

class DetailsScreen extends StatelessWidget {


  final String title;
  final String details;

  const DetailsScreen({super.key, required this.title, required this.details});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.sizeOf(context).height*0.1,
            width: double.infinity,
            color: Colors.amber,
            child: Padding(
              padding: const EdgeInsets.only(top: 25,left: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  child: Icon(Icons.arrow_back,color: AppColors.textDark,size: 20,),
                  onTap: (){
                    GoRouter.of(context).go('/home_page');
                  },
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20,top: 30),
            child:  Column(
              children: [
                Text(
                  title,
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
                  details,
                  maxLines: 10,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textDark),
                )
              ],
            ),
          ),

        ],
      ),
    );
  }
}
