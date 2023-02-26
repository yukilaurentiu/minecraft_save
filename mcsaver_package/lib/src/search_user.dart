import 'dart:io';

class SearchUser {
  Future<String> search() async {
    var test = await Process.run('whoami', []);
    String user = username(test.stdout);
    return user;
  }

  String username(String name) {
    List user = name.split('\n');
    user.removeLast();
    return user[0];
  }
}
