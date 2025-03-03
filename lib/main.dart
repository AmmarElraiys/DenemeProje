import 'package:flutter/material.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';
import 'package:test/presentation/screens/home_screen.dart';

Box? myBox;
BoxCollection? collectionBox;
late CollectionBox basic_data_information;
late CollectionBox administrative_information;
late CollectionBox employee_information_details;
late CollectionBox financialInformation;
late CollectionBox work_information;

Future<Box> openHiveBox(String boxName) async {
  if (!Hive.isBoxOpen(boxName)) {
    return await Hive.openBox(boxName);
  }
  return Hive.box(boxName);
}

Future<BoxCollection> openCollectionBox(Set<String> box) async {
  return await BoxCollection.open(
    'company_system', // Database adı
    box,
    path: (await getApplicationDocumentsDirectory()).path,
  );
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  collectionBox = await openCollectionBox({
    "basic_data_information",
    "administrative_information",
    "employee_information_details",
    "financialInformation",
    "work_information",
  });

  basic_data_information = (await collectionBox!.openBox(
    "basic_data_information",
  ));

  administrative_information = (await collectionBox!.openBox(
    "administrative_information",
  ));

  employee_information_details = (await collectionBox!.openBox(
    "employee_information_details",
  ));
  financialInformation = (await collectionBox!.openBox("financialInformation"));
  work_information = (await collectionBox!.openBox("work_information"));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomeScreen());
  }
}
