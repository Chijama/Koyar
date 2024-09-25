import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:koyar/presentation/common/customTextField.dart';

// First, let's create a Cubit to manage the state
class DateTimePickerCubit extends Cubit<DateTime?> {
  DateTimePickerCubit() : super(null);

  void setDateTime(DateTime? dateTime) => emit(dateTime);
}

class DateTimePicker extends StatelessWidget {
  final String label;

  const DateTimePicker({
    super.key,
    required this.label,
  });

  void _showDatePicker(BuildContext context, DateTimePickerCubit cubit) {
    showDatePicker(
      context: context,
      initialDate: cubit.state ?? DateTime.now(),
      firstDate: DateTime(1900, 1),
      lastDate: DateTime.now(),
    ).then((selectedDate) {
      if (selectedDate != null) {
        final currentTime = cubit.state?.toLocal();
        final newDateTime = DateTime(
          selectedDate.year,
          selectedDate.month,
          selectedDate.day,
          currentTime?.hour ?? 0,
          currentTime?.minute ?? 0,
        );
        cubit.setDateTime(newDateTime);
      }
    });
  }

  // void _showTimePicker(BuildContext context, DateTimePickerCubit cubit) {
  //   showTimePicker(
  //     context: context,
  //     initialTime: TimeOfDay.fromDateTime(cubit.state ?? DateTime.now()),
  //   ).then((selectedTime) {
  //     if (selectedTime != null) {
  //       final currentDate = cubit.state?.toLocal() ?? DateTime.now();
  //       final newDateTime = DateTime(
  //         currentDate.year,
  //         currentDate.month,
  //         currentDate.day,
  //         selectedTime.hour,
  //         selectedTime.minute,
  //       );
  //       cubit.setDateTime(newDateTime);
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DateTimePickerCubit(),
      child: BlocBuilder<DateTimePickerCubit, DateTime?>(
        builder: (context, dateTime) {
          final cubit = context.read<DateTimePickerCubit>();
          return CustomBoxTextField(
            onTap: () => _showDatePicker(context, cubit),
            label: label,
            hintText: 'Date',
            readOnly: true,
            controller: TextEditingController(
              text: dateTime?.toLocal().toString().split(' ')[0] ?? '',
            ),
            suffixIcon: const Icon(Icons.calendar_today),
          );
        },
      ),
    );
  }
}
