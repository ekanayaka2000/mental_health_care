import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:table_calendar/table_calendar.dart';

class AnalyticsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Analytics"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildGrowthAreaChart(),
            SizedBox(height: 20),
            _buildMoodTracker(),
            SizedBox(height: 20),
            _buildMoodCalendar(),
          ],
        ),
      ),
    );
  }

  // Radar Chart for Growth Area
  Widget _buildGrowthAreaChart() {
    return Card(
      elevation: 5,
      shadowColor: Colors.grey.withOpacity(0.5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Growth Area",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 220,
              child: RadarChart(
                RadarChartData(
                  radarTouchData: RadarTouchData(enabled: false),
                  dataSets: [
                    RadarDataSet(
                      dataEntries: [
                        RadarEntry(value: 4),
                        RadarEntry(value: 3),
                        RadarEntry(value: 2.5),
                        RadarEntry(value: 5),
                        RadarEntry(value: 4),
                        RadarEntry(value: 3.5),
                      ],
                      borderColor: Colors.blue,
                      fillColor: Colors.blue.withOpacity(0.3),
                    ),
                  ],
                  titlePositionPercentageOffset: 0.15,
                  getTitle: (index, angle) {
                    switch (index) {
                      case 0:
                        return RadarChartTitle(text: 'Mental Health');
                      case 1:
                        return RadarChartTitle(text: 'Stress Management');
                      case 2:
                        return RadarChartTitle(text: 'Mindset');
                      case 3:
                        return RadarChartTitle(text: 'Personal Development');
                      case 4:
                        return RadarChartTitle(text: 'Relationships');
                      case 5:
                        return RadarChartTitle(text: 'Self Awareness');
                      default:
                        return RadarChartTitle(text: '');
                    }
                  },
                  gridBorderData: BorderSide(color: Colors.blue, width: 1),
                  radarBorderData: BorderSide(color: Colors.blue, width: 1),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Line Chart for Mood Tracker
  Widget _buildMoodTracker() {
    return Card(
      elevation: 5,
      shadowColor: Colors.grey.withOpacity(0.5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Mood Tracker",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 150,
              child: LineChart(
                LineChartData(
                  lineBarsData: [
                    LineChartBarData(
                      spots: [
                        FlSpot(0, 2),
                        FlSpot(1, 2.5),
                        FlSpot(2, 3),
                        FlSpot(3, 2.7),
                        FlSpot(4, 3.5),
                        FlSpot(5, 4),
                        FlSpot(6, 4.2),
                      ],
                      isCurved: true,
                      barWidth: 2,
                      color: Colors.blue,
                    ),
                  ],
                  titlesData: FlTitlesData(
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          const days = ["M", "T", "W", "T", "F", "S", "S"];
                          return Text(
                            days[value.toInt()],
                            style: TextStyle(fontSize: 12),
                          );
                        },
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Calendar for Mood Calendar
  Widget _buildMoodCalendar() {
    return Card(
      elevation: 5,
      shadowColor: Colors.grey.withOpacity(0.5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Mood Calendar",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            TableCalendar(
              focusedDay: DateTime.now(),
              firstDay: DateTime(2020),
              lastDay: DateTime(2030),
              calendarFormat: CalendarFormat.month,
              calendarStyle: CalendarStyle(
                todayDecoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
                defaultDecoration: BoxDecoration(
                  color: Colors.grey[200],
                  shape: BoxShape.circle,
                ),
                selectedDecoration: BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
