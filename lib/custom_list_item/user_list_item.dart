import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../custom_widget/custom_network_image.dart';
import '../model/user_list_response.dart';

class UserListItem extends StatelessWidget {
  final UserListData? data;
  const UserListItem({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child:  Center(
                child: CustomNetworkImage(
                  networkImagePath: "${data?.image}",
                  placeHolderPath: "assets/images/placeholder.png",
                  height: 40,
                  width: 40,
                )),
          ),
          const SizedBox(height: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child:  Text(
                    "${data?.name}",
                    style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        fontSize: 16),
                  ),
                ),
                const SizedBox(height: 5),
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Text(
                        "${data?.address}" ?? "",
                        style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Text(
            "${data?.isApproved}",
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
