import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';
import 'package:toast/toast.dart';
// getExternalStorageDirectory(); // 在iOS上，抛出异常，在Android上，这是getExternalStorageDirectory的返回值
// getTemporaryDirectory(); // 在iOS上，对应NSTemporaryDirectory（）返回的值，在Android上，这是getCacheDir的返回值。
// getApplicationDocumentsDirectory(); // 在iOS上，这对应NSDocumentsDirectory，在Android上，这是AppData目录

class PathProviderUtil {
  ///加载缓存
  static Future<String> loadCache() async {
    Directory tempDir = await getTemporaryDirectory();
    double value = await _getTotalSizeOfFilesInDir(tempDir);
    tempDir.list(followLinks: false, recursive: true).listen((file) {
//打印每个缓存文件的路径
      print(file.path);
    });
    print('临时目录大小: ' + value.toString());
    String _cacheSizeStr = _renderSize(value); // _cacheSizeStr用来存储大小的值
    print("_cacheSizeStr$_cacheSizeStr");
    return _cacheSizeStr;
  }

//循环计算文件的大小（递归）
  static Future<double> _getTotalSizeOfFilesInDir(final FileSystemEntity file) async {
    if (file is File) {
      int length = await file.length();
      return double.parse(length.toString());
    }
    if (file is Directory) {
      final List<FileSystemEntity> children = file.listSync();
      double total = 0;
      if (children != null)
        for (final FileSystemEntity child in children)
          total += await _getTotalSizeOfFilesInDir(child);
      return total;
    }
    return 0;
  }

//格式化缓存文件大小
  static _renderSize(double value) {
    if (null == value) {
      return 0;
    }
    List<String> unitArr = List()..add('B')..add('K')..add('M')..add('G');
    int index = 0;
    while (value > 1024) {
      index++;
      value = value / 1024;
    }
    String size = value.toStringAsFixed(2);
    return size + unitArr[index];
  }

    //通过 path_provider 得到缓存目录，然后通过递归的方式，删除里面所有的文件。
  static Future<String> clearCache(BuildContext context) async {
    Directory tempDir = await getTemporaryDirectory();
    //删除缓存目录
    await delDir(tempDir);
    String size = await loadCache();
    Toast.show('清除缓存成功', context);
    return size;
  }

  ///2020.06.23更改：不需要递归删除，直接删除子目录和文件即可
  static Future<Null> delDir(FileSystemEntity file) async {
    if (file is Directory) {
      final List<FileSystemEntity> children = file.listSync();
      for (final FileSystemEntity child in children) {
        await delDir(child);
        await child.delete();
      }
    }
  }
}
