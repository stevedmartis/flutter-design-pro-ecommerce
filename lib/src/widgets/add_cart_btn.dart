import 'package:design_qpp/src/widgets/custom_widgets.dart';
import 'package:flutter/material.dart';

class AddCartButton extends StatelessWidget {
  final double ammount;

  AddCartButton({ this.ammount });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.20),
          borderRadius: BorderRadius.circular(100)
        ),
        child: Row(
          children: [
            SizedBox(width: 20),
            Text('\$$ammount', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            Spacer(),
            BtnRounded(text: 'Add to cart',),
            SizedBox(width: 20)
          ],
        ),
      ),
    );
  }
}