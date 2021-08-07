import 'package:profilepage/models/videoData.dart';

class UserData {
  String profileImage;
  int numberOfVideos;
  int followers;
  int following;
  String name;
  String status;
  String email;
  List<VideoData> videoData;

  UserData(
      {required this.profileImage,
      required this.numberOfVideos,
      required this.followers,
      required this.following,
      required this.name,
      required this.status,
      required this.email,
      required this.videoData});
}
