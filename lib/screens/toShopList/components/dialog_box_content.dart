import 'package:flutter/material.dart';
import 'package:fyp_frontend/screens/toShopList/components/toShop_input_form.dart';

import '../../../constants.dart';

class DialogBoxContent extends StatefulWidget {
  const DialogBoxContent({Key? key}) : super(key: key);

  @override
  _CustomDialogBoxState createState() => _CustomDialogBoxState();
}

class _CustomDialogBoxState extends State<DialogBoxContent> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        const ToShopInputForm(hint: "Product Name"),
        Center(
          child: SizedBox(
            width: 100,
            height: 40,
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor, shape: const StadiumBorder()),
              child: const Text("Add"),
            ),
          ),
        ),
      ],
    );
  }
}
