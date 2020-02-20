final List<Project> projects = [
  // Project(title: '', description: '', tags: [], logo: '', images: [], link: ''),
  Project(
    title: 'Flutter',
    description:
        "orem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
    tags: ['Swift', 'Flutter'],
    logo: '',
    images: [],
    link: '',
  ),
  // Project(title: '', description: '', tags: [], logo: '', images: [], link: ''),
];

class Project {
  final String title;
  final String description;
  final List<String> tags;
  final String logo;
  final List<String> images;
  final String link;

  Project({
    this.title,
    this.description,
    this.tags,
    this.logo,
    this.images,
    this.link,
  });
}
