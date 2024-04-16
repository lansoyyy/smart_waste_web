import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:smart_waste_web/screens/login_screen.dart';
import 'package:smart_waste_web/screens/tabs/records_tab.dart';

import '../utlis/colors.dart';
import '../widgets/text_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool inrecords = true;
  bool initems = false;

  bool inqrcode = false;
  bool intickets = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Card(
              child: SizedBox(
                width: 300,
                height: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: primary),
                              shape: BoxShape.circle,
                              color: Colors.white),
                          child: Padding(
                            padding: const EdgeInsets.all(2.5),
                            child: Image.asset(
                              'assets/images/logo.png',
                              height: 50,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        TextWidget(
                          text: 'Administrator',
                          fontFamily: 'Bold',
                          fontSize: 16,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ListTile(
                      tileColor: inrecords ? primary : Colors.transparent,
                      onTap: () {
                        setState(() {
                          inrecords = true;
                          initems = false;
                          inqrcode = false;
                          intickets = false;
                        });
                      },
                      title: TextWidget(
                        text: 'Records',
                        fontSize: 18,
                        color: inrecords ? Colors.white : Colors.grey,
                        fontFamily: 'Bold',
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ListTile(
                      tileColor: initems ? primary : Colors.transparent,
                      onTap: () {
                        setState(() {
                          inrecords = false;
                          initems = true;
                          inqrcode = false;
                          intickets = false;
                        });
                      },
                      title: TextWidget(
                        text: 'Items',
                        fontSize: 18,
                        color: initems ? Colors.white : Colors.grey,
                        fontFamily: 'Bold',
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ListTile(
                      tileColor: inqrcode ? primary : Colors.transparent,
                      onTap: () {
                        setState(() {
                          inrecords = false;
                          initems = false;
                          inqrcode = true;
                          intickets = false;
                        });
                      },
                      title: TextWidget(
                        text: 'QR Code',
                        fontSize: 18,
                        color: inqrcode ? Colors.white : Colors.grey,
                        fontFamily: 'Bold',
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ListTile(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  title: const Text(
                                    'Logout Confirmation',
                                    style: TextStyle(
                                        fontFamily: 'QBold',
                                        fontWeight: FontWeight.bold),
                                  ),
                                  content: const Text(
                                    'Are you sure you want to Logout?',
                                    style: TextStyle(fontFamily: 'QRegular'),
                                  ),
                                  actions: <Widget>[
                                    MaterialButton(
                                      onPressed: () =>
                                          Navigator.of(context).pop(true),
                                      child: const Text(
                                        'Close',
                                        style: TextStyle(
                                            fontFamily: 'QRegular',
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    MaterialButton(
                                      onPressed: () async {
                                        Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const LoginScreen()));
                                      },
                                      child: const Text(
                                        'Continue',
                                        style: TextStyle(
                                            fontFamily: 'QRegular',
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ));
                      },
                      title: TextWidget(
                        text: 'Logout',
                        fontSize: 18,
                        color: Colors.grey,
                        fontFamily: 'Bold',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 1000,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(
                        width: 50,
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: TextWidget(
                          text: DateFormat('MMMM dd, yyyy | hh:mm a')
                              .format(DateTime.now()),
                          fontSize: 14,
                          fontFamily: 'Bold',
                          color: primary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  inrecords ? const RecordsTab() : const SizedBox()
                  //         ? const EnforcerTab()
                  //         : intickets
                  //             ? const TicketsTab()
                  //             : const ParkingTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
