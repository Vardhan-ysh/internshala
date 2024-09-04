import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:internshala/Search/provider/filter_provider.dart';

class SelectedCitiesWidget extends ConsumerWidget {
  final Function() onAddCity;
  final Function(String) onRemoveCity;

  SelectedCitiesWidget({
    required this.onAddCity,
    required this.onRemoveCity,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filterState = ref.watch(filterProvider);
    final filterNotifier = ref.read(filterProvider.notifier);

    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('CITY', style: TextStyle(fontWeight: FontWeight.w300)),
          SizedBox(height: 8.0),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: (filterState.locations ?? []).map((city) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2.0),
                  child: ElevatedButton(
                    onPressed: () {
                      onRemoveCity(city);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[600],
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      minimumSize: Size(18, 28),
                    ),
                    child: Row(
                      children: [
                        Text(
                          city,
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        SizedBox(width: 4.0),
                        const Icon(Icons.close, size: 16),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          TextButton.icon(
            onPressed: onAddCity,
            icon: const Icon(
              Icons.add,
              color: Colors.lightBlue,
            ),
            label: const Text(
              'Add city',
              style: TextStyle(color: Colors.lightBlue),
            ),
          ),
        ],
      ),
    );
  }
}

class SelectedProfilesWidget extends ConsumerWidget {
  final Function() onAddProfile;
  final Function(String) onRemoveProfileName;

  SelectedProfilesWidget({
    required this.onAddProfile,
    required this.onRemoveProfileName,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filterState = ref.watch(filterProvider);
    final filterNotifier = ref.read(filterProvider.notifier);

    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('PROFILE', style: TextStyle(fontWeight: FontWeight.w300)),
          SizedBox(height: 8.0),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: (filterState.profileNames ?? []).map((profile) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: ElevatedButton(
                    onPressed: () {
                      onRemoveProfileName(profile);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[600],
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      minimumSize: Size(18, 28),
                    ),
                    child: Row(
                      children: [
                        Text(
                          profile,
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        const SizedBox(width: 4.0),
                        const Icon(Icons.close, size: 16),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          TextButton.icon(
            onPressed: onAddProfile,
            icon: const Icon(
              Icons.add,
              color: Colors.lightBlue,
            ),
            label: const Text(
              'Add profile',
              style: TextStyle(color: Colors.lightBlue),
            ),
          ),
        ],
      ),
    );
  }
}
