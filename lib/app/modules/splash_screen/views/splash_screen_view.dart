import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/src/router.dart';
import 'package:notes/app/utils/app_string.dart';
import '../../../utils/app_color.dart';

class SplashScreenView extends StatelessWidget {





  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      GoRouter.of(context).go('/login_page');
    });
    return Scaffold(
        backgroundColor: AppColors.pageBackground,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppString.splash,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 20,
              ),
              SpinKitWaveSpinner(
                color: AppColors.primary,
                size: 80,
                waveColor: AppColors.shadowPrimary40,
              )
            ],
          ),
        ));
  }
}
