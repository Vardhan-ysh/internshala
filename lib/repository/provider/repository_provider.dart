import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:internshala/repository/internship_repository.dart';

final internshipRepositoryProvider = Provider<InternshipRepository>((ref) {
  return InternshipRepository();
});
