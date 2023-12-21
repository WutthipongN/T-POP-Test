import 'package:flutter/material.dart';
import 'package:test/model/seat_model.dart';

class SeatWidget extends StatelessWidget {
  final Seats? seats;
  final VoidCallback? onTap;
  const SeatWidget({Key? key,this.seats,this.onTap}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 50,
        height: 50,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color:seats!.status == "available" ? Colors.grey.shade200:Colors.orange,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: seats!.status == "available" ? Colors.grey.shade200:Colors.orange),
        ),
      ),
    );
  }
}
