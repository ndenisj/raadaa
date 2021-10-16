import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:users_json/constants/constants.dart';

class UserDetailView extends StatelessWidget {
  const UserDetailView({required this.userDetail});

  final dynamic userDetail;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FractionallySizedBox(
            heightFactor: 0.5,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/johndoe.jpeg'),
                ),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(40),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: FractionallySizedBox(
              heightFactor: 0.5,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(10.w),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${userDetail['name']}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp,
                        ),
                      ),
                      Text(
                        '@${userDetail['username']}',
                        style: TextStyle(
                          fontSize: 16.sp,
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Text(
                        'Contact Info.',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.sp,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Phone',
                            style: TextStyle(
                              fontSize: 14.sp,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              '${userDetail['phone']}',
                              style: TextStyle(
                                fontSize: 16.sp,
                              ),
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Email',
                            style: TextStyle(
                              fontSize: 14.sp,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              '${userDetail['email']}',
                              style: TextStyle(
                                fontSize: 16.sp,
                              ),
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Website',
                            style: TextStyle(
                              fontSize: 14.sp,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              '${userDetail['website']}',
                              style: TextStyle(
                                fontSize: 16.sp,
                              ),
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.h),
                      Text(
                        'Address',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.sp,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Suite',
                            style: TextStyle(
                              fontSize: 14.sp,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              '${userDetail['address']['suite']}',
                              style: TextStyle(
                                fontSize: 16.sp,
                              ),
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Street',
                            style: TextStyle(
                              fontSize: 14.sp,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              '${userDetail['address']['street']}',
                              style: TextStyle(
                                fontSize: 16.sp,
                              ),
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'City',
                            style: TextStyle(
                              fontSize: 14.sp,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              '${userDetail['address']['city']}',
                              style: TextStyle(
                                fontSize: 16.sp,
                              ),
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Zipcode',
                            style: TextStyle(
                              fontSize: 14.sp,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              '${userDetail['address']['zipcode']}',
                              style: TextStyle(
                                fontSize: 16.sp,
                              ),
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: InkWell(
              onTap: () => Navigator.of(context).pop(),
              child: Container(
                margin: EdgeInsets.only(top: 25.h, right: 10.w),
                padding: const EdgeInsets.all(5),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: const Icon(
                  Icons.close,
                  color: AppColor.kAppDarkBackground,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
