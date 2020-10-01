import 'package:flutter/material.dart';

enum Search {
  active,
  inactive,
}

class CustomSearchBar extends StatelessWidget {
  CustomSearchBar({
    Key key,
    @required this.screenWidth,
    @required this.searchStatus,
    @required this.searchFocusNode,
    @required this.onTap,
    @required this.controller,
    @required this.onSubmitted,
    @required this.onChanged,
    @required this.parentContext,
  }) : super(key: key);

  final double screenWidth;
  final Search searchStatus;
  final FocusNode searchFocusNode;
  final Function onTap;
  final Function(String) onSubmitted, onChanged;
  final TextEditingController controller;
  final BuildContext parentContext;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(
          width: screenWidth,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
          child: AnimatedContainer(
            width: (searchStatus == Search.active) ? screenWidth : 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: (searchStatus == Search.active)
                  ? [
                      BoxShadow(
                        blurRadius: 4,
                        color: Colors.black26,
                      ),
                      BoxShadow(
                          blurRadius: 7,
                          color: Colors.black12,
                          spreadRadius: 7),
                    ]
                  : [],
              color: (searchStatus == Search.active)
                  ? Colors.white
                  : Colors.transparent,
            ),
            duration: Duration(milliseconds: 400),
            child: Container(
              height: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: TextField(
                      key: Key('search_box_textfield'),
                      controller: controller,
                      focusNode: searchFocusNode,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 8.0, bottom: 13),
                        disabledBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        hintText: "Enter IFSC code here",
                      ),
                      textInputAction: TextInputAction.search,
                      textCapitalization: TextCapitalization.characters,
                      onSubmitted: onSubmitted,
                      onChanged: onChanged,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        key: Key('search_button'),
                        borderRadius: BorderRadius.circular(20),
                        splashColor: Colors.black26,
                        onTap: onTap,
                        child: Icon(
                          Icons.search, color: Colors.blueGrey[900],
                          // size: 28,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
