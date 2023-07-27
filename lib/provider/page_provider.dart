import 'package:flutter/material.dart';

class PageProvider with ChangeNotifier {
  int selectedPage;

  PageProvider(int page) : selectedPage = page;

  void setPage(int selPage) {
    selectedPage = selPage;
    notifyListeners();
  }
}
