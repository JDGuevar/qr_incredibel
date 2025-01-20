import 'package:flutter/material.dart';
import 'package:qr_incredibel/models/scan_model.dart';
import 'package:qr_incredibel/providers/db_provider.dart';

class ScanListProvider extends ChangeNotifier{
  List<ScanModel> scans = [];
  String tipoSeleccionado = 'http'; 

  Future<ScanModel> nuevoScan(String valor) async{
    final nuevoScan = new ScanModel(valor: valor);
    final id = await DbProvider.db.insertScan(nuevoScan);
    nuevoScan.id = id;

    if (this.tipoSeleccionado == nuevoScan.tipo){
      this.scans.add(nuevoScan);
      notifyListeners();
    }
    return nuevoScan;
  }

  cargarScans() async{
    final scans = await DbProvider.db.getScans();
    this.scans = [...scans];
    notifyListeners();
  }

  cargarScansPorTipo(String tipo) async{
    final scans = await DbProvider.db.getScansByType(tipo);
    this.scans = [...scans];
    this.tipoSeleccionado = tipo;
    notifyListeners();
  }

  borrarTodos() async{
    await DbProvider.db.deleteAllScans();
    this.scans = [];
    notifyListeners();
  }

  borrarScanPorId(int id) async{
    await DbProvider.db.deleteScan(id);
    this.cargarScansPorTipo(this.tipoSeleccionado);
  }

}