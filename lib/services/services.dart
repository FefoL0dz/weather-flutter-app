import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weatherApp/models/comment.dart';

Future<List<Comment>> getCommentsFromApi(int start, int limit) async {
  final url_ = 'https://jsonplaceholder.typicode.com/comments';
  final url = 'https://jsonplaceholder.typicode.com/comments?_start=$start&_limit=$limit';

  final http.Client httpClient = http.Client();
  List<Comment> comments = List<Comment>();
  try {
    final response = await httpClient.get(url);
    if (response.statusCode == 200) {
      final responseData = json.decode(response.body) as List;
       comments = responseData.map((comment) {
        return Comment(id: comment['id'],
        name: comment['name'],
        email: comment['email'],
        body: comment['body']
        );
      }).toList();
      return comments;
    } else {
      return comments;
    }
  } catch(exception) {
    return comments;
  }
}