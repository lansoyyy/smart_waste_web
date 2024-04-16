import 'package:flutter/material.dart';
import 'package:smart_waste_web/widgets/text_widget.dart';

class RecordsTab extends StatelessWidget {
  const RecordsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 50),
      child: DataTable(
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
              text: 'Address',
              fontSize: 18,
              fontFamily: 'Bold',
            ),
          ),
          DataColumn(
            label: TextWidget(
              text: 'Phone Number',
              fontSize: 18,
              fontFamily: 'Bold',
            ),
          ),
        ],
        rows: [
          for (int i = 0; i < 10; i++)
            DataRow(
                color: MaterialStateColor.resolveWith(
                  (states) => i % 2 == 0 ? Colors.white : Colors.grey[200]!,
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
                      text: 'John Doe',
                      fontSize: 14,
                      fontFamily: 'Medium',
                      color: Colors.grey,
                    ),
                  ),
                  DataCell(
                    TextWidget(
                      text: 'Impalambong, Malaybalay Bukidnon',
                      fontSize: 14,
                      fontFamily: 'Medium',
                      color: Colors.grey,
                    ),
                  ),
                  DataCell(
                    TextWidget(
                      text: '09090104355',
                      fontSize: 14,
                      fontFamily: 'Medium',
                      color: Colors.grey,
                    ),
                  ),
                ])
        ],
      ),
    );
  }
}
