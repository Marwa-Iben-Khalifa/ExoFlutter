import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:orange_valley_caa/models/video.dart';
import 'package:orange_valley_caa/utils/helper.dart';

Future<List<Video>> getVideoFromApi({VideoSort filter = VideoSort.id}) async {
  var url = Uri.https('www.orangevalleycaa.org',
      '/api/videos/order/${filter.filterEnumName()}', {'q': '{http}'});
  var response = await http.get(url);
  if (response.statusCode == 200) {
    var json = response.body;
    return videoFromJson(json);
  } else {
    return [];
  }
}
