import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/bloc/MainBloc.dart';

class MainProvider extends StatefulWidget{
  final Widget child;

	const MainProvider({
		required this.child
	});

	@override
	_MainProviderState createState() => _MainProviderState();
}

class _MainProviderState extends State<MainProvider>{

  final mainBloc = new MainBloc();


  @override
  void dispose() {
		mainBloc.close();
    super.dispose();
  }

  @override
	Widget build(BuildContext context) {
		return MultiBlocProvider(
			providers: [
				BlocProvider(create: (context) => mainBloc),
			],
			child: widget.child,
		);
	}
}