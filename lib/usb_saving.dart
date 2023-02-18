import 'dart:io';

class UsbSaving {
  String _user = '';

// makes 'user' is accessible anywhere inside in class
  UsbSaving(String user) {
    _user = user;
  }

  void start() {
    Process.run('ls', ['/media/$_user/']).then((result) {
      String usb = result.stdout;
      if (usb.isEmpty) {
        print('I cannot find your USB, insert USB and try again');
      } else {
        print('You are using this USBs');
        var t = makeList(usb);
        print('Type a which USB you want to work with: ');
        int choice = int.parse(stdin.readLineSync()!);
        print('Select your choice of number: 1. copyToUsb or 2. copyToComputer: ');
        String select = stdin.readLineSync()!;
        if (select == '1') {
          copyToUsb(t.elementAt(choice));
        } else if (select == '2') {
          copyToComputer(t.elementAt(choice));
        }
      }
    });
  }

  List<String> makeList(String items) {
    List<String> arr = items.split('\n');
    arr.removeLast();
    for(var i = 0; i < arr.length; i++) {
      print('$i: ${arr[i]}');
    }
    return arr;
  }

  void copyToUsb(String choice) {
    Process.run( 'ls', ['/home/$_user/.minecraft/saves/']).then((result) {
      String saves = result.stdout;
      var t = makeList(saves);
      print('Select your choice of number: ');
      int select = int.parse(stdin.readLineSync()!);

      print('Start...');
      Process.run('cp', [
        '-r',
        '/home/$_user/.minecraft/saves/${t.elementAt(select)}',
        '/media/$_user/$choice'
      ]).then((result) {
        stdout.write(result.stdout);
        stderr.write(result.stderr);
        print('Finished!');
      });
    });

  }

  void copyToComputer(String choice) {
    print('Start...');
    Process.run('cp', [
      '-r',
      '/media/$_user/$choice/test',
      '/home/$_user/.minecraft/saves'
    ]).then((result) {
      stdout.write(result.stdout);
      stderr.write(result.stderr);
      print('Finished!');
    });
  }
}
