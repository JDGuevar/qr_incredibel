import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_incredibel/providers/scan_list_provider.dart';
import 'package:qr_incredibel/utils/utils.dart';

class ScanTiles extends StatelessWidget {

  final String tipo;

  const ScanTiles({Key? key, required this.tipo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScanListProvider scanListProvider = Provider.of<ScanListProvider>(context);
    final scans = scanListProvider.scans;

    return ListView.builder(itemCount: scans.length,
      itemBuilder: (_,index ) => Dismissible(
        key: UniqueKey(),
        background: Container(
          color: Colors.red,
          child: Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: const Icon(
                Icons.delete_forever, 
                color: Colors.white),
            ),
          ),),
        onDismissed: (DismissDirection direction) {
          Provider.of<ScanListProvider>(context, listen: false).borrarScanPorId(scans[index].id!);
        },
        child: ListTile(
          leading: Icon(this.tipo == 'http' ? Icons.home_outlined : Icons.map_outlined, color: Theme.of(context).primaryColor),
          title: Text(scans[index].valor),
          subtitle: Text(scans[index].id.toString()),
          trailing: const Icon(Icons.keyboard_arrow_right, color: Colors.grey),
          onTap: () => launchURL(context, scans[index]),
        ),
      ),
    );
  }
}