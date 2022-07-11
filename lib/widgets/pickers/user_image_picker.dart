import 'package:flutter/material.dart';

class UserImagePicker extends StatefulWidget {
  // const UserImagePicker({ Key? key }) : super(key: key);

  @override
  State<UserImagePicker> createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
  void _pickImage() {}

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      CircleAvatar(radius: 40),
      SizedBox(height: 5),
      FlatButton.icon(
        textColor: Theme.of(context).primaryColor,
        onPressed: () {},
        icon: Icon(Icons.image),
        label: Text('Add Image'),
      ),
    ]);
  }
}
