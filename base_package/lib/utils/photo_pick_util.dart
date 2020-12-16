import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:toast/toast.dart';

class PhotoPickUtil{
  static Future<String> showSheet(BuildContext context){
    return _showSheet(context, CupertinoActionSheet(
            actions: <Widget>[
              CupertinoActionSheetAction(
                child: const Text('拍照',
                    style: TextStyle(
                        color: Color(0xFF167EFB),
                        fontSize: 18,
                        fontFamily: 'PingFangMedium')),
                onPressed: () => Navigator.pop(context, 'camera'),
              ),
              CupertinoActionSheetAction(
                child: const Text('相册',
                    style: TextStyle(
                        color: Color(0xFF167EFB),
                        fontSize: 18,
                        fontFamily: 'PingFangMedium')),
                onPressed: () => Navigator.pop(context, 'photo'),
              ),
            ],
            cancelButton: CupertinoActionSheetAction(
              child: const Text('取消',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontFamily: 'PingFangMedium')),
              isDefaultAction: true,
              onPressed: () => Navigator.pop(context, 'cancel'),
            ),
          ));
  }

  static Future<String> _showSheet(BuildContext context, Widget child) async {
    String value = await showCupertinoModalPopup(context: context, builder: (context) => child);
    switch (value) {
        case "photo":
          var value = await ImagePicker().getImage(source: ImageSource.gallery);
            if(value != null){
              print(value.path);
              return value.path;
            } else{
              Toast.show("取消", context);
            }
          break;
        case "camera":
          var value = await ImagePicker().getImage(source: ImageSource.camera);
            if(value != null){
              print(value.path);
              return value.path;
            } else{
              Toast.show("取消", context);
            }
          break;
        case "cancel":
          break;
      }
  }
}