import 'package:equatable/equatable.dart';
import 'package:user_repository/src/entities/entities.dart';

class MyUser extends Equatable {
  final String userId;
  final String name;
  final String email;
  final String userImageUrl;

  const MyUser({
    required this.userId,
    required this.name,
    required this.email,
    required this.userImageUrl,
  });

  static const empty =
      MyUser(userId: '', name: '', email: '', userImageUrl: '');

  MyUser copyWith({
    String? userId,
    String? name,
    String? email,
    String? userImageUrl,
  }) {
    return MyUser(
      userId: userId ?? this.userId,
      name: name ?? this.name,
      email: email ?? this.email,
      userImageUrl: userImageUrl ?? this.userImageUrl,
    );
  }

  bool get isEmpty => this == MyUser.empty;
  bool get isNotEmpty => this != MyUser.empty;

  MyUserEntity toEntity() {
    return MyUserEntity(
      userId: userId,
      name: name,
      email: email,
      userImageUrl: userImageUrl,
    );
  }

  static MyUser fromEntity(MyUserEntity entity) {
    return MyUser(
      userId: entity.userId,
      name: entity.name,
      email: entity.email,
      userImageUrl: entity.userImageUrl,
    );
  }

  @override
  List<Object?> get props => [userId, name, email, userImageUrl];
}
