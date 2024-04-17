import 'package:flutter/material.dart';
import 'package:smart_waste_web/widgets/text_widget.dart';

class UserRecordsPage extends StatelessWidget {
  const UserRecordsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20, top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  elevation: 3,
                  child: SizedBox(
                    height: 300,
                    width: 300,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.account_circle,
                          size: 150,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextWidget(
                          text: 'John Doe',
                          fontSize: 24,
                          fontFamily: 'Bold',
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextWidget(
                          text: 'Total Points: 100pts',
                          fontSize: 18,
                          fontFamily: 'Bold',
                          color: Colors.grey,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextWidget(
                          text: 'Casisang, Malaybalay Bukidnon',
                          fontSize: 14,
                          fontFamily: 'Medium',
                          color: Colors.grey,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextWidget(
                          text: '09090104355',
                          fontSize: 14,
                          fontFamily: 'Medium',
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                DataTable(
                  showCheckboxColumn: false,
                  border: TableBorder.all(),
                  columnSpacing: 125,
                  columns: [
                    DataColumn(
                      label: TextWidget(
                        text: 'Item Redeem',
                        fontSize: 18,
                        fontFamily: 'Bold',
                      ),
                    ),
                    DataColumn(
                      label: TextWidget(
                        text: 'Date of Redeem',
                        fontSize: 18,
                        fontFamily: 'Bold',
                      ),
                    ),
                    DataColumn(
                      label: TextWidget(
                        text: 'Total of Redeem',
                        fontSize: 18,
                        fontFamily: 'Bold',
                      ),
                    ),
                  ],
                  rows: [
                    for (int i = 0; i < 10; i++)
                      DataRow(
                          color: MaterialStateColor.resolveWith(
                            (states) =>
                                i % 2 == 0 ? Colors.white : Colors.grey[200]!,
                          ),
                          cells: [
                            DataCell(
                              TextWidget(
                                text: '${i + 1}',
                                fontSize: 14,
                                fontFamily: 'Medium',
                                color: Colors.grey,
                              ),
                            ),
                            DataCell(
                              TextWidget(
                                text: DateTime.now().toString(),
                                fontSize: 14,
                                fontFamily: 'Medium',
                                color: Colors.grey,
                              ),
                            ),
                            DataCell(
                              TextWidget(
                                text: '1',
                                fontSize: 14,
                                fontFamily: 'Medium',
                                color: Colors.grey,
                              ),
                            ),
                          ])
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
