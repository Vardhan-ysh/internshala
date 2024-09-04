import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:internshala/Search/filter/widgets/add_page.dart';
import 'package:internshala/Search/filter/widgets/dropdown.dart';
import 'package:internshala/Search/provider/filter_provider.dart';

class FilterScreen extends ConsumerStatefulWidget {
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends ConsumerState<FilterScreen> {
  List<String> selectedLocations = [];
  List<String> selectedDurations = [];
  List<String> selectedProfileNames = [];

  @override
  void initState() {
    super.initState();
    final filterState = ref.read(filterProvider);
    selectedLocations = filterState.locations ?? [];
    selectedDurations = filterState.durations ?? [];
    selectedProfileNames = filterState.profileNames ?? [];
  }

  @override
  Widget build(BuildContext context) {
    final filterNotifier = ref.read(filterProvider.notifier);
    final filterState = ref.watch(filterProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Filters',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        titleSpacing: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                child: SelectedCitiesWidget(
                  onRemoveCity: (city) {
                    setState(() {
                      selectedLocations.remove(city);
                    });
                    filterNotifier.updateLocations(selectedLocations);
                  },
                  onAddCity: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => CitySelectionPage(
                          key: const GlobalObjectKey("city"),
                          items: filterState.availableLocations,
                          selectedItems: selectedLocations,
                          onChanged: (selectedItems) {
                            setState(() {
                              selectedLocations = selectedItems;
                            });
                            filterNotifier.updateLocations(selectedItems);
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                child: SelectedProfilesWidget(
                  onRemoveProfileName: (profileName) {
                    setState(() {
                      selectedProfileNames.remove(profileName);
                    });
                    filterNotifier.updateProfileNames(selectedProfileNames);
                  },
                  onAddProfile: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ProfileSelectionPage(
                          key: const GlobalObjectKey("profile"),
                          items: filterState.availableProfileNames,
                          selectedItems: selectedProfileNames,
                          onChanged: (selectedItems) {
                            setState(() {
                              selectedProfileNames = selectedItems;
                            });
                            filterNotifier.updateProfileNames(selectedItems);
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 20),
              const Text('DURATION',
                  style: TextStyle(fontWeight: FontWeight.w300)),
              SizedBox(height: 8.0),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: filterState.availableDurations.map((duration) {
                    final isSelected = selectedDurations.contains(duration);
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: ChoiceChip(
                        backgroundColor:
                            isSelected ? Colors.blue[600] : Colors.white,
                            
                        checkmarkColor: Colors.white,
                        label: Text(
                          duration,
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.blue[600],
                          ),
                        ),
                        selected: isSelected,
                        onSelected: (bool selected) {
                          setState(() {
                            selectedDurations = [duration];
                          });
                          filterNotifier.updateDurations(selectedDurations);
                        },
                        selectedColor: Colors.blue[600],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          side: BorderSide(
                            color: Colors.blue[600]!,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 6),
              Divider(),
              const SizedBox(height: 28),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        setState(() {
                          selectedLocations = [];
                          selectedDurations = [];
                          selectedProfileNames = [];
                        });
                        filterNotifier.clearFilters();
                      },
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.blue),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              4.0), // Less rounded corners
                        ),
                      ),
                      child: const Text(
                        'Clear All Filters',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                      ),
                      child: const Text('Apply'),
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
