# label
 Create label

## Installation
1. Add this to pubspec.yaml
```yaml
label:
  git:
    url: https://github.com/bridges2021/label.git
    ref: main
```

## How to use
1. Get label Uint8List
```dart
final _label = await getLabel(id: 'id here')
```
2. Print by bridges/brother_label_printer or printing
```dart
/// by printing
await Printing.layoutPdf(onLayout: (pdfPageFormat) async {return getLabel(id: 'id here')}

/// bridges/brother_label_printer
final _file = await File('${await getTemporaryDirectory()}/example.pdf').writeAsBytes(_label);
await BrotherLabelPrinter.printFromPath(_file.path);
```
