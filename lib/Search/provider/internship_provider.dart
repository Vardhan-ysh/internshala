import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:internshala/model/internship_model.dart';
import 'package:internshala/repository/internship_repository.dart';
import 'package:internshala/repository/provider/repository_provider.dart';
import 'filter_provider.dart';

class InternshipProvider extends StateNotifier<List<Internship>> {
  final InternshipRepository _repository;
  final Ref _ref;

  InternshipProvider(this._repository, this._ref) : super([]) {
    fetchInternships();
    _ref.listen<FilterState>(filterProvider, (previous, next) {
      fetchInternships();
    });
  }

  Future<void> fetchInternships() async {
    try {
      final filterState = _ref.read(filterProvider);
      final internships = await _repository.getFilteredInternships(
        locations: filterState.locations,
        durations: filterState.durations,
        profileNames: filterState.profileNames,
      );
      state = internships;
    } catch (e) {
      print('Failed to fetch internships: $e');
    }
  }
}

final internshipProvider = StateNotifierProvider<InternshipProvider, List<Internship>>((ref) {
  final repository = ref.watch(internshipRepositoryProvider);
  return InternshipProvider(repository, ref);
});