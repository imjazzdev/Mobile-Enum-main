import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_enum/data/utils/base_url.dart';

class CostumListItem extends StatelessWidget {
  const CostumListItem(
      {super.key,
      required this.logo,
      required this.sektor,
      required this.nama,
      required this.opd,
      required this.onTap});
  final String logo;
  final String sektor;
  final String nama;
  final String opd;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    // final IndikatorModel indikatormodel = indikatorList[];
    return ListTile(
      title: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 0.2,
              // offset: Offset(1, 1),
            ),
          ],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.only(left: 5.0, right: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                ),
                child: CircleAvatar(
                  backgroundImage:
                      NetworkImage('http://36.67.194.180/backend${logo}'),
                  onBackgroundImageError: (error, stackTrace) {
                    print("Failed to load image: $error");
                  },
                  // child: Icon(
                  //   Icons.error_outlined,
                  //   color: Colors.red,
                  // ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      sektor,
                      style: const TextStyle(
                        fontSize: 11,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Divider(
                      height: 1,
                      thickness: 1,
                      endIndent: 12,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      nama,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      opd,
                      style: const TextStyle(
                        fontSize: 11,
                        color: Color(0xFF64748B),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      onTap: onTap,
    );
  }
}
