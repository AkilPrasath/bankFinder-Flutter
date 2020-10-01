import 'package:bank_finder/data/moor_database.dart';
import 'package:bank_finder/getit_service.dart';
import 'package:clipboard_manager/clipboard_manager.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'custom_icon_button.dart';

class CustomExpandableListTile extends StatelessWidget {
  const CustomExpandableListTile({
    @required this.bankrecord,
    @required this.parentContext,
    Key key,
  }) : super(key: key);
  final Bankrecord bankrecord;
  final BuildContext parentContext;
  TextStyle _headingStyle() {
    return GoogleFonts.workSans(
      fontWeight: FontWeight.w700,
      color: Colors.grey[850],
    );
  }

  Future<bool> deleteDialog(context) async {
    return await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Confirm Delete"),
          content: Text("Do you want to delete this bank from your favorites?"),
          actions: [
            FlatButton(
              child: Text("No, I've changed my mind"),
              onPressed: () {
                Navigator.pop(context, false);
              },
            ),
            FlatButton(
              key: Key("confirm_remove_favourite_button"),
              child: Text("Yes, Delete anyways"),
              onPressed: () async {
                await locator<AppDatabase>().deleteBank(bankrecord);
                Navigator.pop(context, true);
              },
            ),
          ],
          actionsPadding: EdgeInsets.all(0),
          contentPadding: EdgeInsets.only(left: 24, right: 18, top: 16),
          buttonPadding: EdgeInsets.all(8),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
      child: Card(
        child: ExpansionTile(
          backgroundColor: Colors.white70,
          leading: CircleAvatar(
            child: Text("${bankrecord.name.substring(0, 1)}"),
          ),
          title: Text("${bankrecord.name}"),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              "${bankrecord.branch} Branch",
              style: TextStyle(
                fontSize: 13,
              ),
            ),
          ),
          onExpansionChanged: (isExpanded) {
            FocusScope.of(parentContext).unfocus();
          },
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          "IFSC       ",
                          style: GoogleFonts.workSans(
                            fontWeight: FontWeight.w700,
                            color: Colors.grey[850],
                          ),
                        ),
                        Text(
                          "${bankrecord.ifsc}",
                          key: Key("ifsc"),
                        ),
                        Spacer(),
                        CustomIconButton(
                          key: Key("copy_clipboard_button " + bankrecord.ifsc),
                          iconData: Icons.content_copy,
                          iconColor: Colors.grey[500],
                          onTap: () async {
                            //TODO copy to clipboard
                            final snackBar = SnackBar(
                                duration: Duration(seconds: 2),
                                content: Text('Text Copied to Clipboard!'));
                            await ClipboardManager.copyToClipBoard(
                                bankrecord.toJsonString());
                            Scaffold.of(parentContext).showSnackBar(snackBar);
                          },
                        ),
                        CustomIconButton(
                          key: Key(
                              "remove_favourites_button " + bankrecord.ifsc),
                          iconData: Icons.delete_outline,
                          iconColor: Colors.red,
                          onTap: () async {
                            bool isdeleted = await deleteDialog(context);
                            if (isdeleted) {
                              Scaffold.of(parentContext).showSnackBar(
                                SnackBar(
                                  duration: Duration(seconds: 1),
                                  content: Text("Removed from Favourites!"),
                                ),
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          "Branch   ",
                          style: _headingStyle(),
                        ),
                        Text("${bankrecord.branch}"),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Address ",
                          style: _headingStyle(),
                        ),
                        Flexible(
                          child: Text(
                            "${bankrecord.address}",
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          "Contact ",
                          style: _headingStyle(),
                        ),
                        Text("${bankrecord.contact ?? "NA"}"),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          "City        ",
                          style: _headingStyle(),
                        ),
                        Text("${bankrecord.city}"),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          "District  ",
                          style: _headingStyle(),
                        ),
                        Text("${bankrecord.district}"),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          "State     ",
                          style: _headingStyle(),
                        ),
                        Text("${bankrecord.state}"),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Wrap(
                      children: [
                        bankrecord.imps
                            ? Chip(
                                label: Text(
                                  "IMPS",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              )
                            : SizedBox(),
                        SizedBox(
                          width: 8,
                        ),
                        bankrecord.neft
                            ? Chip(
                                label: Text(
                                  "NEFT",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              )
                            : SizedBox(),
                        SizedBox(
                          width: 8,
                        ),
                        bankrecord.rtgs
                            ? Chip(
                                label: Text(
                                  "RTGS",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              )
                            : SizedBox(),
                        SizedBox(
                          width: 8,
                        ),
                        bankrecord.upi
                            ? Chip(
                                label: Text(
                                  "UPI",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              )
                            : SizedBox(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
