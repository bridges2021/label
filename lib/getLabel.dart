import 'dart:typed_data';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

Future<Uint8List> getLabel({
  PdfPageFormat? pdfPageFormat,
  required String id,
  String title = '',
  String detail = '',
  String createDate = '',
  String lastModifyDate = '',
}) async {
  // var baseFont =
  //     Font.ttf(await rootBundle.load('assets/fonts/Roboto-Regular.ttf'));
  // var boldFont =
  //     Font.ttf(await rootBundle.load('assets/fonts/Roboto-Bold.ttf'));

  final pdf = Document(
      // theme: ThemeData.withFont(base: baseFont, bold: boldFont)
      );

  pdf.addPage(Page(
      pageFormat: pdfPageFormat ??
          PdfPageFormat(175.748031496063, 283.46456692913387,
              marginLeft: 4.365354330708661,
              marginRight: 4.365354330708661,
              marginBottom: 8.588976377952756,
              marginTop: 8.588976377952756),
      orientation: PageOrientation.landscape,
      build: (Context context) {
        return Padding(
            padding: EdgeInsets.symmetric(horizontal: 1),
            child: Expanded(
                child: Container(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                  Expanded(
                      flex: 2,
                      child: Row(children: [
                        Expanded(
                            flex: 2,
                            child: BarcodeWidget(
                                data: id, barcode: Barcode.qrCode())),
                        Expanded(
                            flex: 8,
                            child: Padding(
                                padding: EdgeInsets.all(10),
                                child: Column(children: [
                                  Text(title,
                                      maxLines: 3,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold))
                                ])))
                      ])),
                  Expanded(
                      flex: 3,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(flex: 5, child: Text(detail, maxLines: 4)),
                            Expanded(
                                flex: 1,
                                child: Text('Create date: $createDate',
                                    style: TextStyle(fontSize: 8))),
                            Expanded(
                                flex: 1,
                                child: Text('Last modify date: $lastModifyDate',
                                    style: TextStyle(fontSize: 8))),
                            Expanded(
                                flex: 1,
                                child: Text('ID: $id',
                                    style: TextStyle(fontSize: 8)))
                          ]))
                ]))));
      }));

  return pdf.save();
}
