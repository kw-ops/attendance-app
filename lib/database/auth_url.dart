
import '../widget/constants.dart';

class AuthUrl {
  static const baseUrl = "$BaseUrl/";

  static const String loginStaff = "${baseUrl}api/login/staff/";
  static const String loginStud = "${baseUrl}api/login/student/";
  static const String logout = "${baseUrl}logout/";

  static const String attendanceTokens = "${baseUrl}attendance-tokens/";
  static const String attendances = "${baseUrl}attendances/";
  static const String courses = "${baseUrl}courses/";
  static const String lecturers = "${baseUrl}lecturers/";
  static const String students = "${baseUrl}students/";


  ////// Get Access Token From Refresh Token ////////////
  // static const String tokenRefresh = "${baseUrl}token/refresh/";

  // //////////////////// Change Email /////////////////////
  // static const String emailChangeOTP = "${baseUrl}email-change-otp/";
  // static const String confirmEmailChange = "${baseUrl}email-change/";

  // static const String validateInfo =
  //     "$halloaBaseUrl/user/user_accounts/validate-info/";
}
