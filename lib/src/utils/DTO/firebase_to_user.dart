import 'package:schedule/src/data/repos/authentication/models.dart';

class UserDTO {
  final String uid;
  final String? displayName;
  final String? photoUrl;
  final String? email;

  UserDTO({
    required this.uid,
    this.displayName,
    this.photoUrl,
    this.email,
  });

  /// Перетворення з Firebase User у DTO
  factory UserDTO.fromFirebaseUser(user) {
    return UserDTO(
      uid: user.uid,
      displayName: user.displayName,
      photoUrl: user.photoUrl,
      email: user.email,
    );
  }

  /// Перетворення DTO у AuthenticatedUser
  AuthenticatedUser toAuthenticatedUser() {
    return AuthenticatedUser(
      uid: uid,
      displayName: displayName,
      photoUrl: photoUrl,
      email: email,
    );
  }
}
