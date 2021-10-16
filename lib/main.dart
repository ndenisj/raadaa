import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:users_json/screens/users_list/userList.controller.dart';
import 'package:users_json/screens/users_list/userList.view.dart';

import 'constants/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Users List',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColor.kAppDarkBackground,
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => UserListController(),
          ),
        ],
        child: ScreenUtilInit(
          designSize: const Size(360, 690),
          builder: () => const UserListView(),
        ),
      ),
    );
  }
}
