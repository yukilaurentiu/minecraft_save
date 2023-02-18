// import 'dart:io';
import 'package:mincraft_save/usb_saving.dart';
import 'package:mincraft_save/search_user.dart';

void main(List<String> arguments) async {
  var su = SearchUser();
  String user = await su.search();

  var us = UsbSaving(user);
  us.start();
}
