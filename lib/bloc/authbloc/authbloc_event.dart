// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
part of 'authbloc_bloc.dart';

abstract class AuthblocEvent extends Equatable {
  const AuthblocEvent();

  @override
  List<Object> get props => [];
}

class LoginEvent extends AuthblocEvent {
  String email;
  String password;
  LoginEvent({
    required this.email,
   required  this.password,
  });
  @override
  List<Object> get props => [];

  LoginEvent copyWith({
    String? email,
    String? password,
  }) {
    return LoginEvent(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  @override
  bool operator ==(covariant LoginEvent other) {
    if (identical(this, other)) return true;

    return other.email == email && other.password == password;
  }

  @override
  int get hashCode => email.hashCode ^ password.hashCode;
}
