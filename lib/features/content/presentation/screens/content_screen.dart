import 'package:flutter/material.dart';
import 'package:flutter_app_sample/common/widgets/common_sliver_app_bar.dart';

class ContentScreen extends StatefulWidget {
  const ContentScreen({super.key});

  @override
  State<ContentScreen> createState() => _ContentScreenState();
}

class _ContentScreenState extends State<ContentScreen> {
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
