import 'dart:async';

import 'package:bank_finder/data/client_service.dart';
import 'package:bank_finder/data/moor_database.dart';
import 'package:bank_finder/getit_service.dart';
import 'package:bank_finder/model/bank.dart';
import 'package:bank_finder/widgets/custom_expandableListTile.dart';
import 'package:bank_finder/widgets/custom_searchbar.dart';
import 'package:bank_finder/widgets/no_favourites.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DashBoard extends StatefulWidget {
  static String id = "dashboard";
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  Search searchStatus;
  double screenWidth;
  double screenHeight;
  FocusNode searchFocusNode;
  TextEditingController searchController;
  AppDatabase database;

  final RegExp ifscRegex = RegExp(r'^[A-Za-z]{4}0[A-Za-z0-9]{6}$');
  Connectivity connection;
  ConnectivityResult connectionState;
  StreamSubscription<ConnectivityResult> connectionStream;
  Client client;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchFocusNode = FocusNode();
    searchStatus = Search.inactive;
    searchController = TextEditingController();
    database = locator<AppDatabase>();
    connection = locator<Connectivity>();
    client = locator<Client>();
    connectionStream = connection.onConnectivityChanged.listen((event) {
      setState(() {
        connectionState = event;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    searchFocusNode.dispose();
    searchController.dispose();
    connectionStream.cancel();
  }

  TextStyle _headingStyle() {
    return GoogleFonts.workSans(
      fontWeight: FontWeight.w700,
      color: Colors.grey[850],
    );
  }

  notFoundAlert(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          key: Key("Bank Not Found"),
          title: Text("Bank Not Found"),
          content: Text("No Banks found for the entered IFSC code."),
          actions: [
            FlatButton(
              child: Text("Ok"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
          actionsPadding: EdgeInsets.all(0),
          contentPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          buttonPadding: EdgeInsets.all(8),
        );
      },
    );
  }

  Future<bool> searchResultAlert(Bank bank, BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Row(
            children: [
              Icon(Icons.account_balance),
              SizedBox(
                width: 10,
              ),
              Text(
                "Bank Found",
                key: Key("Bank Found"),
              ),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      "Bank\nName  ",
                      style: GoogleFonts.workSans(
                        fontWeight: FontWeight.w700,
                        color: Colors.grey[850],
                      ),
                    ),
                    Flexible(child: Text("${bank.name}")),
                  ],
                ),
              ),
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
                    Flexible(
                      child: Text("${bank.ifsc}"),
                      key: Key('ifsc_bank_text'),
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
                    Flexible(child: Text("${bank.branch}")),
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
                        "${bank.address}",
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
                      "City        ",
                      style: _headingStyle(),
                    ),
                    Flexible(child: Text("${bank.city}")),
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
                    Flexible(
                      child: Text("${bank.state}"),
                    ),
                  ],
                ),
              ),
            ],
          ),
          actions: [
            FlatButton(
                onPressed: () {
                  Navigator.pop(context, false);
                },
                child: Text("Close")),
            FlatButton(
                key: Key('Add_to_favourites_button'),
                onPressed: () {
                  Navigator.pop(context, true);
                },
                child: Text("Add to Favourites")),
          ],
        );
      },
      barrierDismissible: false,
    );
  }

  showIfscDetails(context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("IFSC"),
          content: Text(
              "Format: ABCDxxxxxxx\n\n• \"ABCD\" is the Bank Code\n\n• \"xxxxxxx\" is a 7 digit character code which is unique to each branch"),
          actions: [
            FlatButton(
              child: Text("Ok"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
          actionsPadding: EdgeInsets.all(0),
          contentPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          buttonPadding: EdgeInsets.all(8),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 24.0, bottom: 24, left: 16, right: 16),
                child: Text(
                  "Find My Bank",
                  style: GoogleFonts.suezOne(
                    fontSize: 30,
                    color: Colors.blueGrey[900],
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Builder(builder: (context) {
                return CustomSearchBar(
                  parentContext: context,
                  controller: searchController,
                  screenWidth: screenWidth,
                  searchStatus: searchStatus,
                  searchFocusNode: searchFocusNode,
                  onTap: () {
                    setState(() {
                      searchStatus = (searchStatus == Search.active)
                          ? Search.inactive
                          : Search.active;
                    });

                    if (searchStatus == Search.active) {
                      searchFocusNode.requestFocus();
                    } else {
                      searchController.clear();
                      searchFocusNode.unfocus();
                    }
                  },
                  onChanged: !isTest
                      ? null
                      : (code) async {
                          if (ifscRegex.hasMatch(code)) {
                            if (ifscRegex.hasMatch(code)) {
                              if (connectionState != ConnectivityResult.none) {
                                Bank bank = await client.sendRequest(code);
                                if (bank != null) {
                                  bool toFavourites =
                                      await searchResultAlert(bank, context);
                                  if (toFavourites) {
                                    bool added = await bank.saveToFavourites();
                                    if (added) {
                                      Scaffold.of(context).showSnackBar(SnackBar(
                                          content: Text(
                                              "Bank Added to Favourites!")));
                                    } else {
                                      Scaffold.of(context).showSnackBar(SnackBar(
                                          content: Text(
                                              "Already added to Favourites!")));
                                    }
                                  }
                                } else {
                                  notFoundAlert(context);
                                }
                              } else {
                                Scaffold.of(context).showSnackBar(SnackBar(
                                  content: Text(
                                      "Please check your internet connection"),
                                ));
                              }
                            } else {
                              Scaffold.of(context).showSnackBar(
                                SnackBar(
                                  key: Key("invalid snackbar"),
                                  content: Text("Please check the IFSC format"),
                                  duration: Duration(seconds: 4),
                                  action: SnackBarAction(
                                    label: "Details",
                                    onPressed: () {
                                      showIfscDetails(context);
                                    },
                                  ),
                                ),
                              );
                            }
                          }
                        },
                  onSubmitted: (String code) async {
                    searchController.clear();
                    //TODO clean this
                    if (ifscRegex.hasMatch(code)) {
                      if (connectionState != ConnectivityResult.none) {
                        Bank bank = await client.sendRequest(code);
                        if (bank != null) {
                          bool toFavourites =
                              await searchResultAlert(bank, context);
                          if (toFavourites) {
                            bool added = await bank.saveToFavourites();
                            if (added) {
                              Scaffold.of(context).showSnackBar(SnackBar(
                                  content: Text("Bank Added to Favourites!")));
                            } else {
                              Scaffold.of(context).showSnackBar(SnackBar(
                                  content:
                                      Text("Already added to Favourites!")));
                            }
                          }
                        } else {
                          notFoundAlert(context);
                        }
                      } else {
                        Scaffold.of(context).showSnackBar(SnackBar(
                          content:
                              Text("Please check your internet connection"),
                        ));
                      }
                    } else {
                      Scaffold.of(context).showSnackBar(
                        SnackBar(
                          key: Key("invalid snackbar"),
                          content: Text("Please check the IFSC format"),
                          duration: Duration(seconds: 4),
                          action: SnackBarAction(
                            label: "Details",
                            onPressed: () {
                              showIfscDetails(context);
                            },
                          ),
                        ),
                      );
                    }
                  },
                );
              }),
              StreamBuilder<List<Bankrecord>>(
                  stream: database.getBanks(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting ||
                        snapshot.connectionState == ConnectionState.none) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (snapshot.connectionState == ConnectionState.active &&
                        snapshot.data.length == 0) {
                      return NoFavourites();
                    }
                    return Expanded(
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Card(
                                color: Colors.deepPurple.withOpacity(0.5),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: Text(
                                          "Favorites",
                                          style: GoogleFonts.montserrat(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      Icon(
                                        Icons.favorite,
                                        color: Colors.red,
                                        size: 15,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: ListView.builder(
                              key: Key("bankList"),
                              physics: BouncingScrollPhysics(),
                              itemCount: snapshot.data.length,
                              itemBuilder: (context, index) {
                                return Builder(builder: (context) {
                                  return CustomExpandableListTile(
                                      key: Key(snapshot.data[index].ifsc),
                                      parentContext: context,
                                      bankrecord: snapshot.data[index]);
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
