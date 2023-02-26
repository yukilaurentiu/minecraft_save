// import 'dart:io';
// import 'package:mincraft_save/usb_saving.dart';
// import 'package:mincraft_save/search_user.dart';
import 'package:mincraft_save/menu.dart';

void main(List<String> arguments) async {
 
  var menu = Menu();

  await menu.init();
  await menu.stepCheckUsb();
  await menu.stepChooseUsb();
  await menu.stepSelectWhereToCopy();
  


  if (menu.data.select == '1') {
    await menu.stepShowfilesInComputer();
    await menu.stepSelectFile();
    await menu.stepSaveToUse();
    
  } else if (menu.data.select == '2') {
    await menu.stepShowfilesInUsb();
    await menu.stepSelectFile();
    await menu.stepSaveToComputer();
  }
  print('Finished!');
 }