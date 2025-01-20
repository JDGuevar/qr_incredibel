import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_incredibel/models/scan_model.dart';
import 'package:qr_incredibel/providers/db_provider.dart';
import 'package:qr_incredibel/providers/scan_list_provider.dart';

class ScanButton extends StatelessWidget {
  const ScanButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      child: const Icon(
        Icons.filter_center_focus,
      ),
      onPressed: () {
        print('Botó polsat!');

        String scan = 'geo://www.google.com';
      
        final ScanListProvider scanListProvider =
            Provider.of<ScanListProvider>(context, listen: false);
        scanListProvider.nuevoScan(scan);
      },
    );
  }
}
