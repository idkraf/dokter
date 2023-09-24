import 'package:cached_network_image/cached_network_image.dart';
import 'package:dokter/model/Appointment.dart';
import 'package:dokter/sizeConfig.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MiniAppointmentCard extends StatelessWidget {
  final Appointment appointmentData;
  final Function onCardTapped;
  const MiniAppointmentCard({
    required this.appointmentData,
    required this.onCardTapped,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (kDebugMode) {
          print('Mini appointment Card tapped');
        }
        onCardTapped();
      },
      child: Card(
        elevation: 0.3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: Container(
          width: SizeConfig.horizontalBloc! * 90,
          height: SizeConfig.verticalBloc! * 8.7,
          decoration: BoxDecoration(
              color: Colors.white10, borderRadius: BorderRadius.circular(30)),
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: Stack(
                    clipBehavior: Clip.none, children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            image: DecorationImage(
                                image: CachedNetworkImageProvider(
                                    appointmentData.imgLink!),
                                fit: BoxFit.fill),
                            borderRadius: BorderRadius.circular(20)),
                        height: SizeConfig.safeBlockVertical! * 8,
                        width: SizeConfig.safeBlockHorizontal! * 15,
                      ),
                      Positioned(
                        right: -3,
                        bottom: -0.5,
                        child: Container(
                          width: SizeConfig.safeBlockHorizontal! * 4.5,
                          height: SizeConfig.safeBlockHorizontal! * 4.5,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white),
                              color: const Color(0xff5EFF38)),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  flex: 10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: SizeConfig.safeBlockVertical! * 3,
                        width: SizeConfig.safeBlockHorizontal! * 90,
                        //color: Colors.yellow,
                        child: Text(
                          '${appointmentData.patientSurName} ${appointmentData.patientNama!}',
                          style: TextStyle(
                              fontSize: SizeConfig.safeBlockHorizontal! * 4,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87),
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.safeBlockVertical! * 3,
                        width: SizeConfig.safeBlockHorizontal! * 90,
                        //color: Colors.pink,
                        child: Text(
                          '${appointmentData.appoitmentDate!}, ${appointmentData.appoitmentTime!}',
                          style: TextStyle(
                            fontSize: SizeConfig.safeBlockHorizontal! * 3.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: IconButton(
                    color: Colors.black54,
                    iconSize: SizeConfig.safeBlockHorizontal! * 7,
                    onPressed: () {
                      if (kDebugMode) {
                        print('3 dots icon tapped');
                      }
                    },
                    icon: const Icon(Icons.more_vert),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
