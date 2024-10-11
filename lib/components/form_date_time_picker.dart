import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_dorm/constant/constant.dart';

class FormDatePicker extends StatefulWidget {
  const FormDatePicker({super.key});

  @override
  State<FormDatePicker> createState() => _FormDatePickerState();
}

class _FormDatePickerState extends State<FormDatePicker> {
  // Variables to store selected date and time
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  // Method to pick a date
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  // Method to pick a time
  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTime ?? TimeOfDay.now(),
    );
    if (pickedTime != null && pickedTime != selectedTime) {
      setState(() {
        selectedTime = pickedTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // Date Picker Field
        InkWell(
          onTap: () => _selectDate(context),
          child: InputDecorator(
            decoration: basicInputDecoration('Tanggal'),
            child: Text(
              selectedDate == null
                  ? 'Pilih Tanggal'
                  : DateFormat('dd/MM/yyyy').format(selectedDate!),
              style: const TextStyle(color: Colors.black),
            ),
          ),
        ),
        const SizedBox(height: 20),
        // Time Picker Field
        InkWell(
          onTap: () => _selectTime(context),
          child: InputDecorator(
            decoration: basicInputDecoration('Waktu'),
            child: Text(
              selectedTime == null
                  ? 'Pilih Waktu'
                  : selectedTime!.format(context),
              style: const TextStyle(color: Colors.black),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}
