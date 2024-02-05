import 'package:flutter/material.dart';
import 'package:icons/classes.dart';

import 'package:icons/details_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.black,
        ),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Icones'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({super.key, required this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Scrollbar(
        controller: _scrollController,
        child: GridView.builder(
          padding: const EdgeInsets.all(20),
          controller: _scrollController,
          itemCount: logo.length,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          itemBuilder: (_, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return DetailsPage(
                      logoName: logo[index].logoName,
                      logo: logo[index].logo,
                      index: index,
                    );
                  }),
                );
              },
              borderRadius: const BorderRadius.all(Radius.circular(40)),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(40)),
                  border: Border.all(
                    color: const Color(0xffCCCCCC),
                  ),
                ),
                padding: const EdgeInsets.all(20),
                child: Hero(
                  tag: index,
                  child: logo[index].logo,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
