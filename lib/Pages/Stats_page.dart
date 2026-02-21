import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class StatsPage extends StatefulWidget {
  const StatsPage({super.key});

  @override
  State<StatsPage> createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> {
  static const primaryOrange = Color(0xffF58220);
  static const bgColor = Color(0xffFFF6ED);

  /// 🔥 Animated Values
  List<double> values = [0, 0, 0, 0, 0, 0];

  @override
  void initState() {
    super.initState();

    /// Delay so animation visible
    Future.delayed(const Duration(milliseconds: 400), () {
      setState(() {
        values = [12, 18, 15, 22, 17, 26];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Dashboard",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            /// 🔥 UNIQUE TOP CARD
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                gradient: const LinearGradient(
                  colors: [Color(0xffF58220), Color(0xffFF9F45)],
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    right: -40,
                    top: -40,
                    child: Container(
                      height: 140,
                      width: 140,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(0.08),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Total Revenue",
                        style: TextStyle(color: Colors.white70),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        "₹ 4,89,400",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 6),
                      const Text(
                        "+18% this month",
                        style: TextStyle(color: Colors.white70),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            /// 📊 ANIMATED GRAPH CARD
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Revenue Overview",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 220,
                    child: BarChart(
                      BarChartData(
                        alignment: BarChartAlignment.spaceAround,
                        maxY: 30,
                        borderData: FlBorderData(show: false),
                        gridData: FlGridData(show: false),
                        titlesData: FlTitlesData(
                          leftTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                          rightTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                          topTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
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
                                  padding: const EdgeInsets.only(top: 6),
                                  child: Text(
                                    months[value.toInt()],
                                    style: const TextStyle(fontSize: 12),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        barGroups: List.generate(
                          values.length,
                          (index) => makeBar(index, values[index]),
                        ),
                      ),
                      swapAnimationDuration: const Duration(milliseconds: 900),
                      swapAnimationCurve: Curves.easeOutCubic,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            /// 🫧 BUBBLE CARDS
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: 1,
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
          width: 16,
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            colors: [Color(0xffF58220), Color(0xffFFD1A3)],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
      ],
    );
  }
}

/// 🫧 Bubble Dashboard Cards
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

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        gradient: const LinearGradient(
          colors: [Color(0xffFFE5D0), Color(0xffFFD1B0)],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.orange.withOpacity(0.15),
            blurRadius: 20,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.6),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: primaryOrange, size: 24),
          ),
          const Spacer(),
          Text(
            value,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 6),
          Text(
            title,
            style: const TextStyle(fontSize: 13, color: Colors.black54),
          ),
        ],
      ),
    );
  }
}
  