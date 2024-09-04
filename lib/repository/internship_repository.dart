// internship_repository.dart

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:internshala/model/internship_model.dart';
// import 'internship_model.dart';

class InternshipRepository {
  final String apiUrl = "https://internshala.com/flutter_hiring/search";

  Future<List<Internship>> fetchInternships() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);

        // Extract internships from internships_meta
        final internshipsMeta =
            data['internships_meta'] as Map<String, dynamic>;
        final List<Internship> internships = internshipsMeta.values
            .map((json) => Internship.fromJson(json))
            .toList();

        return internships;
      } else {
        throw Exception("Failed to load internships");
      }
    } catch (e) {
      throw Exception("Failed to load internships: $e");
    }
  }

  Future<List<String>> getAvailableProfiles() async {
    try {
      final internships = await fetchInternships();
      return internships
          .map((internship) => internship.profileName)
          .toSet() // Remove duplicates
          .toList();
    } catch (e) {
      throw Exception("Failed to fetch profiles: $e");
    }
  }

  Future<List<String>> getAvailableDurations() async {
    try {
      final internships = await fetchInternships();
      return internships
          .map((internship) => internship.duration)
          .toSet()
          .toList();
    } catch (e) {
      throw Exception("Failed to fetch durations: $e");
    }
  }

  Future<List<String>> getAvailableLocations() async {
    try {
      final internships = await fetchInternships();
      final locations = internships
          .expand((internship) => internship.locations)
          .map((location) => location.locationName)
          .toSet()
          .toList();
      return locations;
    } catch (e) {
      throw Exception("Failed to fetch locations: $e");
    }
  }

  Future<List<Internship>> getFilteredInternships({
    List<String>? locations,
    List<String>? durations,
    List<String>? profileNames,
  }) async {
    try {
      final internships = await fetchInternships();
      return internships.where((internship) {
        final matchesLocation = locations == null ||
            locations.isEmpty ||
            locations.any((location) => internship.locations
                .any((loc) => loc.locationName.contains(location)));
        final matchesDuration = durations == null ||
            durations.isEmpty ||
            durations.any((duration) => internship.duration.contains(duration));
        final matchesProfileName = profileNames == null ||
            profileNames.isEmpty ||
            profileNames.any(
                (profileName) => internship.profileName.contains(profileName));
        return matchesLocation && matchesDuration && matchesProfileName;
      }).toList();
    } catch (e) {
      throw Exception('Failed to filter internships: $e');
    }
  }
}
