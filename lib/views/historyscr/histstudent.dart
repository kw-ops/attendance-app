import 'package:attendance/const/funcs.dart';
import 'package:attendance/widget/app_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../const/constants.dart';
import '../../database/konkonsa.dart';
import '../../database/user_details_provider.dart';
import '../../model/attendhistory.dart';
import '../../widget/widgets.dart';
import '../shimmerContainer.dart';

class HistoryScreenStudent extends StatefulWidget {
  const HistoryScreenStudent({super.key});

  @override
  State<HistoryScreenStudent> createState() => _HomeScreenStudentState();
}

final List<HistoryAttendance> _data = [];

class _HomeScreenStudentState extends State<HistoryScreenStudent> {

late UserDetailsProvider currentUser;
  bool isLoading = false;

  Future _loadpage() async {
    setState(() {
      isLoading = true;
    });
    await KonKonsa().getUserAttendanceStudent(context);
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
    return isLoading
        ? const ShimmerWidget(child: name())
        : Scaffold(
            appBar: AppBar(
              backgroundColor: appColors.red,
              //toolbarHeight: Dimensions().pSH(100),
              centerTitle: true,
              title: AppTextWidget(
                text: 'HISTORY',
                fontsize: getFontSize(20, size),
                fontWeight: FontWeight.bold,
                color: appColors.white,
              ),
            ),
            body: Consumer<UserDetailsProvider>(
                builder: (context, currentUser, child) {
              final att = currentUser.getAttendanceDetails();
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 30,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //createSpace(size, 20, 'vertical'),
                    AppTextWidget(
                      text: 'Attendance History',
                      fontsize: getFontSize(20, size),
                    ),
                    createSpace(size, 20, 'vertical'),
                    Expanded(
                      child: SingleChildScrollView(
                        child: ExpansionPanelList(
                          materialGapSize: 10,
                          elevation: 1,
                          expansionCallback: (index, isExpanded) {
                            final _att = att[index];
                            setState(() {
                              _att.isExpanded =
                                  !_att.isExpanded;
                            });
                          },
                          children: att.map<ExpansionPanel>(
                              (HistoryAttendance attends) {
                            return ExpansionPanel(
                              canTapOnHeader: true,
                              headerBuilder:
                                  (BuildContext context, bool isExpanded) {
                                return ListTile(
                                  leading: Container(
                                    height: Dimensions().pSH(40),
                                    width: Dimensions().pSW(40),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        width: 1,
                                      ),
                                    ),
                                    child: Icon(
                                      Icons.history,
                                      weight: Dimensions().pSW(20),
                                    ),
                                  ),
                                  title: AppTextWidget(
                                    // text: attends[].course[].name,
                                    text: attends.courseCode.toString(),
                                    fontsize: getFontSize(15, size),
                                    fontWeight: FontWeight.bold,
                                  ),
                                );
                              },
                              body: attends.attendances!.isNotEmpty
                                  ? ListView.builder(
                                      itemCount:
                                          attends.attendances!.length,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        // return Container(
                                        //   height: 32,
                                        //   width: 100,
                                        //   decoration: BoxDecoration(
                                        //     color: appColors.grey828280,
                                        //     borderRadius: BorderRadius.circular(15),
                                        //   ),
                                        //   child: Text(
                                        //     attends.state![index].date.toString(),
                                        //   ),
                                        // );
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 5,
                                            horizontal: 20,
                                          ),
                                          child: TimelineTile(
                                            indicatorStyle: IndicatorStyle(
                                              width: Dimensions().pSW(12),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 10,
                                                vertical: 3,
                                              ),
                                              iconStyle: IconStyle(
                                                  iconData: Icons.circle,
                                                  color: appColors.black,
                                                  fontSize:
                                                      getFontSize(10, size)),
                                            ),
                                            endChild: Container(
                                              height: Dimensions().pSH(65),
                                              width: Dimensions().pSW(300),
                                              decoration: BoxDecoration(
                                                color: appColors.greyDADADA,
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                              child:
                                              // child: Row(
                                              //   children: [
                                              //     Container(
                                              //       height:
                                              //           Dimensions().pSH(65),
                                              //       width: Dimensions().pSW(50),
                                              //       decoration: BoxDecoration(
                                              //         color:
                                              //             appColors.greyF0F0F0,
                                              //         borderRadius:
                                              //             BorderRadius.circular(
                                              //                 15),
                                              //       ),
                                              //       // child: attends.course![index] ? Image.asset(presenticon)
                                              //       child: true
                                              //           ? Image.asset(
                                              //               presenticon)
                                              //           : Image.asset(
                                              //               absenticon),
                                              //     )
                                              //   ],
                                              // ),
                                              Text(
                                                attends.attendances![index].date.toString(),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    )
                                  : const Center(
                                      child: Text('No items'),
                                    ),
                              isExpanded: attends.isExpanded,
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }));
  }
}
