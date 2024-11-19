import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobile_enum/costumview/cv_homea_appbar.dart';
import 'package:mobile_enum/costumview/cv_list_item.dart';
import 'package:mobile_enum/data/controller/dashboard_controller.dart';
import 'package:mobile_enum/data/controller/dashboard_indikator_controller.dart';
import 'package:mobile_enum/data/controller/login_controller.dart';
import 'package:mobile_enum/data/model/dashboard_model.dart';

import '../../costumview/cv_card_dashboard.dart';
import '../../costumview/cv_search.dart';
import '../../data/controller/profile_controller.dart';
import '../../data/model/dashboard_indikator_model.dart';
import '../../data/model/indikator_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final DashboardController dashboardController = Get.find();
  final DashboardIndikatorController dashboardIndikatorController = Get.find();
  final storage = GetStorage();

  bool _isTyping = false;
  final TextEditingController _searchController = TextEditingController();
  List<IndikatorModel> _filteredIndikators = indikatorList;

  void filteredIndikators() {
    setState(() {
      _isTyping = _searchController.text.isNotEmpty;
      _filteredIndikators = indikatorList
          .where((indikator) => indikator.nameIndikator
              .toLowerCase()
              .contains(_searchController.text.toLowerCase()))
          .toList();

      print("Jumlah indikator yang terfilter: ${_filteredIndikators.length}");
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _searchController.addListener(filteredIndikators);
  }

  final ProfileController profileController = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: costumHomeAppbar(),
      body: SingleChildScrollView(
        // Use SingleChildScrollView for body
        child: Container(
          color: Colors.purple,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Column(
              children: [
                const SizedBox(height: 20),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: const Text(
                    "Statistik Indikator",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.purple,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 30),
                  child: const Text(
                    "Dashboard untuk memantau status indikator",
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.purple,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Obx(() {
                  // if (dashboardController.statusList.isEmpty) {
                  //   return const Center(
                  //       child: CircularProgressIndicator()); // Menunggu data
                  // }

                  // Jika ada error atau data kosong
                  if (dashboardController.statusList.isEmpty) {
                    return const Center(child: Text("No data available"));
                  }

                  return SingleChildScrollView(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children:
                          dashboardController.statusList.map((statusIndikator) {
                        Color iconBColor;
                        Color backgroundColor;
                        IconData icon = Icons.check_circle_outline;

                        switch (statusIndikator.status) {
                          case "Terinput":
                            icon = Icons.arrow_circle_up;
                            iconBColor = Colors.purple[300] ?? Colors.white;
                            backgroundColor =
                                Colors.purple[100] ?? Colors.white;
                            break;
                          case "Diverifikasi":
                            icon = Icons.check_circle_outline;
                            iconBColor = Colors.green[300] ?? Colors.white;
                            backgroundColor = Colors.green[100] ?? Colors.white;
                            break;
                          case "Ditolak":
                            icon = Icons.cancel_outlined;
                            iconBColor = Colors.redAccent;
                            backgroundColor = Colors.red[100] ?? Colors.white;
                            break;
                          case "Menunggu":
                            icon = Icons.access_time;
                            iconBColor = Colors.grey[300] ?? Colors.white;
                            backgroundColor = Colors.grey[100] ?? Colors.white;
                            break;
                          default:
                            iconBColor = Colors.blueAccent;
                            backgroundColor = Colors.blue[50] ?? Colors.white;
                        }

                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: CostumCard(
                            icon: icon,
                            title: statusIndikator.value.toString(),
                            subtitle: statusIndikator.status,
                            iconColor: Colors.white,
                            iconBColor: iconBColor,
                            backgroundColor: backgroundColor,
                          ),
                        );
                      }).toList(),
                    ),
                  );
                }),
                const SizedBox(
                  height: 50,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 30),
                  child: Text(
                    "Cari Indikator",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.purple[900],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: costumSearch(
                    controller: _searchController,
                    hint: "Cari indikator...",
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 0),
                  child: Obx(() {
                    if (dashboardIndikatorController.isLoading.value) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: dashboardIndikatorController
                          .dashboardIndikatorList.length,
                      itemBuilder: (context, index) {
                        final indikator = dashboardIndikatorController
                            .dashboardIndikatorList[index];

                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CostumListItem(
                            logo: indikator.logoOpd.toString(),
                            sektor: indikator.namaSektor,
                            nama: indikator.namaIndikator,
                            opd: indikator.namaOpd,
                            onTap: () {
                              Get.toNamed('/DetailScreen',
                                  arguments: indikator);
                              print("Tapped: ${indikator.namaIndikator}");
                              print("Tapped: ${indikator.indikatorId}");
                            },
                          ),
                        );
                      },
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
