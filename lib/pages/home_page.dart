import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:orange_valley_caa/models/video.dart';
import 'package:orange_valley_caa/sevices/video_api.dart';
import 'package:orange_valley_caa/utils/constants.dart';
import 'package:orange_valley_caa/widgets/videos_grid.dart';
//ignore: import_of_legacy_library_into_null_safe

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Orange Valley CAA'), backgroundColor: Colors.black),
      body: Container(
        color: backgroundColor,
        child: FutureBuilder(
            future: getVideoFromApi(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting)
                return Center(child: CircularProgressIndicator());
                else if (snapshot.hasError)
                  return Center(child: Text(snapshot.error));
              else {
                Required videos;
                return VideosGrid(videos: snapshot.data as List<Video>);
              }
              
            }),
      ),
    );
  }
}
