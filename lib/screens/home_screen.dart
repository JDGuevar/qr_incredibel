import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_incredibel/models/scan_model.dart';
import 'package:qr_incredibel/providers/db_provider.dart';
import 'package:qr_incredibel/providers/scan_list_provider.dart';
import 'package:qr_incredibel/providers/ui_provider.dart';
import 'package:qr_incredibel/screens/screens.dart';
import 'package:qr_incredibel/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Historial'),
        actions: [
          IconButton(
            icon: Icon(Icons.delete_forever),
            onPressed: () {},
          )
        ],
      ),
      body: _HomeScreenBody(),
      bottomNavigationBar: CustomNavigationBar(),
      floatingActionButton: ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomeScreenBody extends StatelessWidget {
  const _HomeScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Canviar per a anar canviant entre pantalles
    final uiProvider = Provider.of<UiProvider>(context);
    final currentIndex = uiProvider.selectedMenuOpt;

    final ScanListProvider scanListProvider =
        Provider.of<ScanListProvider>(context, listen: false);

    switch (currentIndex) {
      case 0:
      scanListProvider.cargarScansPorTipo('geo');
        return MapasScreen();

      case 1:
      scanListProvider.cargarScansPorTipo('http');  
        return DireccionsScreen();

      default:
      scanListProvider.cargarScansPorTipo('geo');
        return MapasScreen();
    }
  }
}
