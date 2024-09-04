import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:internshala/repository/internship_repository.dart';
import 'package:internshala/repository/provider/repository_provider.dart';

class FilterProvider extends StateNotifier<FilterState> {
  final InternshipRepository _repository;

  FilterProvider(this._repository) : super(FilterState()) {
    fetchAvailableFilters();
  }

  // Method to fetch available filters
  Future<void> fetchAvailableFilters() async {
    try {
      final availableLocations = await _repository.getAvailableLocations();
      final availableDurations = await _repository.getAvailableDurations();
      final availableProfileNames = await _repository.getAvailableProfiles();
      state = state.copyWith(
        availableLocations: availableLocations,
        availableDurations: availableDurations,
        availableProfileNames: availableProfileNames,
      );
    } catch (e) {
      print('Failed to fetch available filters: $e');
    }
  }

  // Methods to update filters
  void updateLocations(List<String>? newLocations) {
    state = state.copyWith(locations: newLocations);
  }

  void updateDurations(List<String>? newDurations) {
    state = state.copyWith(durations: newDurations);
  }

  void updateProfileNames(List<String>? newProfileNames) {
    state = state.copyWith(profileNames: newProfileNames);
  }

  void removeLocation(String location) {
    final updatedLocations = List<String>.from((state.locations ?? []).toList())
      ..remove(location);
    state = state.copyWith(locations: updatedLocations);
  }

  void removeProfileName(String profileName) {
    final updatedProfileNames =
        List<String>.from((state.profileNames ?? []).toList())
          ..remove(profileName);
    state = state.copyWith(profileNames: updatedProfileNames);
  }

  void removeDuration(String duration) {
    final updatedDurations = List<String>.from((state.durations ?? []).toList())
      ..remove(duration);
    state = state.copyWith(durations: updatedDurations);
  }

  void clearFilters() {
    // state = state.copyWith(
    //   locations: null,
    //   durations: null,
    //   profileNames: null,
    // );
    state = FilterState(
      availableLocations: state.availableLocations,
      availableDurations: state.availableDurations,
      availableProfileNames: state.availableProfileNames,
      durations: null,
      locations: null,
      profileNames: null,
    );
  }
}

class FilterState {
  final List<String>? locations;
  final List<String>? durations;
  final List<String>? profileNames;
  final List<String> availableLocations;
  final List<String> availableDurations;
  final List<String> availableProfileNames;

  FilterState({
    this.locations,
    this.durations,
    this.profileNames,
    this.availableLocations = const [],
    this.availableDurations = const [],
    this.availableProfileNames = const [],
  });

  FilterState copyWith({
    List<String>? locations,
    List<String>? durations,
    List<String>? profileNames,
    List<String>? availableLocations,
    List<String>? availableDurations,
    List<String>? availableProfileNames,
  }) {
    return FilterState(
      locations: locations ?? this.locations,
      durations: durations ?? this.durations,
      profileNames: profileNames ?? this.profileNames,
      availableLocations: availableLocations ?? this.availableLocations,
      availableDurations: availableDurations ?? this.availableDurations,
      availableProfileNames:
          availableProfileNames ?? this.availableProfileNames,
    );
  }
}

final filterProvider =
    StateNotifierProvider<FilterProvider, FilterState>((ref) {
  final repository = ref.watch(internshipRepositoryProvider);
  return FilterProvider(repository);
});
