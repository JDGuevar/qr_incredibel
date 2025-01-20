import 'package:flutter/material.dart';
import 'package:qr_incredibel/widgets/scan_tiles.dart';

class MapasScreen extends StatelessWidget {
  const MapasScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ScanTiles(tipo: 'geo'),
    );
  }
}
