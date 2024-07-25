import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class PDFViewPage extends StatelessWidget {
  final String path;

  PDFViewPage({required this.path});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("E-Book"),
        ),
        body: PDFView(
          filePath: path,
          enableSwipe: true,
          fitPolicy: FitPolicy.BOTH,
          swipeHorizontal: false,
          autoSpacing: false,
          onError: (error) {
            print(error.toString());
          },
          onPageError: (page, error) {
            print('$page: ${error.toString()}');
          },
        ));
  }
}
