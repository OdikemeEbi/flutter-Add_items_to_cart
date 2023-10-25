import 'package:myfirstapp/services/post.dart';
import 'package:http/http.dart' as http;

class RemoteServices {
  Future<List<Post>?> getPosts() async {
    var client = http.Client();

    var uri = Uri.parse("https://jsonplaceholder.typicode.com/posts");
    var response = await client.get(uri);

    if (response.statusCode == 200) {
      // print(response.body);
      // print("the statusCode is ${response.statusCode}");
      var json = response.body;
      return postFromJson(json);
    }
    return null;
  }
}
