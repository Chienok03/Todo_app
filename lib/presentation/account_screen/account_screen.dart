import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_app/global/app_assets.dart';
import 'package:todo_app/global/app_string.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.primary,
      appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(15.0),
            child: InkWell(
              onTap: () => Navigator.of(context).pop(),
              child: SvgPicture.asset(
                AppAssets.icBack,
                fit: BoxFit.cover,
              ),
            ),
          ),
          title: Text(AppString.profile,
              style: TextStyle(
                  color: theme.colorScheme.secondary,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
          centerTitle: true),
      body: Column(
        children: [
          CircleAvatar(),
        ],
      ),
    );
  }
}
