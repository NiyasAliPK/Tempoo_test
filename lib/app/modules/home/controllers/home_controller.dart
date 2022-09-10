import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tempo/app/data/models/employee_model.dart';

class HomeController extends GetxController {
  List<EmployeeModel> models = [];
  List<Map<String, dynamic>> recentList = [];

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  fetchData() async {
    models.clear();
    final response = await rootBundle.loadString('assets/json/employees.json');
    models = employeeModelFromJson(response);
    models.sort((a, b) {
      return a.firstName
          .toString()
          .toLowerCase()
          .compareTo(b.firstName.toString().toLowerCase());
    });
    update();
  }

  addToRecents({required EmployeeModel data}) {
    bool isfound = false;
    for (Map<String, dynamic> element in recentList) {
      final EmployeeModel temp = element['data'];
      if (temp.firstName!.toLowerCase().toString() ==
          data.firstName!.toLowerCase().toString()) {
        element['time'] = DateTime.now();
        isfound = true;
        break;
      }
    }
    if (isfound == true) {
      return;
    }

    final map = {"data": data, "time": DateTime.now()};
    recentList.add(map);
    log(DateTime.now().toString());
    update();
  }

  getRecentTime({required DateTime data}) {
    DateTime currentTime = DateTime.now();
    int diff = currentTime.minute - data.minute;
    if (diff <= 0) {
      diff = currentTime.second - data.second;
      return "$diff sec ago";
    }
    return "$diff min ago";
  }
}
