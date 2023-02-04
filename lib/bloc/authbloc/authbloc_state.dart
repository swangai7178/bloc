// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
part of 'authbloc_bloc.dart';

abstract class AuthblocState extends Equatable {
  const AuthblocState();

  @override
  List<Object> get props => [];
}

class AuthblocInitial extends AuthblocState {
  @override
  List<Object> get props => [];
}

class AuthSuccess extends AuthblocState {
  @override
  List<Object> get props => [];
}

class AuthLoading extends AuthblocState {}

class Autherror extends AuthblocState {
  String messageerror;
  Autherror({
    required this.messageerror,
  });
  @override
  List<Object> get props => [messageerror];

  Autherror copyWith({
    String? messageerror,
  }) {
    return Autherror(
      messageerror: messageerror ?? this.messageerror,
    );
  }

  @override
  bool operator ==(covariant Autherror other) {
    if (identical(this, other)) return true;

    return other.messageerror == messageerror;
  }

  @override
  int get hashCode => messageerror.hashCode;
}
