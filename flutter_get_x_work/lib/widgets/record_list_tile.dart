import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class record_list_tile extends StatelessWidget {
  const record_list_tile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: ListTile(
          leading: Text(DateFormat('EEE, MMM d').format(DateTime.now())),
          title: Align(
            alignment: Alignment.center,
            child: Text(
              '75',
              style: TextStyle(fontSize: 23),
            ),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
              IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
            ],
          ),
        ),
      ),
    );
  }
}
