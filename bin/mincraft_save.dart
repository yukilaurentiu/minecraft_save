import 'dart:io';

void main(List<String> arguments) {
  Process.run('ls', ['/media/yuki/']).then((result) {
    String usb = result.stdout;
    if (usb.isEmpty) {
      print('I cannot find your USB, insert USB and try again');
    } else {
      print('You are using this USB');
      List arr = usb.split('\n');
      arr.removeLast();
      print(arr);
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

    // INTENSO/nUBUNTU 22_0
    // usb.forEach((u) => {print(u)});
    // stderr.write(result.stderr);
  });

  // print('Select your choice 1. copyToUsb or 2. copyToComputer: ');
  // String select = stdin.readLineSync()!;
  // if (select == '1') {
  //   copyToUsb();
  // } else if (select == '2') {
  //   copyToComputer();
  // }
  // copyToUsb();
  // copyToComputer();
}

void copyToUsb(String choice) {
  print('Start');
  Process.run('cp', [
    '-r',
    '/home/yuki/.minecraft/saves/test',
    '/media/yuki/$choice'
  ]).then((result) {
    stdout.write(result.stdout);
    stderr.write(result.stderr);
  });
}

void copyToComputer(String choice) {
  print('Start');
  Process.run('cp', [
    '-r',
    '/media/yuki/$choice/test',
    '/home/yuki/.minecraft/saves'
  ]).then((result) {
    stdout.write(result.stdout);
    stderr.write(result.stderr);
  });
}
