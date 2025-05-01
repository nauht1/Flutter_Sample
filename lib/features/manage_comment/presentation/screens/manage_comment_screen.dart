import 'package:flutter/material.dart';
import 'package:flutter_app_sample/common/widgets/common_sliver_app_bar.dart';

class ManageCommentScreen extends StatefulWidget {
  const ManageCommentScreen({super.key});

  @override
  _ManageCommentScreenState createState() => _ManageCommentScreenState();
}

class _ManageCommentScreenState extends State<ManageCommentScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (_, __) =>
      const [
        CommonSliverAppBar(),
      ],
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (_, index) => ListTile(title: Text('Chat item $index')),
      ),
    );
  }

}