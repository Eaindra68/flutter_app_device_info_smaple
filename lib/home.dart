import 'package:flutter/material.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_app_device_info_smaple/widgets/show_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

  Future<dynamic> getInfo() async {
    if (Theme.of(context).platform == TargetPlatform.android) {
      return await deviceInfo.androidInfo;
    } else {
      return await deviceInfo.iosInfo;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.teal,
          title: const Text('Flutter App Device Info')),
      body: SafeArea(
        child: FutureBuilder<dynamic>(
          future: getInfo(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else {
              final dynamic data = snapshot.data!;
              if (Theme.of(context).platform == TargetPlatform.android) {
                AndroidDeviceInfo androidInfo = data;
                return Column(
                  children: [
                    ShowCard(
                      name: 'brand',
                      value: androidInfo.brand,
                    ),
                    ShowCard(name: 'device', value: androidInfo.device),
                    ShowCard(name: 'model', value: androidInfo.model),
                    ShowCard(
                        name: 'manufacturer', value: androidInfo.manufacturer),
                    ShowCard(name: 'product', value: androidInfo.product),
                    ShowCard(name: 'hardware', value: androidInfo.hardware),
                    ShowCard(
                        name: 'isPhysicalDevice',
                        value: androidInfo.isPhysicalDevice.toString()),
                    ShowCard(
                        name: 'version',
                        value: androidInfo.version.release.toString()),
                  ],
                );
              } else {
                IosDeviceInfo iosInfo = data;
                return Column(
                  children: [
                    ShowCard(name: 'name', value: iosInfo.name),
                    ShowCard(name: 'systemName', value: iosInfo.systemName),
                    ShowCard(
                        name: 'systemVersion', value: iosInfo.systemVersion),
                    ShowCard(name: 'model', value: iosInfo.model),
                    ShowCard(
                        name: 'localizedModel', value: iosInfo.localizedModel),
                  ],
                );
              }
            }
          },
        ),
      ),
    );
  }
}
