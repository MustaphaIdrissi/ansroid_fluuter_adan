import 'dart:convert';
import 'package:adan/timedalate.dart';
import 'package:http/http.dart' as http;

class HTTPHandler {
  // var url =
  //     "http://api.aladhan.com/v1/timingsByCity/16-12-2023?city=azrou&country=Maroc&method=8";
  // Future<List<Timesalate>> fetchData() async {
  //   List<Timesalate> gfff = [];
  //   var respond = await http.get(Uri.parse(url));
  //   if (respond.statusCode == 200) {
  //     var data = jsonDecode(respond.body);
  //     for (Map<String, dynamic> d in data) {
  //       Timesalate photo = Timesalate.fromJSON(d);
  //       gfff.add(photo);
  //     }
  //     return gfff;
  //   } else {
  //     throw Exception('${respond.statusCode}');
  //   }
  // }
}
