import 'package:equatable/equatable.dart';

class MyUserEntity extends Equatable {
  final String userId;
  final String name;
  final String email;
  final String userImageUrl;

  const MyUserEntity({
    required this.userId,
    required this.name,
    required this.email,
    required this.userImageUrl,
  });

  Map<String, Object?> toDocument() {
    return {
      'userId': userId,
      'name': name,
      'email': email,
      'userImageUrl': userImageUrl,
    };
  }

  static MyUserEntity fromDocument(Map<String, dynamic> doc) {
    return MyUserEntity(
      userId: doc['userId'],
      name: doc['name'],
      email: doc['email'],
      userImageUrl: doc['userImageUrl'],
    );
  }

  @override
  List<Object?> get props => [userId, email, name, userImageUrl];

  @override
  String toString() {
    return '''UserEntity : {
      userId: $userId
      email: $email
      name: $name
      userImageUrl: $userImageUrl
    }''';
  }
}
