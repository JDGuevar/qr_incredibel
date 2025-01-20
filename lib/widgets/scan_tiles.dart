import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_incredibel/providers/scan_list_provider.dart';

class ScanTiles extends StatelessWidget {

  final String tipo;

  const ScanTiles({Key? key, required this.tipo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScanListProvider scanListProvider = Provider.of<ScanListProvider>(context);
    final scans = scanListProvider.scans;

    return ListView.builder(itemCount: scans.length,
      itemBuilder: (_,index ) => ListTile(
        leading: Icon(this.tipo == 'http' ? Icons.home_outlined : Icons.map_outlined, color: Theme.of(context).primaryColor),
        title: Text(scans[index].valor),
        subtitle: Text(scans[index].id.toString()),
        trailing: const Icon(Icons.keyboard_arrow_right, color: Colors.grey),
        onTap: () => print(scans[index].id),
      ),
    );
  }
}