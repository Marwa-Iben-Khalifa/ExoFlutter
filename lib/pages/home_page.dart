import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:orange_valley_caa/models/video.dart';
import 'package:orange_valley_caa/sevices/video_api.dart';
import 'package:orange_valley_caa/utils/constants.dart';
import 'package:orange_valley_caa/utils/helper.dart';
import 'package:orange_valley_caa/widgets/videos_grid.dart';
//ignore: import_of_legacy_library_into_null_safe

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _selectedFilter = VideoSort.id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Orange Valley CAA'),
        backgroundColor: Colors.black,
        actions: [
          PopupMenuButton(
              onSelected: _onChangeFilter,
              icon: Icon(Icons.sort),
              offset: Offset(0, 100),
              itemBuilder: (context) => [
                    PopupMenuItem(
                        value: VideoSort.id, child: Text('Par défault')),
                    PopupMenuItem(
                        value: VideoSort.name, child: Text('Par nom')),
                    PopupMenuItem(
                        value: VideoSort.duration, child: Text('Par duré')),
                  ])
        ],
      ),
      body: Container(
        color: backgroundColor,
        child: FutureBuilder<List<Video>>(
            future: getVideoFromApi(filter: _selectedFilter),
            builder:
                (BuildContext context, AsyncSnapshot<List<Video>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting)
                return Center(child: CircularProgressIndicator());
              else if (snapshot.hasError)
                return Center(child: Text('Error: ${snapshot.error}'));
              else {
                Required videos;
                {
                  final List<Video> videos = snapshot.data ?? [];
                  return VideosGrid(videos: videos);
                }
              }
            }),
      ),
    );
  }

  void _onChangeFilter(VideoSort choice) {
    if (choice != _selectedFilter) {
      setState(() {
        _selectedFilter = choice;
      });
    }
  }
}
