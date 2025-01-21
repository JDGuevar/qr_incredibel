import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_incredibel/models/scan_model.dart';
import 'package:qr_incredibel/providers/scan_list_provider.dart';
import 'package:qr_incredibel/screens/qr_scanner_screen.dart';
import 'package:qr_incredibel/utils/utils.dart';

class ScanButton extends StatelessWidget {
  const ScanButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      child: const Icon(
        Icons.filter_center_focus,
      ),
      onPressed: () async {
        print('Botó polsat!');

        // Abre el escáner de código QR
        final String? scan = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const QRScannerScreen(),
          ),
        );

        if (scan != null) {
          final ScanListProvider scanListProvider =
              Provider.of<ScanListProvider>(context, listen: false);
          ScanModel nuevo = ScanModel(valor: scan);
          scanListProvider.nuevoScan(scan);
          launchURL(context, nuevo);
        }
      },
    );
  }
}
