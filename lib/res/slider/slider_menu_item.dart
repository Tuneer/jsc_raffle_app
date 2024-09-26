import 'package:flutter/material.dart';

class SliderMenuItem extends StatelessWidget {
  final String title;
  final IconData iconData;
  final Function(String)? onTap;

  const SliderMenuItem(
      {Key? key,
      required this.title,
      required this.iconData,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(title,
            style: const TextStyle(
                color: Colors.white70, fontFamily: 'BalsamiqSans_Regular')),
        leading: Icon(iconData, color: Colors.white70),
        onTap: () => onTap?.call(title));
  }
}
