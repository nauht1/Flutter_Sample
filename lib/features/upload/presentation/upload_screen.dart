import 'package:flutter/material.dart';
import 'package:flutter_app_sample/common/widgets/common_sliver_app_bar.dart';

class UploadPodcastScreen extends StatefulWidget {
  const UploadPodcastScreen({super.key});

  @override
  _UploadPodcastScreenState createState() => _UploadPodcastScreenState();
}

class _UploadPodcastScreenState extends State<UploadPodcastScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (_, __) => const [
        CommonSliverAppBar(),
      ],
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (_, index) => ListTile(title: Text('Chat item $index')),
      ),
    );
  }
}