class ProfileDetails {
  final String title;
  final String category;
  final String imageUrl;
  ProfileDetails({
    required this.imageUrl,
    required this.title,
    required this.category,
  });
}

List<ProfileDetails> loadProfileDetails() {
  var pd = <ProfileDetails>[
    ProfileDetails(
        title: 'Geetika',
        category: 'dddd',
        imageUrl:
            'https://t3.ftcdn.net/jpg/05/54/79/98/360_F_554799811_UzZU63BgMMArG6k8JChnQkeHzRbp3DMJ.jpg'),
    ProfileDetails(
        title: 'anu',
        category: 'dddd',
        imageUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRZwFTtXxzgyX3o7MUN-xJZiP3HDgVt5TcMNPSVnleX68jujL-m3drx-hnyvwQ7ocXDNSg&usqp=CAU'),
  ];
  return pd;
}
