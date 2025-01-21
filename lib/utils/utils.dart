import 'package:flutter/material.dart';
import 'package:qr_incredibel/models/scan_model.dart';
import 'package:url_launcher/url_launcher.dart';

void launchURL(BuildContext context, ScanModel scan) async {
  final Uri url = Uri.parse(scan.valor);

  if (scan.tipo == 'http') {
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not launch $url')),
      );
    }
  } else {
    Navigator.pushNamed(context, 'mapa', arguments: scan);
  }
}