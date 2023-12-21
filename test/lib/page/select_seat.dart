import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/provider/seat_provider.dart';
import 'package:test/widget/error_dialog.dart';
import 'package:test/widget/seat_widget.dart';
import 'package:test/widget/selected_seat_widget.dart';

class SelectSeatPage extends StatefulWidget {
  const SelectSeatPage({Key? key}) : super(key: key);

  @override
  State<SelectSeatPage> createState() => _SelectSeatPage();
}

class _SelectSeatPage extends State<SelectSeatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'เลือกที่นั่ง',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
        ),
        body: Consumer<SeatProvider>(builder: (context, provider, _) {
          if (provider.loadStatus == LoadStatus.loading) {
            return SizedBox(
                height: MediaQuery.sizeOf(context).height - 250,
                child: const Center(child: CircularProgressIndicator()));
          } else if (provider.loadStatus == LoadStatus.fail) {
            return const ErrorDialog();
          } else {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: [
                Column(
                  children: [
                    ...List.generate(provider.seat.seatLayout!.columns!,
                        (index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              const SizedBox(
                                height: 12,
                              ),
                              Text(
                                String.fromCharCode(index + 65),
                              ),
                            ],
                          ),
                          ...List.generate(provider.seat.seatLayout!.rows!,
                              (i) {
                            int indexCurrent =
                                index * provider.seat.seatLayout!.rows! + i;
                            return Padding(
                              padding: const EdgeInsets.all(5),
                              child: Column(
                                children: [
                                  if (index == 0) Text((i + 1).toString()),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  SeatWidget(
                                    seats: provider
                                        .seat.seatLayout!.seats![indexCurrent],
                                    onTap: () {
                                      if (provider.seat.seatLayout!
                                              .seats![indexCurrent].status ==
                                          'available') {
                                        provider.selectSeat(indexCurrent);
                                      }
                                    },
                                  ),
                                ],
                              ),
                            );
                          })
                        ],
                      );
                    }),
                    const Divider(),
                    const SizedBox(
                      height: 20,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'ที่นั่ง',
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    if (provider.select.isNotEmpty)
                      ...List.generate(provider.select.length, (index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SelectedSeatWidget(
                              seatNumber: provider.select[index].seatNumber!,
                              onTap: () {
                                provider.unselectSeat(index);
                              },
                            )
                          ],
                        );
                      })
                  ],
                ),
              ]),
            );
          }
        }));
  }
}
