import 'package:app/movie.dart';
import 'package:app/streamingonline.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this, initialIndex: 0);
    _tabController.addListener(_handleTabSection);
    super.initState();
  }

  _handleTabSection() {
    if (_tabController.indexIsChanging) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.greenAccent,
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.purple, Colors.pink],
            ),
          ),
          padding: const EdgeInsets.only(top: 50),
          child: const Text(
            'Ga bahaya ta',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontStyle: FontStyle.normal,
                fontSize: 14,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
      appBar: AppBar(
        title: const Text("Ga Bahaya Ta"),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 7, left: 7),
            child: Icon(Icons.search_rounded),
          )
        ],
      ),
      body: ListView(children: [
        CarouselSlider(
          items: [
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                        image: AssetImage("images/atas2.jpg"),
                        fit: BoxFit.cover)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                        image: AssetImage("images/atas3.jpg"),
                        fit: BoxFit.cover)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                      image: AssetImage("images/atas4.jpg"), fit: BoxFit.cover),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                      image: AssetImage("images/atas5.jpg"), fit: BoxFit.cover),
                ),
              ),
            ),
          ],
          options: CarouselOptions(
            aspectRatio: 16 / 9,
            viewportFraction: 0.8,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            enlargeFactor: 0.3,
            scrollDirection: Axis.horizontal,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        TabBar(
          controller: _tabController,
          unselectedLabelColor: Colors.white38,
          isScrollable: true,
          indicator: BoxDecoration(
            color: const Color.fromARGB(255, 1, 52, 65),
            borderRadius: BorderRadius.circular(10),
          ),
          labelStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          labelPadding: const EdgeInsets.symmetric(horizontal: 5),
          tabs: const [
            Tab(
              text: "Semua",
            ),
            Tab(
              text: "Horror",
            ),
            Tab(
              text: "Action",
            ),
            Tab(
              text: "Comedy",
            ),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        Center(
            child: [
          Movie(),
          Container(),
        ][_tabController.index]),
        const SizedBox(
          height: 30,
        ),
        const Center(child: StreamingOnline()),
      ]),
    );
  }
}
