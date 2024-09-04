import 'package:attendance/const/funcs.dart';
import 'package:attendance/widget/app_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

import '../../const/constants.dart';
import '../../database/konkonsa.dart';
import '../../database/user_details_provider.dart';
import '../../widget/widgets.dart';
import '../shimmerContainer.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

late UserDetailsProvider currentUser;
  bool isLoading = false;

  Future loadpage() async {
    setState(() {
      isLoading = true;
    });
    await KonKonsa().getUserDataStaff(context);
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    currentUser = context.read<UserDetailsProvider>();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      loadpage();
    });
    
  }




  @override
  Widget build(BuildContext context) {
    Dimensions.init(context);
    Size size = MediaQuery.of(context).size;
    return isLoading
        ? const ShimmerWidget(child: name())
        : Scaffold(
      appBar: AppBar(
        title: AppTextWidget(
          text: 'Profile',
          color: appColors.black,
          fontsize: getFontSize(20, size),
          fontWeight: FontWeight.bold,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_outlined,
              color: appColors.black,
              size: Dimensions().pSW(27),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          createSpace(size, 10, 'vertical'),
          Row(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(30)),
                child: Image.asset(
                  pic1,
                  width: Dimensions().pSW(90),
                  height: Dimensions().pSH(90),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppTextWidget(
                    text: 'YEAR 4',
                    color: appColors.black,
                    fontsize: getFontSize(24, size),
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(
                    width: Dimensions().pSW(260),
                    child: AppTextWidget(
                      maxlines: 2,
                      textAlign: TextAlign.left,
                      text: 'Bsc. Computer Science',
                      color: appColors.black0002,
                      fontsize: getFontSize(24, size),
                    ),
                  )
                ],
              )
            ],
          ),
          createSpace(size, 20, 'vertical'),
          Container(
            width: Dimensions().pSW(365),
            height: Dimensions().pSH(65),
            decoration: BoxDecoration(
              color: appColors.blueC8D8FF,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                  ),
                  child: AppTextWidget(
                    text: 'Personal Info',
                    color: appColors.red,
                    fontsize: getFontSize(20, size),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(
                      right: 20,
                    ),
                    child: Container(
                      width: Dimensions().pSW(90),
                      height: Dimensions().pSH(40),
                      decoration: BoxDecoration(
                        color: appColors.white,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: appColors.red,
                          width: 1,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            edit,
                          ),
                          createSpace(size, 10, 'horizontal'),
                          AppTextWidget(
                            text: 'Edit',
                            fontsize: getFontSize(20, size),
                            color: appColors.red,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                child: Column(
                  children: [
                    ListTile(
                      title: AppTextWidget(
                        text: 'Username',
                        color: appColors.black,
                        fontsize: getFontSize(14, size),
                      ),
                      subtitle: AppTextWidget(
                        text: 'prince',
                        color: appColors.black,
                        fontWeight: FontWeight.bold,
                        fontsize: getFontSize(16, size),
                      ),
                    ),
                    ListTile(
                      title: AppTextWidget(
                        text: 'Surname',
                        color: appColors.black,
                        fontsize: getFontSize(14, size),
                      ),
                      subtitle: AppTextWidget(
                        text: 'Akanya',
                        color: appColors.black,
                        fontWeight: FontWeight.bold,
                        fontsize: getFontSize(16, size),
                      ),
                    ),
                    ListTile(
                      title: AppTextWidget(
                        text: 'Other Name',
                        color: appColors.black,
                        fontsize: getFontSize(14, size),
                      ),
                      subtitle: AppTextWidget(
                        text: 'Prince',
                        color: appColors.black,
                        fontWeight: FontWeight.bold,
                        fontsize: getFontSize(16, size),
                      ),
                    ),
                    ListTile(
                      title: AppTextWidget(
                        text: 'Index Number',
                        color: appColors.black,
                        fontsize: getFontSize(14, size),
                      ),
                      subtitle: AppTextWidget(
                        text: '1',
                        color: appColors.black,
                        fontWeight: FontWeight.bold,
                        fontsize: getFontSize(16, size),
                      ),
                    ),
                    ListTile(
                      title: AppTextWidget(
                        text: 'Student ID',
                        color: appColors.black,
                        fontsize: getFontSize(14, size),
                      ),
                      subtitle: AppTextWidget(
                        text: '11111',
                        color: appColors.black,
                        fontWeight: FontWeight.bold,
                        fontsize: getFontSize(16, size),
                      ),
                    ),
                    ListTile(
                      title: AppTextWidget(
                        text: 'Personal Email',
                        color: appColors.black,
                        fontsize: getFontSize(14, size),
                      ),
                      subtitle: AppTextWidget(
                        text: 'priince@gmail.com',
                        color: appColors.black,
                        fontWeight: FontWeight.bold,
                        fontsize: getFontSize(16, size),
                      ),
                    ),
                    ListTile(
                      title: AppTextWidget(
                        text: 'KNUST Mobile',
                        color: appColors.black,
                        fontsize: getFontSize(14, size),
                      ),
                      subtitle: AppTextWidget(
                        text: '0206377363',
                        color: appColors.black,
                        fontWeight: FontWeight.bold,
                        fontsize: getFontSize(16, size),
                      ),
                    ),
                    ListTile(
                      title: AppTextWidget(
                        text: 'Personal Mobile',
                        color: appColors.black,
                        fontsize: getFontSize(14, size),
                      ),
                      subtitle: AppTextWidget(
                        text: '0245890265',
                        color: appColors.black,
                        fontWeight: FontWeight.bold,
                        fontsize: getFontSize(16, size),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
