import 'package:flutter/material.dart';

class MyRadioButton extends StatelessWidget {
  const MyRadioButton({super.key, required this.isSelectedUp});
  final bool isSelectedUp;
  @override
  Widget build(BuildContext context) {
    //final isSelected = useState(isSelectedUp);
    return Container(
      height: 24,
      width: 24,
      decoration: BoxDecoration(
        border: Border.all(
          width: 3.0,
          color: isSelectedUp ? Colors.green.shade800 : Colors.grey.shade400,
        ),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: isSelectedUp
            ? Container(
                height: 12,
                width: 12,
                decoration: BoxDecoration(
                  color: isSelectedUp
                      ? Colors.green.shade800
                      : Colors.grey.shade400,
                  shape: BoxShape.circle,
                ),
              )
            : Container(),
      ),
    );
  }
}
