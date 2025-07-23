class AuthUserState {}

class AuthInitialState extends AuthUserState {}

class AuthLoadingState extends AuthUserState {}

class UserRegistrationSuccessState extends AuthUserState {}

class UserRegistrationFailedState extends AuthUserState {}

class UserExistsState extends AuthUserState {}

class UserDoesNotExist extends AuthUserState {}

class LoginFailedState extends AuthUserState {}

class LoginSuccessState extends AuthUserState {}


class UserInformationErrorState extends AuthUserState {}
