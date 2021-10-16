import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:users_json/constants/constants.dart';
import 'package:users_json/screens/user_detail/userDetail.view.dart';
import 'package:users_json/screens/users_list/userList.controller.dart';
import 'package:users_json/screens/users_list/userList.model.dart';

class UserListView extends StatefulWidget {
  const UserListView({Key? key}) : super(key: key);

  @override
  State<UserListView> createState() => _UserListViewState();
}

class _UserListViewState extends State<UserListView> {
  late Future<List<dynamic>> _userList;
  @override
  void initState() {
    _userList = fetchUser();
    super.initState();
  }

  Future<List<dynamic>> fetchUser() async {
    var list = await Provider.of<UserListController>(context, listen: false)
        .getUsers();
    return list;
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    double cardWidth = MediaQuery.of(context).size.width / 0.37;
    double cardHeight = MediaQuery.of(context).size.height / 0.67;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'User List',
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () => fetchUser(),
        child: FutureBuilder<List<dynamic>>(
          future: _userList,
          initialData: const [],
          builder: (
            BuildContext context,
            AsyncSnapshot<List<dynamic>> snapshot,
          ) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return const Text('Error');
              } else if (snapshot.hasData) {
                return GridView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    // User user = snapshot.data![index];
                    var userData = snapshot.data![index];
                    return InkWell(
                      onTap: () =>
                          Get.to(() => UserDetailView(userDetail: userData)),
                      child: Container(
                        height: 150.h,
                        margin: const EdgeInsets.all(10),
                        width: 280.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.w),
                        ),
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                height: 120.h,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: AppColor.kAppDarkInputBg,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      "${userData['name']}",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14.sp,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(height: 3.h),
                                    Text(
                                      "@${userData['username'].toLowerCase()}",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(height: 3.h),
                                    Text(
                                      "${userData['email'].toLowerCase()}",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(height: 3.h),
                                  ],
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topCenter,
                              child: CachedNetworkImage(
                                imageUrl:
                                    'https://pbs.twimg.com/profile_images/1257280933557710850/95taFO3E_400x400.jpg',
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                  height: 90.h,
                                  width: 90.w,
                                  decoration: BoxDecoration(
                                    color: Colors.amber,
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: imageProvider,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                placeholder: (context, url) => const Center(
                                  child: CircularProgressIndicator(),
                                ),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: cardWidth / cardHeight,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 4.0,
                  ),
                );
              } else {
                return const Center(child: Text('No user found!'));
              }
            } else {
              return Text('State: ${snapshot.connectionState}');
            }
          },
        ),
      ),
    );
  }
}
