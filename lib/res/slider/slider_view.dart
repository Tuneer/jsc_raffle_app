import 'package:flutter/material.dart';
import 'package:raffle_app/models/login/user_model.dart';

import '../../view_models/controller/user_preference/user_prefrence_view_model.dart';
import '../assets/image_assets.dart';
import 'menu.dart';
import 'slider_menu_item.dart';

class SliderView extends StatefulWidget {
  final Function(String)? onItemClick;

  const SliderView({Key? key, this.onItemClick}) : super(key: key);

  @override
  State<SliderView> createState() => _SliderViewState();
}

class _SliderViewState extends State<SliderView> {
  UserPreference userPreference = UserPreference();
  late String? userName;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    init();
  }

  Future<void> init() async {
    UserModel user = await userPreference.getUser();
    setState(() {
      userName = user.userName!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff44972c),
      padding: const EdgeInsets.only(top: 30),
      child: ListView(
        children: <Widget>[
          const SizedBox(
            height: 30,
          ),
          const CircleAvatar(
            radius: 62,
            backgroundColor: Colors.grey,
            child: CircleAvatar(
                radius: 60, backgroundImage: AssetImage(AppImages.defaultUser)),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            '$userName',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white70,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ...[
            Menu(Icons.home, 'Home'),
            Menu(Icons.person, 'Participating List'),
            Menu(Icons.format_list_numbered, 'Upload Steps'),
            Menu(Icons.receipt, 'Past Receipts'),
            Menu(Icons.logout, 'LogOut')
          ]
              .map((menu) => SliderMenuItem(
                  title: menu.title,
                  iconData: menu.iconData,
                  onTap: widget.onItemClick))
              .toList(),
        ],
      ),
    );
  }
}
