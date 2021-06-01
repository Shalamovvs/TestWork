import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/bloc/MainBloc.dart';
import 'package:myapp/bloc/MainState.dart';

class MainListener extends StatelessWidget{
  final Widget child;

	const MainListener({
		required this.child
	});

  @override
	Widget build(BuildContext context){
    return MultiBlocListener(
      child: child,
      listeners: [
        BlocListener<MainBloc, MainState>(
					listener: (context, state) {
            ScaffoldMessenger.of(context).removeCurrentSnackBar();
            if(state is MainFailure)
            {
              ScaffoldMessenger.of(context).showSnackBar(
                getDefaultSnackBar(
                  context: context, 
                  text: state.title, 
                  closeText: "Ok",
                  secondText: state.text
                )
              );
            }
					},
				),
      ]
    );
  }
}

SnackBar getDefaultSnackBar({
	required BuildContext context,
	required String text,
	String? secondText,
	String? closeText
}){
	return SnackBar(
		duration: const Duration(seconds: 5),
		action: closeText != null
			? SnackBarAction(
					label: "ок",
					textColor: Colors.white,
					onPressed: (){
						ScaffoldMessenger.of(context).removeCurrentSnackBar();
					}
				)
			: null,
		content: RichText(

			text: TextSpan(
				children: [
					TextSpan(
						text: text,
						style: const TextStyle(
							fontSize: 18
						),
					),
					if (secondText != null)
						TextSpan(
							text: ": $secondText",
							style: const TextStyle(
								fontSize: 14
							),
						)
				]
			)
		)
	);
}