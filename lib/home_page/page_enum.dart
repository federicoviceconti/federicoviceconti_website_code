enum PageEnum {
  home,
  aboutMe,
  blog
}

extension PageEnumExtension on PageEnum {
  int? get pageIndex => const {
    PageEnum.home: 0,
    PageEnum.aboutMe: 1,
    PageEnum.blog: 2
  }[this];
}