import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:signals/signals_flutter.dart';

import '../store/store.dart';

class Kpi extends StatelessWidget {
  final String kpiValue;
  const Kpi({super.key,required this.kpiValue});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Card(
        color: Colors.lightBlue,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
                "${kpiValue}",
                style: GoogleFonts.nerkoOne(fontSize: 22,color: Colors.white)
            ),
          ),
        ),

    ) ;
  }
}
