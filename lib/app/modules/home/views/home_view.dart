import 'package:azlistview/azlistview.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tempo/app/data/models/employee_model.dart';
import 'package:tempo/app/modules/details/views/details_view.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final HomeController _homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            'Contacts',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            Container(
              margin: EdgeInsets.all(5),
              width: 50,
              decoration: BoxDecoration(
                  color: Colors.lightBlue,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.edit,
                    color: Colors.white,
                  )),
            )
          ],
          leading: Container(
            margin: EdgeInsets.all(5),
            width: 60,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/avatar.jpg'),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.all(Radius.circular(20))),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SafeArea(
              child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: 'Search',
                      contentPadding: const EdgeInsets.all(15),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30))),
                ),
                Container(
                    margin: EdgeInsets.only(top: 20),
                    width: 350,
                    height: 125,
                    child: GetBuilder<HomeController>(builder: (_) {
                      return _homeController.recentList.isEmpty
                          ? Center(
                              child: Text("Recently viewed",
                                  style: TextStyle(fontSize: 18)))
                          : ListView.separated(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: _homeController.recentList.length,
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return SizedBox(width: 20);
                              },
                              itemBuilder: (BuildContext context, int index) {
                                final EmployeeModel data =
                                    _homeController.recentList[index]['data'];
                                return Column(
                                  children: [
                                    Container(
                                      width: 75,
                                      height: 75,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  data.imageUrl.toString())),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20))),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 8.0, bottom: 8),
                                      child: Text(
                                        "${data.firstName.toString()} ${data.lastName.toString()}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Text(_homeController
                                        .getRecentTime(
                                            data: _homeController
                                                .recentList[index]['time'])
                                        .toString())
                                  ],
                                );
                              },
                            );
                    })),
                Container(
                    height: MediaQuery.of(context).size.height,
                    child: GetBuilder<HomeController>(builder: (_) {
                      return AzListView(
                          indexBarAlignment: Alignment.topRight,
                          indexBarHeight:
                              MediaQuery.of(context).size.height * 0.6,
                          data: _homeController.models,
                          itemCount: _homeController.models.length,
                          itemBuilder: (context, index) {
                            final employee = _homeController.models[index];
                            return Column(
                              children: [
                                ListTile(
                                  onTap: () {
                                    _homeController.addToRecents(
                                        data: employee);
                                    Get.to(() => DetailsView(),
                                        transition: Transition.leftToRight,
                                        arguments: employee);
                                  },
                                  leading: Container(
                                    width: 60,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                employee.imageUrl.toString()),
                                            fit: BoxFit.fill),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20))),
                                  ),
                                  title: Text(
                                    employee.firstName.toString(),
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  subtitle:
                                      Text(employee.contactNumber.toString()),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 80.0, right: 30.0),
                                  child: Divider(
                                    thickness: 2,
                                  ),
                                )
                              ],
                            );
                          });
                    })),
              ],
            ),
          )),
        ));
  }
}
