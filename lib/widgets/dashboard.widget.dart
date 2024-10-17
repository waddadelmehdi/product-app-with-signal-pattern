import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:productapp/store/store.dart';
import 'package:productapp/widgets/Kpi.widget.dart';
import 'package:signals/signals_flutter.dart';
class DashBoard extends StatelessWidget {
  const DashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(10.0),
          margin: EdgeInsets.all(5.0),
          child: Text("DashBoard",style: GoogleFonts.nerkoOne(fontSize: 35,color: Colors.white),),

        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Card(
            color: Colors.white,
            child: Watch(
              (context)=>Row(
                children: [
                  Kpi(kpiValue: "Count:${store.products.value.length}"),
                  Kpi(kpiValue: "Selected:${store.selectedProducts}"),
                  Kpi(kpiValue: "Total:${store.totalPrices}")


                ],
              )

            ),
          ),
        ),
      ],
    );
  }
}
