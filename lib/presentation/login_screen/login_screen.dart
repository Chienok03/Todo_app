import 'package:flutter/material.dart';
import 'package:todo_app/common/cm_button.dart';
import 'package:todo_app/global/app_assets.dart';
import 'package:todo_app/global/app_color.dart';
import 'package:todo_app/global/app_string.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final Color buttonColor = theme.brightness == Brightness.dark
        ? AppColor.darkButtonColor
        : AppColor.lightButtonColor;

    return Scaffold(
      backgroundColor: theme.colorScheme.primary,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppString.login,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 53),
              Text(
                AppString.userName,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                cursorColor: buttonColor,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: theme.inputDecorationTheme.fillColor,
                    hintText: AppString.hintTextLogin1,
                    hintStyle: TextStyle(color: AppColor.hintTextColor),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2, color: buttonColor))),
              ),
              const SizedBox(height: 20),
              Text(
                AppString.password,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                cursorColor: buttonColor,
                obscureText: true,
                obscuringCharacter: "*",
                decoration: InputDecoration(
                    filled: true,
                    fillColor: theme.inputDecorationTheme.fillColor,
                    hintText: AppString.hintTextLogin2,
                    hintStyle: TextStyle(color: AppColor.hintTextColor),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2, color: buttonColor))),
              ),
              const SizedBox(height: 50),
              CmButton(
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false,);
                },
                title: Center(
                  child: Text(
                    AppString.login,
                    style: TextStyle(
                        color: theme.colorScheme.secondary,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                backgroundColor: buttonColor,
              ),
              const SizedBox(height: 31),
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 1,
                      color: theme.colorScheme.secondary,
                    ),
                  ),
                  Text(
                    AppString.or,
                    style: TextStyle(
                      color: theme.colorScheme.secondary,
                      fontSize: 16,
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 1,
                      color: theme.colorScheme.secondary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              CmButton(
                  onTap: () {
                    
                  },
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(AppAssets.icFacebook,
                          width: 30, height: 30, fit: BoxFit.fill),
                      const SizedBox(width: 10),
                      const Text(AppString.loginWithFb,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold))
                    ],
                  ),
                  colorBorder: buttonColor),
              const SizedBox(height: 10),
              CmButton(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(AppAssets.icGoogle,
                          width: 30, height: 30, fit: BoxFit.fill),
                      const SizedBox(width: 10),
                      const Text(AppString.loginWithFb,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold))
                    ],
                  ),
                  onTap: () {},
                  colorBorder: buttonColor),
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppString.dontHaveAc,
                    style: TextStyle(
                      color: theme.colorScheme.secondary,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(width: 5),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/register');
                    },
                    child: Text(
                      AppString.register,
                      style: TextStyle(
                          color: theme.colorScheme.secondary,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
