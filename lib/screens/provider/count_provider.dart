import 'package:flutter/cupertino.dart';

class CountProvider extends ChangeNotifier{
int _count=1;
int get count=> count;

void setcount(){
  _count++;
  notifyListeners();

}
}