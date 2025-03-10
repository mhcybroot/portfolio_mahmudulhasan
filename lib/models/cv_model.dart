class CV {
  final PersonalInfo personalInfo;
  final String professionalSummary;
  final List<Achievement> achievements;
  final List<Experience> experience;
  final List<Education> education;
  final Skills skills;
  final List<Project> projects;

  CV({
    required this.personalInfo,
    required this.professionalSummary,
    required this.achievements,
    required this.experience,
    required this.education,
    required this.skills,
    required this.projects,
  });

  factory CV.fromJson(Map<String, dynamic> json) {
    return CV(
      personalInfo: PersonalInfo.fromJson(json['personalInfo']),
      professionalSummary: json['professionalSummary'],
      achievements: (json['achievements'] as List)
          .map((e) => Achievement.fromJson(e))
          .toList(),
      experience: (json['experience'] as List)
          .map((e) => Experience.fromJson(e))
          .toList(),
      education: (json['education'] as List)
          .map((e) => Education.fromJson(e))
          .toList(),
      skills: Skills.fromJson(json['skills']),
      projects: (json['projects'] as List)
          .map((e) => Project.fromJson(e))
          .toList(),
    );
  }
}

class PersonalInfo {
  final String name;
  final String title;
  final Contact contact;

  PersonalInfo({
    required this.name,
    required this.title,
    required this.contact,
  });

  factory PersonalInfo.fromJson(Map<String, dynamic> json) {
    return PersonalInfo(
      name: json['name'],
      title: json['title'],
      contact: Contact.fromJson(json['contact']),
    );
  }
}

class Contact {
  final String email;
  final String phone;
  final String location;
  final String github;
  final String linkedin;

  Contact({
    required this.email,
    required this.phone,
    required this.location,
    required this.github,
    required this.linkedin,
  });

  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
      email: json['email'],
      phone: json['phone'],
      location: json['location'],
      github: json['github'],
      linkedin: json['linkedin'],
    );
  }
}

class Achievement {
  final String title;
  final List<AchievementItem> items;

  Achievement({
    required this.title,
    required this.items,
  });

  factory Achievement.fromJson(Map<String, dynamic> json) {
    return Achievement(
      title: json['title'],
      items: (json['items'] as List)
          .map((e) => AchievementItem.fromJson(e))
          .toList(),
    );
  }
}

class AchievementItem {
  final String position;
  final String event;
  final int year;

  AchievementItem({
    required this.position,
    required this.event,
    required this.year,
  });

  factory AchievementItem.fromJson(Map<String, dynamic> json) {
    return AchievementItem(
      position: json['position'],
      event: json['event'],
      year: json['year'],
    );
  }
}

class Experience {
  final String title;
  final String company;
  final String? duration;
  final List<String> responsibilities;
  final List<Repository>? repositories;

  Experience({
    required this.title,
    required this.company,
    this.duration,
    required this.responsibilities,
    this.repositories,
  });

  factory Experience.fromJson(Map<String, dynamic> json) {
    return Experience(
      title: json['title'],
      company: json['company'],
      duration: json['duration'],
      responsibilities: List<String>.from(json['responsibilities']),
      repositories: json['repositories'] != null
          ? (json['repositories'] as List)
              .map((e) => Repository.fromJson(e))
              .toList()
          : null,
    );
  }
}

class Repository {
  final String name;
  final String url;

  Repository({
    required this.name,
    required this.url,
  });

  factory Repository.fromJson(Map<String, dynamic> json) {
    return Repository(
      name: json['name'],
      url: json['url'],
    );
  }
}

class Education {
  final String degree;
  final String institution;
  final String status;
  final List<String>? coursework;
  final String? batch;
  final String? description;

  Education({
    required this.degree,
    required this.institution,
    required this.status,
    this.coursework,
    this.batch,
    this.description,
  });

  factory Education.fromJson(Map<String, dynamic> json) {
    return Education(
      degree: json['degree'],
      institution: json['institution'],
      status: json['status'],
      coursework: json['coursework'] != null
          ? List<String>.from(json['coursework'])
          : null,
      batch: json['batch'],
      description: json['description'],
    );
  }
}

class Skills {
  final List<String> mobileDevelopment;
  final List<String> backendAndDesktopDevelopment;
  final List<String> iotAndHardware;
  final List<String> networkingAndSecurity;
  final List<String> linuxAndSystemAdministration;
  final List<String> cloudAndDevOps;
  final List<String> softSkills;

  Skills({
    required this.mobileDevelopment,
    required this.backendAndDesktopDevelopment,
    required this.iotAndHardware,
    required this.networkingAndSecurity,
    required this.linuxAndSystemAdministration,
    required this.cloudAndDevOps,
    required this.softSkills,
  });

  factory Skills.fromJson(Map<String, dynamic> json) {
    return Skills(
      mobileDevelopment: List<String>.from(json['mobileDevelopment']),
      backendAndDesktopDevelopment:
          List<String>.from(json['backendAndDesktopDevelopment']),
      iotAndHardware: List<String>.from(json['iotAndHardware']),
      networkingAndSecurity: List<String>.from(json['networkingAndSecurity']),
      linuxAndSystemAdministration:
          List<String>.from(json['linuxAndSystemAdministration']),
      cloudAndDevOps: List<String>.from(json['cloudAndDevOps']),
      softSkills: List<String>.from(json['softSkills']),
    );
  }
}

class Project {
  final String name;
  final List<String> description;
  final String? repository;

  Project({
    required this.name,
    required this.description,
    this.repository,
  });

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      name: json['name'],
      description: List<String>.from(json['description']),
      repository: json['repository'],
    );
  }
} 