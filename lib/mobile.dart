import 'dart:io';

// ignore: depend_on_referenced_packages
import 'package:open_file/open_file.dart';
// ignore: depend_on_referenced_packages
import 'package:path_provider/path_provider.dart';
// ignore: depend_on_referenced_packages
import 'package:share_extend/share_extend.dart';

Future<void> saveAndLaunchFile(List<int> bytes, String fileName) async {
  final directory = await getTemporaryDirectory();

  final path = directory.path;
  final file = File('$path/$fileName');
  await file.writeAsBytes(bytes, flush: true);

  // Open the file for viewing
  OpenFile.open(file.path);

  // Share the file
  ShareExtend.share(file.path, "file");
}
