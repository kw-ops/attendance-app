/// path assets (svgs and pngs) path
const String baseSvgPath = 'assets/svgs/';
const String basePngPath = 'assets/pngs/';
const String baseJpgPath = 'assets/jpgs/';

/// app logo

/// pngs
final String knust = 'knust'.png;
final String aim = 'aim'.png;
final String studentIcon = 'studentIcon'.png;
final String stuffIcon = 'stuffIcon'.png;
final String absenticon = 'absenticon'.png;
final String presenticon = 'presenticon'.png;
final String edit = 'edit'.png;


/// jpgs
final String pic1 = 'pic1'.jpg;
final String pic2 = 'pic2'.jpg;
final String pic3 = 'pic3'.jpg;
final String pic4 = 'pic4'.jpg;
final String pic5 = 'pic5'.jpg;
final String pic6 = 'pic6'.jpg;

/// svgs

/// extensions
extension ImageExtension on String {
  // png paths
  String get png => '$basePngPath$this.png';
  // svgs path
  String get svg => '$baseSvgPath$this.svg';
  // jpgs path
  String get jpg => '$baseJpgPath$this.jpg';
}
