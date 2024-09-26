import 'dart:async'; // For Timer
import 'dart:convert'; // For jsonDecode
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key});

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  final List<Map<String, dynamic>> _records = []; // List to store records
  bool _isLoading = true;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _fetchData();
    _timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      _fetchData();
    });
  }

  Future<void> _fetchData() async {
    try {
      final response = await http.get(Uri.parse(
          'https://sihtesting-default-rtdb.firebaseio.com/sensor.json'));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as Map<String, dynamic>;

        setState(() {
          final currentTime = DateTime.now().toLocal().toIso8601String();
          // Add new record to the top of the list
          _records.insert(0, {
            'time': currentTime,
            'ecoli': data['ecoli'] ?? 'N/A',
            'ph': data['ph'] ?? 'N/A',
            'tds': data['tds'] ?? 'N/A',
            'temperature': data['temperature'] ?? 'N/A',
            'turbidity': data['turbidity'] ?? 'N/A',
          });

          // Optional: Limit the number of records displayed
          if (_records.length > 50) {
            _records.removeLast();
          }

          _isLoading = false;
        });
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Result Screen")),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Center(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: DataTable(
                  columns: const [
                    DataColumn(label: Text('Time')),
                    DataColumn(label: Text('eColi')),
                    DataColumn(label: Text('pH')),
                    DataColumn(label: Text('TDS')),
                    DataColumn(label: Text('Temperature')),
                    DataColumn(label: Text('Turbidity')),
                  ],
                  rows: _records.map((record) {
                    return DataRow(cells: [
                      DataCell(Text(record['time'])),
                      DataCell(Text('${record['ecoli']} npn')),
                      DataCell(Text('${record['ph']}')),
                      DataCell(Text('${record['tds']} ppm')),
                      DataCell(Text('${record['temperature']} °C')),
                      DataCell(Text('${record['turbidity']} NTU')),
                    ]);
                  }).toList(),
                ),
              ),
            ),
    );
  }
}
