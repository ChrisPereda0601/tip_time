import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tip_time/tip_time_provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tip time'),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                children: [
                  Icon(Icons.room_service_rounded),
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Cost of service',
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                      ),
                      onChanged: (costo) {
                        context.read<TipTimeProvider>().agregarCosto(costo);
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Icon(Icons.line_style_sharp),
                  SizedBox(width: 20),
                  Text(
                    'How was the service?',
                    style: TextStyle(fontSize: 17),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Consumer<TipTimeProvider>(builder: (context, prov, _) {
                return Column(
                  children: [
                    Row(
                      children: [
                        Radio<ServiceQuality>(
                          value: ServiceQuality.amazing,
                          groupValue: prov.getServiceQuality,
                          onChanged: (value) {
                            prov.setServiceQuality(value!);
                          },
                        ),
                        Text(
                          'Amazing 20%',
                          style: TextStyle(fontSize: 17),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Radio<ServiceQuality>(
                          value: ServiceQuality.good,
                          groupValue: prov.getServiceQuality,
                          onChanged: (value) {
                            prov.setServiceQuality(value!);
                          },
                        ),
                        Text(
                          'Good 18%',
                          style: TextStyle(fontSize: 17),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Radio<ServiceQuality>(
                          value: ServiceQuality.okay,
                          groupValue: prov.getServiceQuality,
                          onChanged: (value) {
                            prov.setServiceQuality(value!);
                          },
                        ),
                        Text(
                          'Okay 15%',
                          style: TextStyle(fontSize: 17),
                        )
                      ],
                    ),
                  ],
                );
              }),
              SizedBox(height: 10),
              Row(
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.credit_card),
                          SizedBox(width: 50),
                          Text(
                            "Round up tip",
                            style: TextStyle(fontSize: 17),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(width: 150),
                  Column(
                    children: [
                      Consumer<TipTimeProvider>(builder: (context, prov, _) {
                        return Switch(
                          value: prov.getIsSelected,
                          onChanged: (newValue) {
                            prov.botonSwitch(newValue);
                          },
                          activeTrackColor: Colors.green,
                          activeColor: Colors.grey,
                        );
                      })
                    ],
                  )
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        context.read<TipTimeProvider>().calcularMonto();
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.green),
                      ),
                      child: Text("CALCULATE"),
                    ),
                  )
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Tip amount: \$${context.watch<TipTimeProvider>().getMonto.toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 17),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
