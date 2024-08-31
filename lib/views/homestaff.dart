import 'package:attendance/database/konkonsa.dart';
import 'package:attendance/model/loginuser.dart';
import 'package:attendance/model/staff_model.dart';
import 'package:attendance/model/users.dart';
import 'package:attendance/views/shimmerContainer.dart';
import 'package:attendance/views/staffattend.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:local_auth/local_auth.dart';
import 'package:provider/provider.dart';
import '../const/constants.dart';
import '../const/funcs.dart';
import '../database/user_details_provider.dart';
import '../model/coursemaodel.dart';
import '../widget/utils/location_service.dart';
import '../widget/widgets.dart';

class HomeStaffScreen extends StatefulWidget {
  const HomeStaffScreen({super.key});

  @override
  State<HomeStaffScreen> createState() => _HomeStaffScreenState();
}

late UserDetailsProvider currentUser;

class _HomeStaffScreenState extends State<HomeStaffScreen> {
  final List<StaffModel> staffModel = [];
  late final LocalAuthentication auth;
  bool _supportState = false;

  @override
  void initState() {
    super.initState();
    currentUser = context.read<UserDetailsProvider>();
    auth = LocalAuthentication();
    auth.isDeviceSupported().then((bool isSupported) => setState(() {
          _supportState = isSupported;
        }));
  }

  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    final fetchStaff = KonKonsa().getUserDataStaff(context);
    print('${fetchStaff} succ');
    if (fetchStaff is StaffModel) {
      if (mounted) {
        Provider.of<UserDetailsProvider>(context).getStaffDetails();
        print('ok');
        setState(() {
          isLoading = false;
          print('end');
        });
      } else {}
    } else {}
    Dimensions.init(context);
    Size size = MediaQuery.of(context).size;
    // LogUs currentUser =
    //     Provider.of<UserDetailsProvider>(context, listen: false)
    //         .getUserDetails();
    return isLoading
        ? const ShimmerWidget(child: name())
        : Scaffold(
            appBar: AppBar(
              title: Center(
                child: AppTextWidget(
                  text: 'COURSE LIST',
                  fontsize: getFontSize(24, size),
                  fontWeight: FontWeight.bold,
                  color: appColors.black,
                ),
              ),
            ),
            body: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: StaffModel().courses!.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(20),
                    child: GestureDetector(
                      onTap: () {
                        _authenticate();
                        // LocationService().getLocation().then((value) => print(value));
                        LocationService()
                            .determinePosition()
                            .then((value) => print(value));
                        context.pushNamed('/attStaff',
                            pathParameters: {'verCode': '0'});
                      },
                      child: Container(
                        height: Dimensions().pSH(70),
                        width: Dimensions().pSW(350),
                        decoration: BoxDecoration(
                          color: appColors.white,
                          borderRadius: BorderRadius.circular(40),
                          boxShadow: [
                            BoxShadow(
                              color: appColors.black0002,
                              offset: const Offset(1, 3),
                              blurRadius: 2,
                              spreadRadius: 2,
                            )
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 0, right: 10, bottom: 0, left: 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AppTextWidget(
                                text: StaffModel()
                                    .courses![index]
                                    .name
                                    .toString(),
                                fontsize: getFontSize(24, size),
                                fontWeight: FontWeight.bold,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          );
  }

  Future<void> _authenticate() async {
    try {
      bool authenticated = await auth.authenticate(
        localizedReason: 'localizedReason',
        options: const AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: false,
        ),
      );
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) {
      return;
    }
  }
}
