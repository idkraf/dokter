import 'package:dokter/model/Appointment.dart';
import 'package:dokter/sizeConfig.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'AppointmentBackCard.dart';
import 'AppointmentFrontCard.dart';
import 'SlidingCard.dart';


///This is the main Appointment card 
///it regroups the AppointmentFrontCard 
///and AppointmentBacktCard together 
///using my future dart package ''SlidingCard''
class AppointmentCard extends StatelessWidget {
  const AppointmentCard({
    Key? key,
    this.slidingCardController ,required this.appointmentData, required this.onCardTapped
  }) : super(key: key);
  final Appointment? appointmentData;
  final  SlidingCardController? slidingCardController;
  final Function? onCardTapped;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if (kDebugMode) {
          print('Well the card was tapped');
        }
        onCardTapped!();
      },
          child: SlidingCard(
        slimeCardElevation: 0.5,
        cardsGap: SizeConfig.safeBlockVertical!,
        controller: slidingCardController!,
        slidingCardWidth: SizeConfig.horizontalBloc! * 90,
        visibleCardHeight: SizeConfig.safeBlockVertical! * 27,
        hiddenCardHeight: SizeConfig.safeBlockVertical! * 15,
        frontCardWidget: AppointmentFrontCard(
          imgLink: appointmentData!.imgLink!,
          patienName: appointmentData!.patientNama!,
          patienSurname: appointmentData!.patientSurName!,
          appointmentDate: appointmentData!.appoitmentDate!,
          appointmentTime: appointmentData!.appoitmentTime!,
          onInfoTapped: () {
            if (kDebugMode) {
              print('info pressed');
            }
            slidingCardController!.expandCard!();
          },
          onDecline: () {
            if (kDebugMode) {
              print('Declined');
            }
          },
          onAccep: () {
            if (kDebugMode) {
              print('Accepted');
            }
          },
          onRedCloseButtonTapped: (){
            slidingCardController!.collapseCard!();
          },
        ),
        backCardWidget:AppointmentBackCard(
          onPhoneTapped: (){if (kDebugMode) {
            print('Phone tapped');
          }},
          patientComment: appointmentData!.appoitmentComment!
        ),
      ),
    );
  }
}

