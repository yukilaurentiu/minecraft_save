// import 'package:mincraft_save/menu.dart';
import 'package:mcsaver_package/mcsaver_package.dart';

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