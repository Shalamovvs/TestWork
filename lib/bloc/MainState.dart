import 'package:equatable/equatable.dart';
import 'package:myapp/models/repos/Repos.dart';

abstract class MainState extends Equatable{
  MainState();

	@override
	List<Object> get props => [];
}

class MainInitial extends MainState {}

class MainLoading extends MainState {}

class MainFailure extends MainState {
  final String title;
  final String? text;

  MainFailure({required this.title,this.text});

  @override
	List<Object> get props => [title, text!];
}

class MainSuccess extends MainState{
  final List<Rep> reposList;

  MainSuccess({required this.reposList});

  @override
	List<Object> get props => [reposList];
}