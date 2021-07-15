import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

Future<Uint8List> getSyncLabel() async {
  final PdfDocument document = PdfDocument();

  document.pages.add().graphics.drawString('hello world!去喔喔i惡假期喔忘記欸奧世界都i假期喔我就都i阿基師', PdfStandardFont(PdfFontFamily.helvetica, 12));

  return Uint8List.fromList(document.save());
}