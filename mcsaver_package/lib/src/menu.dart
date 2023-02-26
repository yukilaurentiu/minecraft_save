import 'dart:io';
import 'package:mcsaver_package/src/usb_saving.dart';
import 'package:mcsaver_package/src/data.dart';
import 'package:mcsaver_package/src/search_user.dart';


// controller and view
class Menu {

  Data data = Data();

  Future<void> init() async {
    var su = SearchUser();
    String user = await su.search();

    var us = UsbSaving(user);
    var usbs = await us.getUsbs();

    data.us = us;
    data.usbs = usbs;
  }

  Future<int> stepCheckUsb() async {
    if (data.usbs.isEmpty) {
      print('I cannot find your USB, insert USB and try again');
      return 0;
    }
    print('You are using this USBs');
    var usbList = data.us.makeList(data.usbs);
    data.us.showList(usbList);
    data.usbList = usbList;
    return 1;
  }

  // input usb choice
  Future<int> stepChooseUsb() async {
    print('Select a number which USB you want to work with: ');
    int choice = int.parse(stdin.readLineSync()!);
    data.choice = choice;
    return 1;
  }
  // input copy select
  Future<int> stepSelectWhereToCopy() async {
    print('Select your choice of number: 1. copyToUsb or 2. copyToComputer: ');
    String select = stdin.readLineSync()!;
    data.select = select;
    return 1;
  }

  // USB show save file 
  Future<int> stepShowfilesInComputer() async {
    var saves = await data.us.getSaveFiles();
    var savesList = data.us.makeList(saves);
    data.us.showList(savesList);
    data.savesList = savesList;
    return 1;
  }

  // USB input save file select
  Future<int> stepSelectFile() async {
    print('Select your file number: ');
    int selectFile = int.parse(stdin.readLineSync()!);
    data.selectFile = selectFile; 
    return 1;  
  }

  // USB save the data
  Future<int> stepSaveToUse() async {
    print('Start...');
    data.us.copyToUsb(
      data.savesList.elementAt(data.selectFile), 
      data.usbList.elementAt(data.choice)
    );
    return 1;
  }

  // Computer show save file 
  Future<int> stepShowfilesInUsb() async {
    var saves = await data.us.getSaveFilesComputer(
      data.usbList.elementAt(data.choice)
      );
    var savesList = data.us.makeList(saves);
    data.us.showList(savesList);
    data.savesList = savesList;
    return 1;
  }
  
  
  // Computer save the data 
  Future<int> stepSaveToComputer() async {
    print('Start...');
     data.us.copyToComputer(
      data.savesList.elementAt(data.selectFile), 
      data.usbList.elementAt(data.choice));
    return 1;
  }
}