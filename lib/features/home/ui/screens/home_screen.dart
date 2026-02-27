import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qunova/features/home/provider/home_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // after complete build then call api
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<HomeProvider>().fetchData();
    },);

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}
