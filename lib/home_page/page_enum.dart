enum PageEnum {
  home,
  aboutMe,
  contacts
}

extension PageEnumExtension on PageEnum {
  int? get pageIndex => const {
    PageEnum.home: 0,
    PageEnum.aboutMe: 1,
    PageEnum.contacts: 2,
  }[this];
}