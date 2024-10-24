import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:koyar/presentation/cubit/user/user_cubit.dart';
import 'package:koyar/presentation/features/auth/dropDownWidget.dart';
import 'package:nigerian_states_and_lga/nigerian_states_and_lga.dart';

import '../../../common/appButton.dart';
import '../../../manager/routeManager.dart';
import '../../../manager/styleManager.dart';

class LGAscreen extends HookWidget {
  const LGAscreen({super.key, required this.stateItemSelected});

  final String stateItemSelected;

  @override
  Widget build(BuildContext context) {
    final lgaItemSelected = useState<String>('');

    // Ensure we always have a valid list of LGAs or an empty list
    final List<String> lgaList = useMemoized(() {
      return stateItemSelected.isNotEmpty
          ? NigerianStatesAndLGA.getStateLGAs(stateItemSelected)
          : [];
    }, [stateItemSelected]);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const SizedBox(height: 200),
                  Center(
                    child: Text(
                      "LOCAL\nGOVERNMENT OF\nREGISTRATION",
                      textAlign: TextAlign.center,
                      style: getBlackZodiak(fontsize: 32),
                      semanticsLabel:
                          "What is your Local Government of Registration",
                      softWrap: true,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Semantics(
                    button: true,
                    label: "Select Your Local Government of Registration here",
                    child: DropDownWidget(
                      itemSelected: lgaItemSelected.value,
                      items: lgaList, // List of LGAs or an empty list
                      label: 'LGA of Registration',
                      onChanged: (val) {
                        if (val != null) {
                          lgaItemSelected.value = val;
                        }
                      },
                    ),
                  ),
                  const SizedBox(height: 100),
                ],
              ),
              Column(
                children: [
                  Semantics(
                    label: "Next, submit your Local Government of Registration",
                    child: KoyarButton(
                      onPressed: () {
                        if (lgaItemSelected.value.isNotEmpty) {
                          context
                              .read<UserCubit>()
                              .updateNin(lgaItemSelected.value);
                           
                        }
                          context.go(BaseRouteName.electionPreferencePage);
                      },
                      buttonText: "Next",
                    ),
                  ),
                  const SizedBox(height: 10)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
