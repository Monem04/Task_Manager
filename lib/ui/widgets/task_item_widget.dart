import 'package:flutter/material.dart';

class taskItemWidget extends StatelessWidget {
  const taskItemWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 0,
      child: ListTile(
        tileColor: Colors.white,
        title: Text('Title will be here'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('temon kisu nh bal bujos nh dhon'),
            Text('01,02,2025'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.blue,
                  ),
                  child: const Text('New',style: TextStyle(
                    color: Colors.white,
                  ),),
                ),
                Row(
                  children: [
                    IconButton(onPressed: (){}, icon: Icon(Icons.delete)),
                    IconButton(onPressed: (){}, icon: Icon(Icons.edit)),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
