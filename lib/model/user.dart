class User {
  final String userName;
  final String email;
  final String urlAvatar;
  final String urlCoverPic;
  bool isFavIconClicked;

  User({
    required this.userName,
    required this.email,
    required this.urlAvatar,
    required this.isFavIconClicked,
    required this.urlCoverPic,
  });
}

class UserList {
  final List<User> users = [
    User(
      isFavIconClicked: false,
      userName: 'John Mayer',
      email: 'john.mayer@gmail.com',
      urlAvatar:
          'https://images.unsplash.com/photo-1519764622345-23439dd774f7?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=3160&q=80',
      urlCoverPic:
          'https://images.unsplash.com/photo-1615196534055-7aa534f6836b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGNvdmVyJTIwcGhvdG98ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
    ),
    User(
      isFavIconClicked: false,
      userName: 'Justin Walsh',
      email: 'walshjustin@gmail.com',
      urlAvatar:
          'https://images.unsplash.com/photo-1531384441138-2736e62e0919?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80',
      urlCoverPic:
          'https://images.unsplash.com/photo-1457369804613-52c61a468e7d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTh8fGNvdmVyJTIwcGhvdG98ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
    ),
    User(
      isFavIconClicked: false,
      userName: 'Brooke Craig',
      email: 'bcraig@outlook.com',
      urlAvatar:
          'https://images.unsplash.com/photo-1542596768-5d1d21f1cf98?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80',
      urlCoverPic:
          'https://images.unsplash.com/photo-1549937915-3dd443a3583f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzR8fGNvdmVyJTIwcGhvdG98ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
    ),
    User(
      isFavIconClicked: false,
      userName: 'Jameson Cook',
      email: 'cook.jameson@yahoo.com',
      urlAvatar:
          'https://images.unsplash.com/photo-1534614971-6be99a7a3ffd?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80',
      urlCoverPic:
          'https://images.unsplash.com/photo-1623627484632-f041d1fb366d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8Y292ZXIlMjBwaG90b3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60',
    ),
    User(
      isFavIconClicked: false,
      userName: 'Alia Kapoor',
      email: 'alia.kapoor@outlook.com',
      urlAvatar:
          'https://images.unsplash.com/photo-1469334031218-e382a71b716b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2370&q=80',
      urlCoverPic:
          'https://images.unsplash.com/photo-1515181635393-2b788c0435c6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NTd8fGNvdmVyJTIwcGhvdG98ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
    ),
    User(
      isFavIconClicked: false,
      userName: 'Katrina Kaushal',
      email: 'kkaushal@gmail.com',
      urlAvatar:
          'https://images.unsplash.com/photo-1531746020798-e6953c6e8e04?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1364&q=80',
      urlCoverPic:
          'https://images.unsplash.com/photo-1487088678257-3a541e6e3922?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fGNvdmVyJTIwcGhvdG98ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
    ),
  ]; // 24 users data
}
