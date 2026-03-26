import 'package:bill_splitter/card_amount_text.dart';
import 'package:flutter/material.dart';

class BillSplitterScreen extends StatefulWidget {
  const BillSplitterScreen({super.key});

  @override
  State<BillSplitterScreen> createState() => _BillSplitterScreenState();
}

class _BillSplitterScreenState extends State<BillSplitterScreen> {
  double billAmount = 0.0;
  double totalBill = 0.0;
  double totalPerPerson = 0.0;
  double totalTip = 0.0;

  double tipPercentage = 20;
  int persons = 3;

  void calculateResults() {
    totalTip = (billAmount / 100) * tipPercentage;
    totalBill = billAmount + totalTip;
    totalPerPerson = totalBill / persons;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(title: Text('Bill Splitter'), centerTitle: true),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 24,
                ),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    CardAmountText(
                      amount: totalPerPerson,
                      text: 'Total per person',
                      isTitleAmount: true,
                    ),
                    const Divider(color: Colors.white24, height: 32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CardAmountText(amount: totalBill, text: 'Total Bill'),
                        CardAmountText(amount: totalTip, text: 'Total Tip'),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              TextField(
                keyboardType: const TextInputType.numberWithOptions(),
                style: TextStyle(color: theme.colorScheme.onSurface),
                decoration: const InputDecoration(
                  hintText: 'Bill Amount',
                  prefixIcon: Icon(Icons.attach_money),
                  border: OutlineInputBorder(),
                ),
                onChanged: (amount) {
                  setState(() {
                    billAmount = double.tryParse(amount) ?? 0;
                    calculateResults();
                  });
                },
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Tip %',
                    style: TextStyle(
                      color: theme.colorScheme.onSurface,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    '${tipPercentage.toInt()}%',
                    style: TextStyle(
                      color: theme.colorScheme.onSurface,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              SliderTheme(
                data: SliderThemeData(
                  tickMarkShape: SliderTickMarkShape.noTickMark,
                ),
                child: Slider(
                  value: tipPercentage,
                  min: 0,
                  max: 50,
                  divisions: 50,
                  label: '${tipPercentage.toInt()}%',
                  onChanged: (percentage) => setState(() {
                    tipPercentage = percentage;
                    calculateResults();
                  }),
                ),
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Split',
                    style: TextStyle(
                      color: theme.colorScheme.onSurface,
                      fontSize: 18,
                    ),
                  ),
                  Row(
                    children: [
                      IconButton.filledTonal(
                        onPressed: persons > 1
                            ? () {
                                setState(() {
                                  persons--;
                                  calculateResults();
                                });
                              }
                            : null,
                        icon: const Icon(Icons.remove),
                      ),
                      SizedBox(
                        width: 50,
                        child: Text(
                          textAlign: TextAlign.center,
                          persons.toString(),
                          style: TextStyle(
                            color: theme.colorScheme.onSurface,
                            fontSize: 22,
                          ),
                        ),
                      ),
                      IconButton.filledTonal(
                        onPressed: () {
                          setState(() {
                            persons++;
                            calculateResults();
                          });
                        },
                        icon: const Icon(Icons.add),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
