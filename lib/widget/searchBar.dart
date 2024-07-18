import 'package:flutter/material.dart';

import '../const/constants.dart';
import '../const/funcs.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({super.key});

  @override
  State<SearchBarWidget> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBarWidget> {
  @override
  Widget build(BuildContext context) {
    Dimensions.init(context);
    Size size = MediaQuery.of(context).size;
    return TextField(
      onChanged:(value){ setState(() {
        
      });} ,
      style: TextStyle(
          fontSize: getFontSize(15, size), color: appColors.black0001),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 12),
        hintText: "Search branch or name...",
        hintStyle: TextStyle(color: appColors.black0002),
        prefixIcon: Icon(
          Icons.search,
          color: appColors.black0001,
        ),
        fillColor: appColors.white0003,
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: appColors.black0001),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: appColors.white0001),
        ),
      ),
    );
  }
}
