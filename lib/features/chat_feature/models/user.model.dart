class UserModel {
  final String uid;
  final String name;
  final String email;
  final String image;
  final bool isDoctor;
  final DateTime lastActive;
  final bool isOnline;

  const UserModel({
    required this.name,
    required this.image,
    required this.lastActive,
    required this.uid,
    required this.email,
    required this.isDoctor,
    this.isOnline = false,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        uid: json['uid'],
        name: json['name'],
        image: json['image'],
        email: json['email'],
        isDoctor: json['isDoctor'],
        isOnline: json['isOnline'] ?? false,
        lastActive: json['lastActive'].toDate(),
      );

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'name': name,
        'image': image,
        'email': email,
        'isDoctor': isDoctor,
        'isOnline': isOnline,
        'lastActive': lastActive,
      };
}
