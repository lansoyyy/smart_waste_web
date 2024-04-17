import 'package:flutter/material.dart';
import 'package:smart_waste_web/screens/tabs/user_records_page.dart';
import 'package:smart_waste_web/widgets/button_widget.dart';
import 'package:smart_waste_web/widgets/text_widget.dart';
import 'package:smart_waste_web/widgets/textfield_widget.dart';
import 'package:smart_waste_web/widgets/toast_widget.dart';

class ItemsTab extends StatefulWidget {
  const ItemsTab({super.key});

  @override
  State<ItemsTab> createState() => _ItemsTabState();
}

class _ItemsTabState extends State<ItemsTab> {
  final name = TextEditingController();
  final pts = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 10),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: ButtonWidget(
              color: Colors.blue,
              height: 45,
              width: 150,
              label: 'Add Item',
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return Dialog(
                      child: SizedBox(
                        height: 400,
                        width: 400,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, right: 20, bottom: 10, top: 10),
                                child: Container(
                                  width: double.infinity,
                                  height: 150,
                                  decoration: const BoxDecoration(
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              TextFieldWidget(
                                controller: name,
                                label: 'Item Name:',
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFieldWidget(
                                controller: pts,
                                label: 'Required Points:',
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              ButtonWidget(
                                color: Colors.blue,
                                height: 45,
                                width: 150,
                                label: 'Add',
                                onPressed: () {
                                  showToast('Item added succesfully!');
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          DataTable(
            showCheckboxColumn: false,
            border: TableBorder.all(),
            columnSpacing: 125,
            columns: [
              DataColumn(
                label: TextWidget(
                  text: 'Item Number',
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
                  text: 'Quantity',
                  fontSize: 18,
                  fontFamily: 'Bold',
                ),
              ),
              DataColumn(
                label: TextWidget(
                  text: 'Actions',
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
                          text: 'Sardines',
                          fontSize: 14,
                          fontFamily: 'Medium',
                          color: Colors.grey,
                        ),
                      ),
                      DataCell(
                        TextWidget(
                          text: '5',
                          fontSize: 14,
                          fontFamily: 'Medium',
                          color: Colors.grey,
                        ),
                      ),
                      DataCell(
                        Row(
                          children: [
                            ButtonWidget(
                              color: Colors.blue,
                              height: 35,
                              width: 125,
                              label: 'Add',
                              onPressed: () {},
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            ButtonWidget(
                              color: Colors.red,
                              height: 35,
                              width: 125,
                              label: 'Delete',
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                    ])
            ],
          ),
        ],
      ),
    );
  }
}
