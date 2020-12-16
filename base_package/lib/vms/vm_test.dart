import 'package:flutter/material.dart';
import 'package:base_package/vms/vm_base.dart';
import 'package:provider/provider.dart';
import 'package:base_package/http/http_handler.dart';
class TestVM extends BaseVM {
  static TestVM of(BuildContext context, [bool listen = false]) =>
      (listen ? context.watch<TestVM>() : context.read<TestVM>())
        ..context = context;

  
}
