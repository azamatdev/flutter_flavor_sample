import 'package:flavors/app/app_config.dart';
import 'package:flavors/util/utils.dart';
import 'package:flutter/material.dart';

import 'custom_banner.dart';


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  Widget _buildAppBanner(Future<Pair<String, AlignmentGeometry>?> bannerData) {
    return FutureBuilder<Pair<String, AlignmentGeometry>?>(
      future: bannerData,
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data != null) {
          final bannerText = snapshot.data!.first;
          final bannerAlignment = snapshot.data!.second;
          return CustomBanner(bannerText, bannerAlignment);
        } else {
          return Container();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      builder: (context, child) {
        return Stack(
          children: [
            child!,
            _buildAppBanner(Config.getBannerBuildType()),
            _buildAppBanner(Config.getBannerFlavorType()),
          ],
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text("BackendUrl: "),
            StreamBuilder<Object>(
              stream: Config.getBackendURL().asStream(),
              builder: (context, snapshot) {
                return Text(
                  '${snapshot.data.toString()}',
                );
              }
            ),
          ],
        ),
      ),
    );
  }
}
