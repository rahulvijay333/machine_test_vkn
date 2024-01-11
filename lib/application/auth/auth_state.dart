part of 'auth_bloc.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthVerified extends AuthState {}

class AuthNotVeriied extends AuthState {}
