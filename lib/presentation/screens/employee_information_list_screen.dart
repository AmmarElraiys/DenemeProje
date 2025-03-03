import 'dart:io';
import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pluto_grid/pluto_grid.dart';

class EmployeeInformationListScreen extends StatefulWidget {
  @override
  _EmployeeInformationListScreen createState() =>
      _EmployeeInformationListScreen();
}

class _EmployeeInformationListScreen
    extends State<EmployeeInformationListScreen> {
  late List<PlutoRow> rows;
  late List<PlutoColumn> columns;
  late PlutoGridStateManager stateManager;

  @override
  void initState() {
    super.initState();
    columns = [
      PlutoColumn(title: 'ID', field: 'id', type: PlutoColumnType.number()),
      PlutoColumn(title: 'الاسم', field: 'name', type: PlutoColumnType.text()),
      PlutoColumn(
        title: 'الحالة الاجتماعية',
        field: 'maritalStatus',
        type: PlutoColumnType.text(),
      ),
      PlutoColumn(
        title: 'الأطفال',
        field: 'children',
        type: PlutoColumnType.number(),
      ),
      PlutoColumn(
        title: 'المهارات',
        field: 'skills',
        type: PlutoColumnType.text(),
      ),
      PlutoColumn(
        title: 'الشهادات',
        field: 'certificates',
        type: PlutoColumnType.text(),
      ),
      PlutoColumn(
        title: 'الملاحظات',
        field: 'notes',
        type: PlutoColumnType.text(),
      ),
    ];
    rows = [
      PlutoRow(
        cells: {
          'id': PlutoCell(value: 1),
          'name': PlutoCell(value: 'Ali Can'),
          'maritalStatus': PlutoCell(value: 'متزوج'),
          'children': PlutoCell(value: 2),
          'skills': PlutoCell(value: 'Flutter, Dart'),
          'certificates': PlutoCell(value: 'PMP'),
          'notes': PlutoCell(value: 'ممتاز'),
        },
      ),
      PlutoRow(
        cells: {
          'id': PlutoCell(value: 2),
          'name': PlutoCell(value: 'Fatma Yıldız'),
          'maritalStatus': PlutoCell(value: 'أعزب'),
          'children': PlutoCell(value: 0),
          'skills': PlutoCell(value: 'Java, Spring'),
          'certificates': PlutoCell(value: 'Scrum Master'),
          'notes': PlutoCell(value: 'خبير'),
        },
      ),
    ];
  }

  Future<void> _exportToExcel() async {
    try {
      var excel = Excel.createExcel();

      var sheet = excel['Employees'];

      List<String> headers = [
        'ID',
        'الاسم',
        'الحالة الاجتماعية',
        'الأطفال',
        'المهارات',
        'الشهادات',
        'الملاحظات',
      ];
      for (int i = 0; i < headers.length; i++) {
        sheet
            .cell(CellIndex.indexByColumnRow(columnIndex: i, rowIndex: 0))
            .value = headers[i] as CellValue?;
      }

      for (int rowIndex = 0; rowIndex < rows.length; rowIndex++) {
        for (int colIndex = 0; colIndex < columns.length; colIndex++) {
          sheet
                  .cell(
                    CellIndex.indexByColumnRow(
                      columnIndex: colIndex,
                      rowIndex: rowIndex + 1,
                    ),
                  )
                  .value =
              rows[rowIndex].cells[columns[colIndex].field]?.value ?? '';
        }
      }

      var directory = await getApplicationDocumentsDirectory();
      String filePath = "${directory.path}/employees.xlsx";
      File file = File(filePath);
      await file.writeAsBytes(excel.encode()!);

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("تم تصدير البيانات إلى Excel: $filePath")),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("فشل تصدير البيانات: $e")));
      }
    }
  }

  Future<void> _exportToPdf() async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text(
                'بيانات الموظفين',
                style: pw.TextStyle(
                  fontSize: 20,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              pw.SizedBox(height: 10),
              pw.Table.fromTextArray(
                context: context,
                data: [
                  [
                    'ID',
                    'الاسم',
                    'الحالة الاجتماعية',
                    'الأطفال',
                    'المهارات',
                    'الشهادات',
                    'الملاحظات',
                  ],
                  ...rows.map(
                    (row) =>
                        columns
                            .map((col) => row.cells[col.field]!.value)
                            .toList(),
                  ),
                ],
                headerStyle: pw.TextStyle(
                  fontWeight: pw.FontWeight.bold,
                  fontSize: 12,
                  color: const PdfColor.fromInt(0xFFFFFFFF),
                ),
                cellStyle: pw.TextStyle(fontSize: 10),
                headerDecoration: pw.BoxDecoration(color: PdfColors.grey500),
                cellAlignment: pw.Alignment.centerLeft,
                border: pw.TableBorder.all(width: 0.5),
              ),
            ],
          );
        },
      ),
    );

    var directory = await getApplicationDocumentsDirectory();
    File file = File("${directory.path}/employees.pdf");
    await file.writeAsBytes(await pdf.save());

    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("تم تصدير البيانات إلى PDF: ${file.path}")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("عرض بيانات الموظفين"),
        actions: [
          IconButton(icon: Icon(Icons.picture_as_pdf), onPressed: _exportToPdf),
          IconButton(icon: Icon(Icons.table_chart), onPressed: _exportToExcel),
        ],
      ),
      body: PlutoGrid(
        columns: columns,
        rows: rows,
        onLoaded: (PlutoGridOnLoadedEvent event) {
          stateManager = event.stateManager;
        },
        configuration: PlutoGridConfiguration(
          columnSize: PlutoGridColumnSizeConfig(
            autoSizeMode: PlutoAutoSizeMode.scale,
          ),
        ),
      ),
    );
  }
}
