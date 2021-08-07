import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:profilepage/helper/userDataHelper.dart';
// import 'package:profilepage/models/userData.dart';
// import 'package:profilepage/models/videoData.dart';
import 'package:video_player/video_player.dart';
import 'package:google_fonts/google_fonts.dart';

class AlternateProfilePage extends StatefulWidget {
  const AlternateProfilePage({Key? key}) : super(key: key);

  @override
  _AlternateProfilePageState createState() => _AlternateProfilePageState();
}

class _AlternateProfilePageState extends State<AlternateProfilePage> {
  List<VideoPlayerController> listcontroller = [];
  CustomData customeData = CustomData();

  // List<VideoData> video = [
  //   VideoData(
  //     id: '1',
  //     videoLink:
  //         'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
  //     link:
  //         'https://images.unsplash.com/photo-1576678927484-cc907957088c?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
  //     views: '128',
  //   ),
  //   VideoData(
  //       id: '1',
  //       videoLink:
  //           'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
  //       link:
  //           'https://images.unsplash.com/photo-1576678927484-cc907957088c?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
  //       views: '128'),
  //   VideoData(
  //       id: '1',
  //       videoLink:
  //           'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
  //       link:
  //           'https://images.unsplash.com/photo-1576678927484-cc907957088c?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
  //       views: '128'),
  //   VideoData(
  //       id: '1',
  //       videoLink:
  //           'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
  //       link:
  //           'https://images.unsplash.com/photo-1576678927484-cc907957088c?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
  //       views: '128'),
  //   VideoData(
  //       id: '1',
  //       videoLink:
  //           'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
  //       link:
  //           'https://images.unsplash.com/photo-1576678927484-cc907957088c?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
  //       views: '128'),
  //   VideoData(
  //       id: '1',
  //       videoLink:
  //           'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
  //       link:
  //           'https://images.unsplash.com/photo-1576678927484-cc907957088c?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
  //       views: '128'),
  //   VideoData(
  //       id: '1',
  //       videoLink:
  //           'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
  //       link:
  //           'https://images.unsplash.com/photo-1576678927484-cc907957088c?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
  //       views: '128'),
  //   VideoData(
  //       id: '1',
  //       videoLink:
  //           'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
  //       link:
  //           'https://images.unsplash.com/photo-1576678927484-cc907957088c?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
  //       views: '128'),
  //   VideoData(
  //       id: '1',
  //       videoLink:
  //           'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
  //       link:
  //           'https://images.unsplash.com/photo-1576678927484-cc907957088c?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
  //       views: '128'),
  // ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    listcontroller =
        List.generate(customeData.userData[0].videoData.length, (index) {
      if (customeData.userData[0].videoData[index].videoLink.contains('http')) {
        return VideoPlayerController.network(
            customeData.userData[0].videoData[index].videoLink,
            videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true))
          // ..addListener(() {
          //   setState(() {});
          // })
          ..setLooping(true)
          ..initialize().then((_) {
            // controller.pause();
          });
      } else {
        return VideoPlayerController.asset(
            customeData.userData[0].videoData[index].videoLink,
            videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true))
          // ..addListener(() {
          //   setState(() {});
          // })
          ..setLooping(true)
          ..initialize().then((_) {
            // controller.pause();
          });
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    //controller.dispose();
    listcontroller.forEach((element) {
      element.dispose();
    });
  }

/////////////////////////////////////////////////////////
  ///widgets
  Widget details(var data, String type) {
    return Container(
      child: Column(
        children: <Widget>[
          Text(
            "$data",
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: Colors.black54,
            ),
          ),
          Text(
            '$type',
            style: GoogleFonts.poppins(fontSize: 11, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget buttonWidget(String buttonText) {
    return Expanded(
      child: GestureDetector(
        child: Container(
            // padding:
            //     EdgeInsets.symmetric(vertical: 5),
            height: 27,
            decoration: BoxDecoration(
              color: Color.fromRGBO(230, 83, 83, 1),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Center(
              child: Text(
                '$buttonText',
                style: GoogleFonts.poppins(color: Colors.white),
              ),
            )),
      ),
    );
  }

  Widget views(var views) {
    return Positioned(
      left: 12,
      bottom: 11,
      child: Row(
        children: [
          Stack(
            children: <Widget>[
              Container(
                height: 14,
                width: 20,
                color: Colors.transparent,
                padding: EdgeInsets.symmetric(horizontal: 3, vertical: 1),
                child: ClipOval(
                  child: Container(
                    height: 10,
                    width: 14,
                    color: Colors.white54,
                  ),
                ),
              ),
              Container(
                height: 14,
                width: 20,
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                color: Colors.transparent,
                child: ClipOval(
                  child: Container(
                    height: 8,
                    width: 10,
                    color: Colors.white60,
                  ),
                ),
              ),
              Container(
                  height: 14,
                  width: 20,
                  padding: EdgeInsets.symmetric(horizontal: 9, vertical: 6),
                  color: Colors.transparent,
                  child: Container(
                    color: Colors.black38,
                    child: Text(
                      ".",
                    ),
                  )),
            ],
          ),
          SizedBox(
            width: 0,
          ),
          Container(
            child: Text(
              "$views",
              style: TextStyle(color: Colors.white60, fontSize: 9),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        color: Colors.white,
        padding: EdgeInsets.only(
            top: (MediaQuery.of(context).padding.top), left: 14, right: 14),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                    child: Container(
                      height: 40,
                      child: Center(
                        child: Row(
                          children: <Widget>[
                            Stack(
                              children: [
                                Center(
                                  child: Icon(
                                    Icons.arrow_back_ios_new,
                                    size: 10,
                                    color: Color.fromRGBO(230, 83, 83, 1),
                                  ),
                                ),
                                Center(
                                  child: Container(
                                    margin: EdgeInsets.only(left: 3),
                                    height: 1,
                                    width: 17,
                                    color: Color.fromRGBO(230, 83, 83, 1),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              width: 7,
                            ),
                            Text(
                              'Back',
                              style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  color: Color.fromRGBO(230, 83, 83, 1)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              CircleAvatar(
                                radius: 6,
                                backgroundColor: Color.fromRGBO(230, 83, 83, 1),
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              CircleAvatar(
                                radius: 6,
                                backgroundColor:
                                    Color.fromRGBO(230, 150, 150, 0.6),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              CircleAvatar(
                                radius: 6,
                                backgroundColor:
                                    Color.fromRGBO(230, 150, 150, 0.6),
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              CircleAvatar(
                                radius: 6,
                                backgroundColor: Color.fromRGBO(230, 83, 83, 1),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          width: 2, color: Color.fromRGBO(230, 83, 83, 1)),
                      boxShadow: [
                        BoxShadow(
                          //color: Colors.greenAccent[200],
                          color: Colors.black26,
                          offset: const Offset(
                            5.0,
                            5.0,
                          ),
                          blurRadius: 20.0,
                          spreadRadius: 1.0,
                        ), //BoxShadow
                        //BoxShadow
                      ],
                    ),
                    child: CircleAvatar(
                      radius: 40,
                      backgroundColor: Color.fromRGBO(230, 119, 119, 1),
                      foregroundImage:
                          NetworkImage(customeData.userData[0].profileImage),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          //mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            details(customeData.userData[0].numberOfVideos,
                                'videos'),
                            details(
                                customeData.userData[0].followers, 'followers'),
                            details(
                                customeData.userData[0].following, 'following'),
                          ],
                        ),
                        SizedBox(height: 7),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 4),
              alignment: Alignment.centerLeft,
              child: Text(
                '${customeData.userData[0].name}',
                style: GoogleFonts.poppins(
                    fontSize: 16, fontWeight: FontWeight.w400),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text('${customeData.userData[0].status}',
                  style: GoogleFonts.poppins(fontSize: 7, color: Colors.grey)),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text('${customeData.userData[0].email}',
                  style: GoogleFonts.poppins(fontSize: 8, color: Colors.grey)),
            ),
            SizedBox(
              height: 2,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  buttonWidget('Follow'),
                  SizedBox(
                    width: 20,
                  ),
                  buttonWidget('Message'),
                ],
              ),
            ),
            Expanded(
              child: StaggeredGridView.countBuilder(
                crossAxisCount: 11,
                mainAxisSpacing: 5,
                itemCount: customeData.userData[0].videoData.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 0,
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24)),
                    child: Stack(
                      children: <Widget>[
                        GestureDetector(
                          child: Container(
                            color: Color.fromRGBO(230, 83, 83, 0.1),
                            width: double.infinity,
                            child: VideoPlayer(listcontroller[index]),
                          ),
                          onTap: () async {
                            print(
                                "play $index ${listcontroller[index].value.isPlaying}");
                            listcontroller.forEach((element) async {
                              if (listcontroller[index] != element) {
                                element.pause();
                              }
                            });
                            setState(() {
                              listcontroller[index].value.isPlaying
                                  ? listcontroller[index].pause()
                                  : listcontroller[index].play();
                            });
                            // }
                          },
                        ),
                        if (index < 5)
                          views(customeData.userData[0].videoData[index].views)
                      ],
                    ),
                  );
                },
                staggeredTileBuilder: (index) => StaggeredTile.count(
                    (index == 1 || index == 3)
                        ? 7
                        : (index == 0 ||
                                index == 2 ||
                                index == 4 ||
                                index == 5 ||
                                index == 7)
                            ? 4
                            : (index == 6)
                                ? 3
                                : 2,
                    (index == 1)
                        ? 8
                        : (index == 0 || index == 2)
                            ? 5
                            : (index == 3 ||
                                    index == 4 ||
                                    index == 5 ||
                                    index == 6 ||
                                    index == 7)
                                ? 3
                                : 2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
