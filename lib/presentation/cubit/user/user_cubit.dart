import 'package:bloc/bloc.dart';
import 'package:koyar/presentation/features/auth/models/user_model.dart';
import 'package:koyar/presentation/service/firebaseDatabaseService.dart';
import 'package:meta/meta.dart';

part 'user_state.dart';

// class UserCubit extends Cubit<UserState> {
//   UserCubit() : super(UserInitial());
// }
 

class UserCubit extends Cubit<User> {
  final FirebaseDatabaseService? firebaseService;

  UserCubit({this.firebaseService}) : super(User());

  void updateId(String id) => emit(User(
        id: id,
        nin: state.nin,
        stateOfRegistration: state.stateOfRegistration,
        lgaOfRegistration: state.lgaOfRegistration,
        electionPreferences: state.electionPreferences,
      ));

  void updateNin(String nin) => emit(User(
        id: state.id,
        nin: nin,
        stateOfRegistration: state.stateOfRegistration,
        lgaOfRegistration: state.lgaOfRegistration,
        electionPreferences: state.electionPreferences,
      ));

  void updateStateOfRegistration(String stateOfRegisteration) => emit(User(
        id: state.id,
        nin: state.nin,
        stateOfRegistration: stateOfRegisteration,
        lgaOfRegistration: state. lgaOfRegistration,
        electionPreferences: state.electionPreferences,
      ));

  void updateLgaOfRegistration(String lgaOfRegisteration) => emit(User(
        id: state.id,
        nin: state.nin,
        stateOfRegistration: state.stateOfRegistration,
        lgaOfRegistration: lgaOfRegisteration,
        electionPreferences: state.electionPreferences,
      ));

  void updateElectionPreferences(List<String> preferences) => emit(User(
        id: state.id,
        nin: state.nin,
        stateOfRegistration: state.stateOfRegistration,
        lgaOfRegistration: state.lgaOfRegistration,
        electionPreferences: preferences,
      ));

  Future<void> saveUser() async {
    if (state.id != null && state.nin != null) {
      await firebaseService!.writeUser(  state );
    }
  }
}
