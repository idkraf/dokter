import 'patient.dart';

class Appointment extends Patient {
  Appointment(
      {
        required this.appoitmentComment,
        this.appoitmentDate,
        this.appoitmentTime,
        this.imgLink,
        this.patienSurname,
        this.patientNama,
        this.phoneNumber,
        this.isFuture
      }
  ) : super.named(patientNama!,imgLink!,phoneNumber!,patienSurname!);

  String? patientNama;
  String? patienSurname, imgLink, phoneNumber;
  String? appoitmentDate;
  String? appoitmentTime;
  String? appoitmentComment;
  bool? isFuture;
}
