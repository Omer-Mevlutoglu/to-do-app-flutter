// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class TodoCard extends StatelessWidget {
  const TodoCard({
    super.key,
    required this.vartitle,
    required this.stat,
    required this.myfunctochangestat,
    required this.thetaskindex,
    required this.deletetask,
  });
  final String vartitle;
  final bool stat;
  final Function myfunctochangestat;
  final int thetaskindex;
  final Function deletetask;
  // final bool color2;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        myfunctochangestat(thetaskindex);
        // setState(() {
        //   if (widget.stat == true) {
        //     widget.stat = false;
        //   } else if (widget.stat == false) {
        //     widget.stat = true;
        //   }
        // });
      },
      child: FractionallySizedBox(
        widthFactor: 0.92,
        child: Container(
          margin: EdgeInsets.only(top: 20),
          decoration: BoxDecoration(
              color: Colors.blueGrey, borderRadius: BorderRadius.circular(20)),
          padding: EdgeInsets.all(15),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              vartitle,
              style: TextStyle(
                fontSize: 22,
                color: stat?Colors.black87:Colors.white,
                decoration: stat?TextDecoration.lineThrough:TextDecoration.none,
              ),
            ),
            Row(
              children: [
                Icon(
                  stat ? Icons.check : Icons.close,
                  //  color: color2 ? Colors.green: Colors.red ,
                  color: stat ? Colors.green : Colors.red,
                ),
                IconButton(
                  onPressed: () {
                    deletetask(thetaskindex);
                  },
                  icon: Icon(Icons.delete),
                  color: Colors.grey[400],
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
