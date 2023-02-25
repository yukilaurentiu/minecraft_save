// import 'dart:io';
// import 'package:mincraft_save/usb_saving.dart';
// import 'package:mincraft_save/search_user.dart';
import 'package:mincraft_save/menu.dart';

void main(List<String> arguments) async {
 
  var menu = Menu();

  await menu.init();
  await menu.step1();
  await menu.step2();
  await menu.step3();
  


  if (menu.data.select == '1') {
    await menu.step4();
    await menu.step5();
    await menu.step6();
    
  } else if (menu.data.select == '2') {
    await menu.step7();
    await menu.step5();
    await menu.step8();
  }
  print('Finished!');
 }