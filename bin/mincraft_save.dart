import 'dart:io';
import 'package:mincraft_save/usb_saving.dart';
import 'package:mincraft_save/search_user.dart';

void main(List<String> arguments) async {
  var su = SearchUser();
  String user = await su.search();

  var us = UsbSaving(user);
  var usbs = await us.getUsbs();
  
  if (usbs.isEmpty) {
    print('I cannot find your USB, insert USB and try again');
    return;
  }
  // view
  print('You are using this USBs');
  var usbList = us.makeList(usbs);
  us.showList(usbList);

  // input usb choice
  print('Select a number which USB you want to work with: ');
  int choice = int.parse(stdin.readLineSync()!);

  //input copy select
  print('Select your choice of number: 1. copyToUsb or 2. copyToComputer: ');
  String select = stdin.readLineSync()!;

  // input save file select
    print('Select your file number: ');
    int selectFile = int.parse(stdin.readLineSync()!);

  if (select == '1') {
    var saves = await us.getSaveFiles();
    var savesList = us.makeList(saves);
    us.showList(savesList);

    print('Start...');
    us.copyToUsb(savesList.elementAt(selectFile), usbList.elementAt(choice));
    print('Finished!');
  } else if (select == '2') {
    var saves = await us.getSaveFiles();
    var savesList = us.makeList(saves);
    us.showList(savesList);

    print('Start...');
    us.copyToComputer(savesList.elementAt(selectFile), usbList.elementAt(choice));
    print('Finished!');
  }
}
