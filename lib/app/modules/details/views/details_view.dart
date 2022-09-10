import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tempo/app/data/models/employee_model.dart';
import 'package:tempo/app/modules/details/views/widgets/contact_buttons.dart';
import 'package:flutter/cupertino.dart';
import '../controllers/details_controller.dart';

class DetailsView extends GetView<DetailsController> {
  final EmployeeModel profile = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
          padding: EdgeInsets.only(right: 5),
          width: 60,
          decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back_ios_new,
                color: Colors.black,
              )),
        ),
        centerTitle: true,
      ),
      body: Scaffold(
        body: SafeArea(
            child: ListView(
          children: [
            Container(
              decoration: BoxDecoration(),
              height: 250,
              child: Column(
                children: [
                  SizedBox(height: 7),
                  Container(
                    margin: EdgeInsets.all(5),
                    padding: EdgeInsets.only(right: 5),
                    width: 110,
                    height: 110,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(profile.imageUrl.toString())),
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "${profile.firstName} ${profile.lastName}",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 6),
                  Text(
                    profile.contactNumber.toString(),
                    style: TextStyle(fontSize: 15, letterSpacing: 1),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(width: 20),
                      ContactButtons(
                          icon: CupertinoIcons.chat_bubble_text,
                          color: Color.fromARGB(255, 0, 190, 127)),
                      ContactButtons(
                          icon: CupertinoIcons.phone,
                          color: Color.fromARGB(255, 34, 153, 250)),
                      ContactButtons(
                          icon: CupertinoIcons.videocam,
                          color: Color.fromARGB(255, 247, 88, 77)),
                      ContactButtons(
                          iconColor: Colors.black,
                          icon: CupertinoIcons.mail,
                          color: Color.fromARGB(255, 213, 210, 230)),
                      SizedBox(width: 20),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              color: Color.fromARGB(255, 241, 241, 241),
              height: 35,
            ),
            Expanded(
                child: Column(
              children: [
                SizedBox(height: 20),
                Row(
                  children: [
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Mobile',
                          style: TextStyle(fontSize: 15),
                        ),
                        SizedBox(height: 5),
                        Text(
                          profile.contactNumber.toString(),
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    SizedBox(width: 180),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(CupertinoIcons.chat_bubble_text)),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(CupertinoIcons.phone),
                    )
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Email',
                          style: TextStyle(fontSize: 15),
                        ),
                        SizedBox(height: 5),
                        Text(
                          profile.email.toString(),
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Age',
                          style: TextStyle(fontSize: 15),
                        ),
                        SizedBox(height: 5),
                        Text(
                          profile.age.toString(),
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Address',
                          style: TextStyle(fontSize: 15),
                        ),
                        SizedBox(height: 5),
                        Text(
                          profile.address.toString(),
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Salary',
                          style: TextStyle(fontSize: 15),
                        ),
                        SizedBox(height: 5),
                        Text(
                          profile.salary.toString(),
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ))
          ],
        )),
      ),
    );
  }
}
