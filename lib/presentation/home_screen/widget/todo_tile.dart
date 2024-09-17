import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {
  const TodoTile(
      {super.key,
      required this.id,
      required this.taskName,
      required this.taskDescription,
      required this.completed,
      required this.timestamp,
      required this.deleteFunction});

  final String id;
  final String taskName;
  final String taskDescription;
  final bool completed;
  final Timestamp timestamp;
  final Function(BuildContext) deleteFunction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              borderRadius: BorderRadius.circular(15),
              backgroundColor: Colors.red,
            ),
          ],
        ),
        child: Container(
          width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(20)),
            child: Text(
              taskName,
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontSize: 18
                //decorationColor: Colors.white,
                //decorationThickness: 3
              ),
            )),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';
//
// class TodoTile extends StatelessWidget {
//   const TodoTile({
//     super.key,
//     required this.taskName,
//     required this.taskCompleted,
//     required this.onChanged,
//     required this.deleteFunction,
//   });
//
//   final String taskName;
//   final bool taskCompleted;
//   final Function(bool?)? onChanged;
//   final Function(BuildContext)? deleteFunction;
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(
//         top: 20,
//         left: 20,
//         right: 20,
//         bottom: 0,
//       ),
//       child: Slidable(
//         endActionPane: ActionPane(
//           motion: StretchMotion(),
//           children: [
//             SlidableAction(
//               onPressed: deleteFunction,
//               icon: Icons.delete,
//               borderRadius: BorderRadius.circular(15),
//             ),
//           ],
//         ),
//         child: Container(
//           padding: const EdgeInsets.all(20),
//           decoration: BoxDecoration(
//             color: Colors.deepPurple,
//             borderRadius: BorderRadius.circular(15),
//           ),
//           child: Row(
//             children: [
//               Checkbox(
//                 value: taskCompleted,
//                 onChanged: onChanged,
//                 checkColor: Colors.black,
//                 activeColor: Colors.white,
//                 side: const BorderSide(
//                   color: Colors.white,
//                 ),
//               ),
//               Text(
//                 taskName,
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 18,
//                   decoration: taskCompleted
//                       ? TextDecoration.lineThrough
//                       : TextDecoration.none,
//                   decorationColor: Colors.white,
//                   decorationThickness: 2,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
