import 'package:devaloop_group_item/group_item.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Group Item Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Group Item Example'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              GroupItem(
                title: 'Transaction',
                contents: [
                  GroupContent(
                    title: 'Sell',
                    subtitle: 'Sell',
                    leading: const Icon(Icons.sell),
                  ),
                  GroupContent(
                    title: 'Buy',
                    subtitle: 'Buy',
                    leading: const Icon(Icons.shop),
                  ),
                ],
              ),
              GroupItem(
                title: 'Inventory',
                contents: [
                  GroupContent(
                    title: 'Inventory',
                    subtitle: 'Inventory',
                    leading: const Icon(Icons.inventory),
                  ),
                ],
              ),
              GroupItem(
                title: 'Reporting',
                contents: [
                  GroupContent(
                    title: 'Reporting',
                    subtitle: 'Reporting',
                    leading: const Icon(Icons.summarize),
                    detail: Detail(
                      detailPage: const ReportingPage(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ReportingPage extends StatelessWidget {
  const ReportingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reporting'),
      ),
      body: const Center(
        child: Text('Content'),
      ),
    );
  }
}
