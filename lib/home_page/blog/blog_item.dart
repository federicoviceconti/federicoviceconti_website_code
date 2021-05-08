class BlogItem {
  String title;
  String description;
  String? imageUrl;
  String? path;
  BlogType type;

  BlogItem(
    this.title,
    this.description,
    this.imageUrl,
    this.type,
    this.path,
  );
}

enum BlogType {
  medium, link
}

extension BlogTypeExtension on BlogType {
  String? get name => const {
    BlogType.medium: 'medium',
    BlogType.link: 'link',
  }[this];
}
