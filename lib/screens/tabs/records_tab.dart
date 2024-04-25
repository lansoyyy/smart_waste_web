import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:smart_waste_web/screens/tabs/user_records_page.dart';
import 'package:smart_waste_web/widgets/text_widget.dart';

class RecordsTab extends StatelessWidget {
  const RecordsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('Records').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
            return const Center(child: Text('Error'));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Padding(
              padding: EdgeInsets.only(top: 50),
              child: Center(
                  child: CircularProgressIndicator(
                color: Colors.black,
              )),
            );
          }

          final data = snapshot.requireData;
          return Padding(
            padding: const EdgeInsets.only(left: 20, top: 50),
            child: DataTable(
              showCheckboxColumn: false,
              border: TableBorder.all(),
              columnSpacing: 125,
              columns: [
                DataColumn(
                  label: TextWidget(
                    text: 'ID Number',
                    fontSize: 18,
                    fontFamily: 'Bold',
                  ),
                ),
                DataColumn(
                  label: TextWidget(
                    text: 'Name',
                    fontSize: 18,
                    fontFamily: 'Bold',
                  ),
                ),
                DataColumn(
                  label: TextWidget(
                    text: 'Item Name',
                    fontSize: 18,
                    fontFamily: 'Bold',
                  ),
                ),
                DataColumn(
                  label: TextWidget(
                    text: 'Equivalent Points',
                    fontSize: 18,
                    fontFamily: 'Bold',
                  ),
                ),
              ],
              rows: [
                for (int i = 0; i < data.docs.length; i++)
                  DataRow(
                      onSelectChanged: (value) {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const UserRecordsPage()));
                      },
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
                            text: data.docs[i]['myname'],
                            fontSize: 14,
                            fontFamily: 'Medium',
                            color: Colors.grey,
                          ),
                        ),
                        DataCell(
                          TextWidget(
                            text: data.docs[i]['name'],
                            fontSize: 14,
                            fontFamily: 'Medium',
                            color: Colors.grey,
                          ),
                        ),
                        DataCell(
                          TextWidget(
                            text: '${data.docs[i]['pts']} pts',
                            fontSize: 14,
                            fontFamily: 'Medium',
                            color: Colors.grey,
                          ),
                        ),
                      ])
              ],
            ),
          );
        });
  }
}
