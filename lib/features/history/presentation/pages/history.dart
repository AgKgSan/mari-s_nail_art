import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mari_nail_art/features/history/presentation/widgets/job_commision_card.dart';
import 'package:mari_nail_art/features/history/presentation/widgets/job_history_card.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  String _selectedFilter = 'Today';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: const [
            Icon(Icons.history, color: Colors.black),
            SizedBox(width: 8),
            Text(
              'History',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'This Month (June)',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black54,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 12),

            // Metrics Row
            Row(
              children: const [
                Expanded(
                  child: JobCommisionCard(
                    icon: Icons.check_circle_outline,
                    title: 'Jobs',
                    value: '14',
                    subtitle: 'Total Done',
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: JobCommisionCard(
                    icon: Icons.monetization_on_outlined,
                    title: 'Commission',
                    value: '14000',
                    subtitle: 'mMK',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Dynamic Date Header (Formats to "June 20, 2026")
                Text(
                  DateFormat('MMMM d, yyyy').format(DateTime.now()),
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),

                // Interactive Dropdown Menu
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: const Color(0xFFF492B1),
                      width: 1.5,
                    ),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: _selectedFilter,
                      icon: const Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.black87,
                        size: 20,
                      ),
                      elevation: 3,
                      style: const TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        fontFamily:
                            'sans-serif', // Prevents layout style shifting
                      ),
                      onChanged: (String? newValue) {
                        if (newValue != null) {
                          setState(() {
                            _selectedFilter = newValue;
                          });
                          // TODO: Add logic here to filter your list items based on the selection
                        }
                      },
                      items:
                          <String>[
                            'Today',
                            'This Week',
                            'Last Week',
                            'This Month',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Job Lists
            const JobHistoryCard(
              jobTitle: 'Gel Colour',
              price: '35000 MMK',
              customerName: 'Aye Aye',
              date: 'june 8, 2026',
              time: '09:00 AM to 11:00 PM',
              // Special Highlighted Border
            ),
            const JobHistoryCard(
              jobTitle: 'Gel Colour',
              price: '35000 MMK',
              customerName: 'Walk In Customer',
              date: 'june 8, 2026',
              time: '09:00 AM to 11:00 PM',
            ),
          ],
        ),
      ),
    );
  }
}
