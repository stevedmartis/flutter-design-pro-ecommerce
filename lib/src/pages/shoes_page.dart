import 'package:design_qpp/src/helpers/helpers.dart';
import 'package:design_qpp/src/widgets/custom_widgets.dart';
import 'package:flutter/material.dart';

class ShoesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    changeStatusLight();
    
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(text: 'For you'),
          SizedBox(height: 20),

          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(

              children: [

            Hero(
              tag:'shoes-1',
              child: ShoesSizePreview()),
            ShoesDescriptionPage(
            titile: 'Nike Air Max 720',
            description:
                "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
          )

              ],
            ),),
          ),
            AddCartButton(ammount: 180.0)
        ],
      ),
    );
  }
}
