import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../store/item-description.dart';

class ScanPage extends StatelessWidget {
  const ScanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MobileScanner(
      controller: MobileScannerController(detectionSpeed: DetectionSpeed.noDuplicates),
      onDetect: (capture) {
        final List<Barcode> barcodes = capture.barcodes;

        for (final barcode in barcodes) {
          if (barcode.rawValue != null) {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ItemDescription(itemID: barcode.rawValue ?? '')));
          }

        }

      },
    );
  }
}