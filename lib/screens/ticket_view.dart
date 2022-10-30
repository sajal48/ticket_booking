
import 'package:flutter/material.dart';

import 'package:gap/gap.dart';
import 'package:ticket_booking/utils/app_layout.dart';
import 'package:ticket_booking/utils/styles.dart';
import 'package:ticket_booking/widgets/thick_container.dart';

class TicketView extends StatelessWidget {
  const TicketView({super.key, required this.ticket});
  final Map<String, dynamic> ticket;

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return SizedBox(
      width: size.width * .85,
      height: AppLayout.getHeight(200),
      child: Container(
        margin: EdgeInsets.only(right: AppLayout.getHeight(16)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            //blue part of ticket
            Container(
              decoration: BoxDecoration(
                  color: Styles.blueColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(AppLayout.getWidth(21)),
                      topRight: Radius.circular(AppLayout.getWidth(21)))),
              padding: EdgeInsets.all(AppLayout.getHeight(16)),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(ticket['from']['code'],
                          style: Styles.headLinetStyle3
                              .copyWith(color: Colors.white)),
                      Expanded(child: Container()),
                      const ThickContainer(),
                      Expanded(
                          child: Stack(
                        children: [
                          SizedBox(
                            height: AppLayout.getHeight(24),
                            child: LayoutBuilder(
                              builder: (BuildContext context,
                                  BoxConstraints constraints) {
                                return Flex(
                                  direction: Axis.horizontal,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  mainAxisSize: MainAxisSize.max,
                                  children: List.generate(
                                      (constraints.constrainWidth() / 6)
                                          .floor(),
                                      (index) => SizedBox(
                                            width: AppLayout.getWidth(3),
                                            height: AppLayout.getHeight(1),
                                            child: const DecoratedBox(
                                                decoration: BoxDecoration(
                                                    color: Colors.white)),
                                          )),
                                );
                              },
                            ),
                          ),
                          Center(
                            child: Transform.rotate(
                              angle: 1.5,
                              child: const Icon(
                                Icons.local_airport_rounded,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      )),
                      const ThickContainer(),
                      Expanded(child: Container()),
                      Text(
                        ticket['to']['code'],
                        style: Styles.headLinetStyle3
                            .copyWith(color: Colors.white),
                      )
                    ],
                  ),
                  const Gap(3),
                  Row(
                    children: [
                      SizedBox(
                        width: AppLayout.getWidth(70),
                        child: Text(
                          ticket['from']['name'],
                          overflow: TextOverflow.fade,
                          style: Styles.headLinetStyle4
                              .copyWith(color: Colors.white),
                        ),
                      ),
                      const Spacer(),
                      SizedBox(
                        width: AppLayout.getWidth(70),
                        child: Text(
                          ticket['flying_time'],
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.fade,
                          style: Styles.headLinetStyle4
                              .copyWith(color: Colors.white),
                        ),
                      ),
                      const Spacer(),
                      SizedBox(
                        width: AppLayout.getWidth(70),
                        child: Text(
                          ticket['to']['name'],
                          overflow: TextOverflow.fade,
                          textAlign: TextAlign.end,
                          style: Styles.headLinetStyle4
                              .copyWith(color: Colors.white),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),

            // orange part

            Container(
              color: Styles.orangeColor,
              child: Row(
                children: [
                  SizedBox(
                    height: AppLayout.getWidth(20),
                    width: AppLayout.getWidth(10),
                    child: DecoratedBox(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                bottomRight:
                                    Radius.circular(AppLayout.getWidth(10)),
                                topRight:
                                    Radius.circular(AppLayout.getWidth(10))))),
                  ),
                  Expanded(
                      child: Padding(
                    padding: EdgeInsets.all(AppLayout.getWidth(12)),
                    child: LayoutBuilder(
                      builder:
                          (BuildContext context, BoxConstraints constraints) {
                        return Flex(
                          direction: Axis.horizontal,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: List.generate(
                              (constraints.constrainWidth() / 15).floor(),
                              (index) => SizedBox(
                                    width: AppLayout.getWidth(5),
                                    height: AppLayout.getHeight(1),
                                    child: const DecoratedBox(
                                        decoration:
                                            BoxDecoration(color: Colors.white)),
                                  )),
                        );
                      },
                    ),
                  )),
                  SizedBox(
                    height: AppLayout.getHeight(20),
                    width: AppLayout.getWidth(10),
                    child: DecoratedBox(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                bottomLeft:
                                    Radius.circular(AppLayout.getWidth(10)),
                                topLeft:
                                    Radius.circular(AppLayout.getWidth(10))))),
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Styles.orangeColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(AppLayout.getWidth(21)),
                      bottomRight: Radius.circular(AppLayout.getWidth(21)))),
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(ticket['date'],
                          style: Styles.headLinetStyle3
                              .copyWith(color: Colors.white)),
                      Text(
                        "Date",
                        style: Styles.headLinetStyle4
                            .copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(ticket['departure_time'],
                          style: Styles.headLinetStyle3
                              .copyWith(color: Colors.white)),
                      Text(
                        "Departure time",
                        style: Styles.headLinetStyle4
                            .copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        ticket['number'].toString(),
                        style: Styles.headLinetStyle3
                            .copyWith(color: Colors.white),
                      ),
                      Text(
                        "Number",
                        textAlign: TextAlign.end,
                        style: Styles.headLinetStyle4
                            .copyWith(color: Colors.white),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
