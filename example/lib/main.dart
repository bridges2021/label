import 'dart:io';

import 'package:flutter/material.dart';
import 'package:label/getLabel.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Labels example'),
        ),
        body: Column(
          children: [
            Expanded(child: PdfPreview(build: (PdfPageFormat pdfPageFormat) {
              return getLabel(pdfPageFormat: pdfPageFormat,
                  id: 'Testing ID here 123123',
                  detail:
                      'Detail here, long Detail long Detail long Detail long Detail long Detail long Detail long Detail long Detail long Detail long Detail long Detail long Detail long Detail long Detail long Detail long Detail long Detail long Detail long Detail long Detail long Detail long Detail long Detail long Detail long Detail long Detail long Detail',
                  createDate: '2021 - 02 - 05 16:23:42',
                  lastModifyDate: '2021 - 04 - 12 08:04:22');
            })),
            Expanded(
                child: ListView(
              children: [
                ElevatedButton(
                    onPressed: () async {
                      await Printing.layoutPdf(
                          onLayout: (PdfPageFormat pdfPageFormat) async {
                        return getLabel(
                            id: 'Testing ID here 123123',
                            title: 'Product name or pallet name',
                            detail:
                                'Detail here, long Detail long Detail long Detail long Detail long Detail long Detail long Detail long Detail long Detail long Detail long Detail long Detail long Detail long Detail long Detail long Detail long Detail long Detail long Detail long Detail long Detail long Detail long Detail long Detail long Detail long Detail long Detail',
                            createDate: '2021 - 02 - 05 16:23:42',
                            lastModifyDate: '2021 - 04 - 12 08:04:22');
                      });
                      File('').writeAsBytes(await getLabel(id: 'qweoiqjwe'));
                    },
                    child: Text('Print'))
              ],
            ))
          ],
        ),
      ),
    );
  }
}
