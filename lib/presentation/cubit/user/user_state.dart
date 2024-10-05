part of 'user_cubit.dart';

@immutable
// sealed class UserState {}

// final class UserInitial extends UserState {}
class UserState {
  final User user;
  final FirebaseDatabaseService _firebaseService;

  const UserState(this.user, this._firebaseService,  );
}
