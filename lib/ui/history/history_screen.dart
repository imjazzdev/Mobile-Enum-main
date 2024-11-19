import 'package:flutter/material.dart';
import 'package:mobile_enum/costumview/cv_list_item.dart';
import 'package:mobile_enum/data/model/riwayat_indikator_model.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  List<RiwayatIndikatorModel> _filteredIndikators = indikatorList;
  String _selectedStatus = 'Semua';

  void _filterByStatus(String status) {
    setState(() {
      _selectedStatus = status;
      if (status == 'Semua') {
        _filteredIndikators = indikatorList;
      } else {
        _filteredIndikators = indikatorList
            .where((indikator) => indikator.status == status)
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const SizedBox(width: 10),
                      Text(
                        "Riwayat Penginputan",
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.purple[900]
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        const SizedBox(width: 10),
                        _buildFilterButton("Semua"),
                        const SizedBox(width: 10),
                        _buildFilterButton("Menunggu"),
                        const SizedBox(width: 10),
                        _buildFilterButton("Ditolak"),
                        const SizedBox(width: 10),
                        _buildFilterButton("Diverifikasi"),
                        const SizedBox(width: 10),
                      ],
                    ),
                  ),
                  const SizedBox(
                      height: 20
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 20),
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: _filteredIndikators.length,
                        itemBuilder: (context, index){
                          final RiwayatIndikatorModel indikator = _filteredIndikators[index];
                          return CostumListItem(
                            logo: indikator.logo,
                            sektor: indikator.sektor,
                            nama: indikator.nameIndikator,
                            opd: indikator.opd,
                            onTap: (){
                              print("yang ditekan ${indikator.nameIndikator}");
                            },
                          );
                        }
                    ),
                  )
                ],
              ),
            ),
          ),
        )
    );
  }

  Widget _buildFilterButton(String status) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor:
        _selectedStatus == status ? Colors.purple : Colors.grey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: () => _filterByStatus(status),
      child: Text(
        status,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}
