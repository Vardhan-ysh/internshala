class Internship {
  final int id;
  final String title;
  final String employmentType;
  final String companyName;
  final String companyUrl;
  final bool isPremium;
  final String employerName;
  final String companyLogo;
  final String url;
  final bool isActive;
  final String profileName;
  final bool partTime;
  final String startDate;
  final String duration;
  final Stipend stipend;
  final String postedOn;
  final String applicationDeadline;
  final List<Location> locations;

  Internship({
    required this.id,
    required this.title,
    required this.employmentType,
    required this.companyName,
    required this.companyUrl,
    required this.isPremium,
    required this.employerName,
    required this.companyLogo,
    required this.url,
    required this.isActive,
    required this.profileName,
    required this.partTime,
    required this.startDate,
    required this.duration,
    required this.stipend,
    required this.postedOn,
    required this.applicationDeadline,
    required this.locations,
  });

  factory Internship.fromJson(Map<String, dynamic> json) {
    return Internship(
      id: json['id'] ?? 0,
      title: json['title'] ?? "null",
      employmentType: json['employment_type'] ?? "null",
      companyName: json['company_name'] ?? "null",
      companyUrl: json['company_url'] ?? "null",
      isPremium: json['is_premium'] ?? "",
      employerName: json['employer_name'] ?? false,
      companyLogo: json['company_logo'] ?? "null",
      url: json['url'] ?? "null",
      isActive: json['is_active'] ?? false,
      profileName: json['profile_name'] ?? "null",
      partTime: json['part_time'] ?? false,
      startDate: json['start_date'] ?? "null",
      duration: json['duration'] ?? "null",
      stipend: Stipend.fromJson(json['stipend']),
      postedOn: json['posted_on'] ?? "null",
      applicationDeadline: json['application_deadline'] ?? "null",
      locations: (json['locations'] as List)
          .map((location) => Location.fromJson(location))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'employment_type': employmentType,
      'company_name': companyName,
      'company_url': companyUrl,
      'is_premium': isPremium,
      'employer_name': employerName,
      'company_logo': companyLogo,
      'url': url,
      'is_active': isActive,
      'profile_name': profileName,
      'part_time': partTime,
      'start_date': startDate,
      'duration': duration,
      'stipend': stipend.toJson(),
      'posted_on': postedOn,
      'application_deadline': applicationDeadline,
      'locations': locations.map((location) => location.toJson()).toList(),
    };
  }
}

class Stipend {
  final String salary;
  final int salaryValue1;

  Stipend({
    required this.salary,
    required this.salaryValue1,
  });

  factory Stipend.fromJson(Map<String, dynamic> json) {
    return Stipend(
      salary: json['salary'] ?? "null",
      salaryValue1: json['salaryValue1'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'salary': salary,
      'salaryValue1': salaryValue1,
    };
  }
}

class Location {
  final String string;
  final String country;
  final String region;
  final String locationName;

  Location({
    required this.string,
    required this.country,
    required this.region,
    required this.locationName,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      string: json['string'] ?? "null",
      country: json['country'] ?? "null",
      region: json['region'] ?? "null",
      locationName: json['locationName'] ?? "null",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'string': string,
      'country': country,
      'region': region,
      'locationName': locationName,
    };
  }
}
