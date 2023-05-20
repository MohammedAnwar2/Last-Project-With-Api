import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:last_project_with_api/model/user_model.dart';

class UsersWidget extends StatelessWidget {
   UsersWidget({required this.users,Key? key}) : super(key: key);
  UserModel users;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: FancyShimmerImage(
            imageUrl: users.avatar,
            height: Get.height*.15,
            width: Get.width*.15,
            errorWidget: const Icon(IconlyBold.danger,color: Colors.red,size: 28,),
          )),
    //  leading: Image.network("https://i.ibb.co/vwB46Yq/shoew.png"),
      title: Text(users.name,style: GoogleFonts.aBeeZee(fontSize: 16,fontWeight: FontWeight.bold)),
      subtitle: Text(users.email),
      trailing: Text(users.role,style: GoogleFonts.aBeeZee(fontSize: 12,fontWeight: FontWeight.bold,color: Theme.of(context).colorScheme.secondary)),
    );
  }
}
