import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, dynamic>> _pendapatan = [
    {
      "date": DateTime(2018, 1, 1),
      "sales": 40,
    },
    {
      "date": DateTime(2019, 1, 1),
      "sales": 10,
    },
    {
      "date": DateTime(2020, 1, 1),
      "sales": 30,
    },
    {
      "date": DateTime(2021, 1, 1),
      "sales": 80,
    },
    {
      "date": DateTime(2022, 1, 1),
      "sales": 40,
    }
  ];
  final List<Map<String, dynamic>> _pengeluaran = [
    {
      "date": DateTime(2018, 1, 1),
      "sales": 41,
    },
    {
      "date": DateTime(2019, 1, 1),
      "sales": 20,
    },
    {
      "date": DateTime(2020, 1, 1),
      "sales": 37,
    },
    {
      "date": DateTime(2021, 1, 1),
      "sales": 30,
    },
    {
      "date": DateTime(2022, 1, 1),
      "sales": 10,
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        backgroundColor: Colors.blue,
        title: const Text(
          'Beranda',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: ListView(
          children: [
            const SizedBox(height: 20),
            Center(
              child: const Text(
                "Penghasilan Bulan Ini",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            const SizedBox(height: 10),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 221, 44, 44),
                        backgroundImage: AssetImage('assets/icon/expenses.png'),
                      ),
                      title: Text(
                        "Pengeluaran",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                      subtitle: Text(
                        "Rp. 50.000",
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 16, 187, 59),
                        backgroundImage: AssetImage('assets/icon/profits.png'),
                      ),
                      title: Text(
                        "Pendapatan",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                      subtitle: Text(
                        "Rp. 100.000",
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Builder(
              builder: (context) {
                return Container(
                  margin: const EdgeInsets.only(top: 15),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      width: 1.0,
                      color: Colors.grey[400]!,
                    ),
                  ),
                  height: 300,
                  // color: Theme.of(context).cardColor,
                  padding: const EdgeInsets.all(2.0),
                  child: SfCartesianChart(
                    title: ChartTitle(
                      text: 'Grafik',
                      textStyle: const TextStyle(fontSize: 12),
                      alignment: ChartAlignment.center,
                    ),
                    legend: const Legend(
                        isVisible: true, position: LegendPosition.bottom),
                    primaryXAxis: DateTimeAxis(
                      // Atur format tanggal sesuai dengan preferensi Anda
                      dateFormat: DateFormat.E(),
                    ),
                    series: <ChartSeries>[
                      LineSeries<Map<String, dynamic>, DateTime>(
                        name: 'Pendapatan',
                        dataSource: _pendapatan,
                        color: Colors.green,
                        xValueMapper: (Map<String, dynamic> data, _) =>
                            data["date"],
                        yValueMapper: (Map<String, dynamic> data, _) =>
                            data["sales"],
                      ),
                      LineSeries<Map<String, dynamic>, DateTime>(
                        name: 'Pengeluaran',
                        dataSource: _pengeluaran,
                        color: Colors.red,
                        xValueMapper: (Map<String, dynamic> data, _) =>
                            data["date"],
                        yValueMapper: (Map<String, dynamic> data, _) =>
                            data["sales"],
                      ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            const Center(
              child: Text(
                "Menu",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 4,
              padding: const EdgeInsets.all(4),
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
              children: [
                Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  color: Colors.white,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'assets/icon/income.png',
                          height: 40,
                        ),
                        const Text(
                          "Income",
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  color: Colors.white,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'assets/icon/outcome.png',
                          height: 40,
                        ),
                        const Text(
                          "Outcome",
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  color: Colors.white,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'assets/icon/details.png',
                          height: 40,
                        ),
                        const Text(
                          "Cash Flow",
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  color: Colors.white,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'assets/icon/details.png',
                          height: 40,
                        ),
                        const Text(
                          "Cash Flow",
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
