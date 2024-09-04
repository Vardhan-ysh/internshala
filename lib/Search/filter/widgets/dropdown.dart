import 'package:flutter/material.dart';

class CitySelectionPage extends StatefulWidget {
  final List<String> items;
  final List<String> selectedItems;
  final Function(List<String>) onChanged;

  CitySelectionPage({
    required this.items,
    required this.selectedItems,
    required this.onChanged,
    super.key,
  });

  @override
  _CitySelectionPageState createState() => _CitySelectionPageState();
}

class _CitySelectionPageState extends State<CitySelectionPage> {
  late List<String> selectedCities;

  @override
  void initState() {
    super.initState();
    selectedCities = List.from(widget.selectedItems);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'City',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        titleSpacing: 0,
      ),
      body: ListView(
        children: widget.items.map((city) {
          final isSelected = selectedCities.contains(city);
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: ListTile(
              minTileHeight: 0,
              onTap: () {
                setState(() {
                  if (isSelected) {
                    selectedCities.remove(city);
                  } else {
                    selectedCities.add(city);
                  }
                  widget.onChanged(selectedCities);
                });
              },
              contentPadding: EdgeInsets.symmetric(
                  horizontal: 16.0), // Adjust horizontal padding if needed
              leading: Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: isSelected
                    ? Icon(Icons.check, color: Colors.blue, size: 16)
                    : SizedBox.shrink(),
              ),
              title: Text(city),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class ProfileSelectionPage extends StatefulWidget {
  final List<String> items;
  final List<String> selectedItems;
  final Function(List<String>) onChanged;

  ProfileSelectionPage({
    required this.items,
    required this.selectedItems,
    required this.onChanged,
    super.key,
  });

  @override
  _ProfileSelectionPageState createState() => _ProfileSelectionPageState();
}

class _ProfileSelectionPageState extends State<ProfileSelectionPage> {
  late List<String> selectedProfiles;

  @override
  void initState() {
    super.initState();
    selectedProfiles = List.from(widget.selectedItems);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        titleSpacing: 0,
      ),
      body: ListView(
        children: widget.items.map((profile) {
          final isSelected = selectedProfiles.contains(profile);
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: ListTile(
              minTileHeight: 0,
              onTap: () {
                setState(() {
                  if (isSelected) {
                    selectedProfiles.remove(profile);
                  } else {
                    selectedProfiles.add(profile);
                  }
                  widget.onChanged(selectedProfiles);
                });
              },
              contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
              leading: Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: isSelected
                    ? Icon(Icons.check, color: Colors.blue, size: 16)
                    : SizedBox.shrink(),
              ),
              title: Text(profile),
            ),
          );
        }).toList(),
      ),
    );
  }
}
