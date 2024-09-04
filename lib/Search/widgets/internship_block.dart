import 'package:flutter/material.dart';
import 'package:internshala/model/internship_model.dart';

class InternshipBlock extends StatelessWidget {
  const InternshipBlock({
    required this.internship,
    super.key,
  });

  final Internship internship;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (internship.isActive)
                Image.asset(
                  'assets/images/actively_hiring.png',
                  width: 112,
                ),
              const SizedBox(height: 4),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width - 120,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          internship.title,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          internship.companyName,
                          style: const TextStyle(
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Image.asset(
                    'assets/images/blank.png',
                    width: 40,
                  ),
                ],
              ),
              SizedBox(height: 12),
              if (internship.locations.isNotEmpty)
                Row(
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      size: 14,
                    ),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width - 120,
                      child: Text(
                          " ${internship.locations.map((location) => location.locationName).join(', ')}"),
                    ),
                  ],
                ),
              if (internship.locations.isEmpty)
                Row(
                  children: [
                    const Icon(
                      Icons.home_outlined,
                      size: 14,
                    ),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width - 120,
                      child: const Text(" Work from Home"),
                    ),
                  ],
                ),
              SizedBox(height: 12),
              Row(
                children: [
                  const Icon(
                    Icons.calendar_today_outlined,
                    size: 14,
                  ),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width - 120,
                    child: Text(" ${internship.duration}"),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  const Icon(
                    Icons.money,
                    size: 14,
                  ),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width - 120,
                    child: Text(" ${internship.stipend.salary}"),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  if (internship.partTime)
                    Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 228, 228, 228),
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: const Text("Part time"),
                    ),
                  const SizedBox(width: 4),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 228, 228, 228),
                      borderRadius: BorderRadius.circular(3.0),
                    ),
                    child: Text(
                        " ${internship.employmentType[0].toUpperCase() + internship.employmentType.substring(1)} "),
                  ),
                ],
              ),
              const Divider(),
              Row(
                children: [
                  const Spacer(),
                  const Text(
                    "View Details",
                    style: TextStyle(
                      color: Colors.lightBlue,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: Colors.lightBlue,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                    ),
                    child: const Text(
                      "Apply Now",
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 1,
              color: const Color.fromARGB(255, 181, 181, 181),
            ),
            const Divider(
              thickness: 8,
              color: Color.fromARGB(114, 202, 202, 202),
              height: 8,
            ),
            Container(
              height: 1,
              color: const Color.fromARGB(255, 181, 181, 181),
            ),
          ],
        ),
      ],
    );
  }
}
