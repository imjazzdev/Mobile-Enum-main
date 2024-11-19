import 'package:flutter/material.dart';

import '../../costumview/cv_list_item.dart';
import '../../data/model/indikator_model.dart';

class VerifikasiScreen extends StatefulWidget {
  const VerifikasiScreen({super.key});

  @override
  State<VerifikasiScreen> createState() => _VerifikasiScreenState();
}

class _VerifikasiScreenState extends State<VerifikasiScreen> {
  // final List<IndikatorModel> _filteredIndikators ;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          decoration: const BoxDecoration(
              // color: Colors.white
              ),
          child: Column(
            children: [
              const SizedBox(height: 40),
              Container(
                padding: const EdgeInsets.only(right: 20, left: 20),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Verifikasi Indikator",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple[900]),
                    ),
                    // const SizedBox(height: 10),
                    Text(
                      "Pastikan semua informasi yang anda Input sudah akurat. Verifikasi indikator berikut sebelum mengirimkannya.",
                      style: TextStyle(fontSize: 12, color: Colors.purple[900]),
                    ),
                    const SizedBox(height: 20),

                    // Container(
                    //   padding: const EdgeInsets.only(top: 16.0),
                    //   child: ListView.builder(
                    //       shrinkWrap: true,
                    //       physics: const NeverScrollableScrollPhysics(),
                    //       itemCount: _filteredIndikators.length,
                    //       itemBuilder: (context, index) {
                    //         final IndikatorModel indikator =
                    //             _filteredIndikators[index];
                    //         return Padding(
                    //           padding: const EdgeInsets.all(0),
                    //           child: CostumListItem(
                    //             logo: indikator.logo,
                    //             sektor: indikator.sektor,
                    //             nama: indikator.nameIndikator,
                    //             opd: indikator.opd,
                    //             onTap: () {
                    //               print(indikator.nameIndikator);
                    //             },
                    //           ),
                    //         );
                    //       }),
                    // )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
