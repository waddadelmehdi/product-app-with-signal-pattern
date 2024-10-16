import 'package:flutter/material.dart';
import 'package:productapp/store/store.dart';
class DashBoard extends StatelessWidget {
  const DashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SingleChildScrollView(
        child: Row(
          children: [
            Card(
              child: Text("${store.products.value.length}"),
            )
          ],
        ),
      ),
    );
  }
}
