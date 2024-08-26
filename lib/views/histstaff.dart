import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../const/constants.dart';
import '../const/funcs.dart';
import '../model/coursemaodel.dart';
import '../model/history.dart';
import '../widget/widgets.dart';

class HistoryStaff extends StatefulWidget {
  const HistoryStaff({super.key});

  @override
  State<HistoryStaff> createState() => _HistoryStaffState();
}
final List<CoursesModel> _data = [
  CoursesModel(
    courseCode: 'CSM 346',
    // isExpanded: false,
    state: [
      HistoryModel(
        date: 'date',
        time: 'time',
        attend: true,
      ),
    ],
  ),
  CoursesModel(
    courseCode: 'CSM 436',
    // isExpanded: false,
    state: [
      HistoryModel(
        date: 'date',
        time: 'time',
        attend: false,
      ),
      HistoryModel(
        date: 'date',
        time: 'time',
        attend: false,
      ),
      HistoryModel(
        date: '11 Jan 2024',
        time: 'time',
        attend: false,
      ),
      HistoryModel(
        date: 'date',
        time: 'time',
        attend: true,
      ),
      HistoryModel(
        date: 'date',
        time: 'time',
        attend: false,
      ),
    ],
  ),
  CoursesModel(
    courseCode: 'CSM 405',
    // isExpanded: false,
    state: [
      HistoryModel(
        date: 'date',
        time: 'time',
        attend: false,
      ),
      HistoryModel(
        date: 'date',
        time: 'time',
        attend: true,
      ),
      HistoryModel(
        date: 'date',
        time: 'time',
        attend: false,
      ),
    ],
  ),
];
class _HistoryStaffState extends State<HistoryStaff> {
  @override
  Widget build(BuildContext context) {
    Dimensions.init(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
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
      body: Padding(
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
                    setState(() {
                      _data[index].isExpanded = !_data[index].isExpanded;
                    });
                  },
                  children:
                      _data.map<ExpansionPanel>((CoursesModel coursesModel) {
                    return ExpansionPanel(
                      canTapOnHeader: true,
                      headerBuilder: (BuildContext context, bool isExpanded) {
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
                            text: coursesModel.courseCode.toString(),
                            fontsize: getFontSize(15, size),
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      },
                      body: coursesModel.state!.isNotEmpty
                          ? ListView.builder(
                              itemCount: coursesModel.state!.length,
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context, int index) {
                                // return Container(
                                //   height: 32,
                                //   width: 100,
                                //   decoration: BoxDecoration(
                                //     color: appColors.grey828280,
                                //     borderRadius: BorderRadius.circular(15),
                                //   ),
                                //   child: Text(
                                //     coursesModel.state![index].date.toString(),
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
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10,
                                        vertical: 3,
                                      ),
                                      iconStyle: IconStyle(
                                          iconData: Icons.circle,
                                          color: appColors.black,
                                          fontSize: getFontSize(10, size)),
                                    ),
                                    endChild: Container(
                                      height: Dimensions().pSH(65),
                                      width: Dimensions().pSW(300),
                                      decoration: BoxDecoration(
                                        color: appColors.greyDADADA,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Row(
                                        children: [
                                          Container(
                                            height: Dimensions().pSH(65),
                                            width: Dimensions().pSW(50),
                                            decoration: BoxDecoration(
                                              color: appColors.greyF0F0F0,
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            child: coursesModel.state![index].attend! ? Image.asset(presenticon)
                                            : Image.asset(absenticon ),
                                          )
                                        ],
                                      ),
                                      // Text(
                                      //   coursesModel.state![index].date
                                      //       .toString(),
                                      // ),
                                    ),
                                  ),
                                );
                              },
                            )
                          : const Center(
                              child: Text('No items'),
                            ),
                      isExpanded: coursesModel.isExpanded,
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}