import 'package:flutter/material.dart';

class SelectedSeatWidget extends StatelessWidget {
  final String? seatNumber;
  final VoidCallback? onTap;
  const SelectedSeatWidget({Key? key, this.seatNumber, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 40,
      padding: const EdgeInsets.all(10),
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            seatNumber!,
            style: TextStyle(color: Colors.white),
          ),
          GestureDetector(
              child: Icon(
                Icons.clear,
                color: Colors.white,
                size: 12,
              ),
              onTap: onTap),
        ],
      ),
    );
  }
}
