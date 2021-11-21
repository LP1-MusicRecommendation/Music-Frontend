import 'package:fluttertoast/fluttertoast.dart';

void showToast(String val){
  Fluttertoast.showToast(msg: val,toastLength: Toast.LENGTH_SHORT);
}