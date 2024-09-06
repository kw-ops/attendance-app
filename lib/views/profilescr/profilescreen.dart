import 'package:attendance/const/funcs.dart';
// import 'package:attendance/widget/app_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

import '../../const/constants.dart';
import '../../database/konkonsa.dart';
import '../../database/user_details_provider.dart';
import '../../model/loginuser.dart';
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

  Future _loadpage() async {
    setState(() {
      isLoading = true;
    });
    await KonKonsa().getUserStudent(context);
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    currentUser = context.read<UserDetailsProvider>();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _loadpage();
    });
  }

  @override
  Widget build(BuildContext context) {
    Dimensions.init(context);
    Size size = MediaQuery.of(context).size;
    LogUs welcomeName = Provider.of<UserDetailsProvider>(context, listen: false)
          .getUserDetails();
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
            body: Consumer<UserDetailsProvider>(
              builder: (context, currentUser, child) {
                final user = currentUser.getStudentDetails();
                return Column(
                  children: [
                    createSpace(size, 10, 'vertical'),
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(30)),
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
                              text: user.year.toString(),
                              color: appColors.black,
                              fontsize: getFontSize(24, size),
                              fontWeight: FontWeight.bold,
                            ),
                            SizedBox(
                              width: Dimensions().pSW(260),
                              child: AppTextWidget(
                                maxlines: 2,
                                textAlign: TextAlign.left,
                                text: user.programmeOfStudy.toString(),
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
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                        ),
                        child: Center(
                          child: AppTextWidget(
                            text: 'Personal Info',
                            color: appColors.red,
                            fontsize: getFontSize(20, size),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
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
                                  text: welcomeName.username!,
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
                                  text: welcomeName.lastName!,
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
                                  text: welcomeName.firstName!,
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
                                  text: user.id.toString(),
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
                                  text: user.studentId.toString(),
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
                                  text: user.user!.email.toString(),
                                  color: appColors.black,
                                  fontWeight: FontWeight.bold,
                                  fontsize: getFontSize(16, size),
                                ),
                              ),
                              // ListTile(
                              //   title: AppTextWidget(
                              //     text: 'KNUST Mobile',
                              //     color: appColors.black,
                              //     fontsize: getFontSize(14, size),
                              //   ),
                              //   subtitle: AppTextWidget(
                              //     text: '0505242573',
                              //     color: appColors.black,
                              //     fontWeight: FontWeight.bold,
                              //     fontsize: getFontSize(16, size),
                              //   ),
                              // ),
                              ListTile(
                                title: AppTextWidget(
                                  text: 'Personal Mobile',
                                  color: appColors.black,
                                  fontsize: getFontSize(14, size),
                                ),
                                subtitle: AppTextWidget(
                                  text: user.phoneNumber.toString(),
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
                );
                // return throw ;
              },
            ),
          );
  }
}
