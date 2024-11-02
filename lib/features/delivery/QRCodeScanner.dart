import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QRCodeScanner extends StatefulWidget {
  final Function(String)? onScanned;

  const QRCodeScanner({super.key, this.onScanned});

  @override
  _QRCodeScannerState createState() => _QRCodeScannerState();
}

class _QRCodeScannerState extends State<QRCodeScanner> {
  final MobileScannerController _controller = MobileScannerController();
  @override
  void dispose() {
    // Dispose the MobileScannerController when done to free up resources
    _controller.dispose();
    super.dispose();
  }  bool _scanned = false;

  void _onDetect(BarcodeCapture capture) {
    final List<Barcode> barcodes = capture.barcodes;
    for (final barcode in barcodes) {
      final scannedData = barcode.rawValue;
      if (scannedData != null && !_scanned) {
        _scanned = true;
        widget.onScanned!(scannedData); // Pass the data back

        // Delay to show black screen briefly before navigating back
        setState(() {}); // Trigger black screen by setting `_scanned`
        Future.delayed(const Duration(milliseconds: 300), () {
          Navigator.pop(context); // Go back to the previous screen
        });
        break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          _scanned ? Colors.black : null, // Set background to black if scanned
      appBar: AppBar(
        title: const Text('QR Code Scanner'),
      ),
      body: _scanned
          ? Container(color: Colors.black) // Show black screen
          : MobileScanner(
              controller: _controller,
              onDetect: _onDetect,
            ),
    );
  }
}
