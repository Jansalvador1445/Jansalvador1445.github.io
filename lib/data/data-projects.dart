final List<Project> projects = [
  Project(title: '', description: '', tags: [], logo: '', images: [], link: ''),
  Project(title: '', description: '', tags: [], logo: '', images: [], link: ''),
  Project(title: '', description: '', tags: [], logo: '', images: [], link: ''),
];

class Project {
  final String title;
  final String description;
  final List<String> tags;
  final String logo;
  final List<String> images;
  final String link;

  Project(
      {this.title,
      this.description,
      this.tags,
      this.logo,
      this.images,
      this.link});
}
