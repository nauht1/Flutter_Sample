import 'package:flutter/cupertino.dart';
import 'package:flutter_app_sample/common/widgets/common_sliver_app_bar.dart';
import 'package:provider/provider.dart';

enum DateRangeType { today, thisMonth, thisYear, allTime }

class OverviewScreen extends StatefulWidget {
  const OverviewScreen({super.key});

  @override
  State<OverviewScreen> createState() => _OverviewScreenState();
}

class _OverviewScreenState extends State<OverviewScreen> {

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
      body: Column(
      )
    );
  }
}
