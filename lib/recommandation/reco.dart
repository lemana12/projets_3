import 'dart:io';

import 'package:path_provider/path_provider.dart';

import '../models.dart';

Future<String> get localPath async {
  final dir = await getApplicationDocumentsDirectory();

  return dir.path;
}

Future<File> _localFile(String nomsim) async {
  final path = await localPath;

  return File('$path/$nomsim.txt');
}

Future<File> write(String counter, String nomsim) async {
  final file = await _localFile(nomsim);

  // Write the file

  return file.writeAsString('$counter');
}

Future<String?> read(String nomsim) async {
  try {
    final file = await _localFile(nomsim);

    // Read the file
    final contents = await file.readAsString();

    return contents;
  } catch (e) {
    // If encountering an error, return 0
    return null;
  }
}

String asString(List<Service> l) {
  String s = '';
  for (Service serv in l) s += "${serv.id};${serv.count};;";

  return s;
}

List<Service> asListService(String s) {
  if (s == null || s == "") return [];
  List<Service> l = List<Service>.empty(growable: true);

  List<String> ls = s.split(';;');
  List<String> t;
  for (int i = 0; i < ls.length - 1; i++) {
    t = ls[i].split(';');
    l.add(new Service(
      id: t[0],
      count: int.parse(t[1]),
    ));
  }

  return l;
}

Future<void> incremant(Service s, String nomsim) async {
  String? st = await read(nomsim);
  List<Service> l = [];

  l = asListService(st!);

  bool b = true;
  int index=0;
  for (int i = 0; i < l.length; i++) {
    if (l[i].id == s.id) {
      l[i].count = l[i].count!+1;
      index = i;
      b = false;
      break;
    }
  }
  if (b) {
    s.count = 1;
    l.add(s);
  } else {
    int i = index;
    int r = index;
    while (i != 0 && l[i].count !> l[i - 1].count!) {
      r = index - 1;
      i--;
    }
    if (r != index) {
      final temp = l[index];

      l[index] = l[r];
      l[r] = temp;
      r = index;
    }
    int n = l.length;
    while (i != n - 1 && l[i].count !< l[i + 1].count!) {
      r = i + 1;
      i++;
    }
    if (r != index) {
      Service temp;
      temp = l[index];
      l[index] = l[r];
      l[r] = temp;
    }
  }

  st = asString(l);
  await write(st, nomsim);
}

Future<List<Service>> sortedListService(String nomsim) async {
  var st = await read(nomsim);
  if (st == null || st == "") return [];
  List<Service> l = asListService(st);
  int end = 5;
  if (l.length < 5) {
    end = l.length;
  }

  return l.sublist(0, end);
}
