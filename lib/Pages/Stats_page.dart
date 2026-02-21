import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class StatsPage extends StatelessWidget {
  const StatsPage({super.key});

  static const primaryOrange = Color(0xffF58220);
  static const darkOrange = Color(0xffE65100);
  static const lightOrange = Color(0xffFFB74D);
  static const bgColor = Color(0xffFFF8F2);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Dashboard", style: TextStyle(color: Colors.black)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            /// 🔥 TOTAL REVENUE CARD
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [primaryOrange, darkOrange],
                ),
                boxShadow: [
                  BoxShadow(
                    color: primaryOrange.withOpacity(0.4),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Total Revenue",
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "₹4,89,400",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    "+18% this month",
                    style: TextStyle(color: Colors.white70, fontSize: 13),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            /// 📊 MODERN GRAPH CARD
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(22),
                boxShadow: const [
                  BoxShadow(color: Colors.black12, blurRadius: 15),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Revenue Overview",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(height: 25),
                  SizedBox(
                    height: 240,
                    child: BarChart(
                      BarChartData(
                        alignment: BarChartAlignment.spaceAround,
                        maxY: 30,
                        borderData: FlBorderData(show: false),
                        gridData: FlGridData(
                          show: true,
                          drawVerticalLine: false,
                          horizontalInterval: 10,
                        ),
                        titlesData: FlTitlesData(
                          leftTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: true),
                          ),
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              getTitlesWidget: (value, meta) {
                                const months = [
                                  "Jan",
                                  "Feb",
                                  "Mar",
                                  "Apr",
                                  "May",
                                  "Jun",
                                ];
                                return Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: Text(
                                    months[value.toInt()],
                                    style: const TextStyle(fontSize: 12),
                                  ),
                                );
                              },
                            ),
                          ),
                          topTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                          rightTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                        ),
                        barGroups: [
                          makeBar(0, 12),
                          makeBar(1, 18),
                          makeBar(2, 15),
                          makeBar(3, 22),
                          makeBar(4, 17),
                          makeBar(5, 26),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            /// 🎨 4 GRADIENT CARDS
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 1.15,
              children: const [
                DashboardCard(
                  title: "Total Agents",
                  value: "197",
                  icon: Icons.people,
                ),
                DashboardCard(
                  title: "Customers",
                  value: "2,659",
                  icon: Icons.person,
                ),
                DashboardCard(
                  title: "Annual Deals",
                  value: "489",
                  icon: Icons.favorite,
                ),
                DashboardCard(
                  title: "Conversion",
                  value: "32.8%",
                  icon: Icons.trending_up,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  static BarChartGroupData makeBar(int x, double y) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          width: 18,
          borderRadius: BorderRadius.circular(12),
          gradient: const LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Color.fromARGB(255, 250, 138, 40),
              Color.fromARGB(255, 246, 174, 68),
            ],
          ),
        ),
      ],
    );
  }
}

class DashboardCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const DashboardCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
  });

  static const primaryOrange = Color(0xffF58220);
  static const lightOrange = Color(0xffFFB74D);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [primaryOrange, lightOrange],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: primaryOrange.withOpacity(0.4),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.white),
          const Spacer(),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            title,
            style: const TextStyle(color: Colors.white70, fontSize: 13),
          ),
        ],
      ),
    );
  }
}
