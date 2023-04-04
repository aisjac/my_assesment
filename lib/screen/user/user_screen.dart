import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:my_assesment/screen/user/user_controller.dart';
import 'package:my_assesment/screen/user_details/user_details_screen.dart';

import '../../custom_list_item/user_list_item.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(
      init: UserController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.grey,
          appBar: AppBar(title: Text("User List")),

         body: ListView.builder(
        itemCount: controller.userList.length,
            padding: const EdgeInsets.all(15),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Get.to(() =>  UserDetailsScreen(data: controller.userList[index]));
                },
                child: UserListItem(
                  data: controller.userList[index],
                ),
              );
            }),
        );
      }
    );
  }
}
