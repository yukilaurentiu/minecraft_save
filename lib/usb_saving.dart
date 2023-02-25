import 'dart:io';

class UsbSaving {
  String _user = '';

// makes 'user' is accessible anywhere inside in class
  UsbSaving(String user) {
    _user = user;
  }

  Future<String> getUsbs() async {
    var result = await Process.run('ls', ['/media/$_user/']);
    String usbs = result.stdout;
    return usbs;
  }

  // void start() {
  //   Process.run('ls', ['/media/$_user/']).then((result) {
  //     String usb = result.stdout;
  //     if (usb.isEmpty) {
  //       print('I cannot find your USB, insert USB and try again');
  //     } else {
  //       print('You are using this USBs');
  //       var t = makeList(usb);
  //       print('Type a which USB you want to work with: ');
  //       int choice = int.parse(stdin.readLineSync()!);
  //       print(
  //           'Select your choice of number: 1. copyToUsb or 2. copyToComputer: ');
  //       String select = stdin.readLineSync()!;
  //       if (select == '1') {
  //         copyToUsb(t.elementAt(choice));
  //       } else if (select == '2') {
  //         copyToComputer(t.elementAt(choice));
  //       }
  //     }
  //   });
  // }

  List<String> makeList(String items) {
    List<String> arr = items.split('\n');
    arr.removeLast();
    return arr;
  }

  void showList(List<String> arr) {
    for (var i = 0; i < arr.length; i++) {
      print('$i: ${arr[i]}');
    }
  }

  Future<String> getSaveFiles() async {
    var result = await Process.run('ls', ['/home/$_user/.minecraft/saves/']);
    String saves = result.stdout;
    return saves;
  }

   Future<String> getSaveFilesComputer(String choiceUsb) async {
    var result = await Process.run('ls', ['/media/$_user/$choiceUsb']);
    String saves = result.stdout;
    return saves;
  }

  void copyToUsb(String selectSave, String choiceUsb) async {
    // Process.run('ls', ['/home/$_user/.minecraft/saves/']).then((result) {
    //   String saves = result.stdout;
    //   var t = makeList(saves);
    //   print('Select your choice of number: ');
    //   int select = int.parse(stdin.readLineSync()!);

      // print('Start...');
      var result = await Process.run('cp', [
        '-r',
        '/home/$_user/.minecraft/saves/$selectSave',
        '/media/$_user/$choiceUsb'
      ]); 
        stdout.write(result.stdout);
        stderr.write(result.stderr);
  }

  void copyToComputer(String selectSave, String choiceUsb) async {
    var result = await Process.run('cp', [
      '-r',
      '/media/$_user/$choiceUsb/$selectSave',
      '/home/$_user/.minecraft/saves'
    ]);
      stdout.write(result.stdout);
      stderr.write(result.stderr);
  }
}
