import 'dart:io';

class UsbSaving {
  String _user = '';

  UsbSaving(String user) {
    _user = user;
  }

  void start() {
    Process.run('ls', ['/media/$_user/']).then((result) {
      String usb = result.stdout;
      if (usb.isEmpty) {
        print('I cannot find your USB, insert USB and try again');
      } else {
        print('You are using this USB');
        makeListUsb(usb);
        print('Type which USB you want to work: ');
        String choice = stdin.readLineSync()!;
        print('Select your choice 1. copyToUsb or 2. copyToComputer: ');
        String select = stdin.readLineSync()!;
        if (select == '1') {
          copyToUsb(choice);
        } else if (select == '2') {
          copyToComputer(choice);
        }
      }
    });
  }

  void makeListUsb(String usbs) {
    List arr = usbs.split('\n');
    arr.removeLast();
    print(arr);
  }

  void copyToUsb(String choice) {
    print('Start...');
    Process.run('cp', [
      '-r',
      '/home/$_user/.minecraft/saves/test',
      '/media/$_user/$choice'
    ]).then((result) {
      stdout.write(result.stdout);
      stderr.write(result.stderr);
      print('Finished!');
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
