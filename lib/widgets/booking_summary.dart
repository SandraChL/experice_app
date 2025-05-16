import 'package:flutter/material.dart';

import '../utils/colors.dart';

class BookingSummaryCard extends StatefulWidget {
  final String location;
  final String dates;
  final String occupancy;

  const BookingSummaryCard({
    super.key,
    required this.location,
    required this.dates,
    required this.occupancy,
  });

  @override
  State<BookingSummaryCard> createState() => _BookingSummaryCardState();
}

class _BookingSummaryCardState extends State<BookingSummaryCard> {
  bool _isEditing = false;
  bool _showRoomPicker = false;
  DateTimeRange? selectedRange;
  late TextEditingController _destinationController;

  final ScrollController _roomScrollController = ScrollController();

  final List<Map<String, dynamic>> _rooms = [
    {'adults': 2, 'children': 0, 'childAges': <int>[]},
  ];

  @override
  void initState() {
    super.initState();
    _destinationController = TextEditingController(text: widget.location);
  }

  @override
  void dispose() {
    _destinationController.dispose();
    _roomScrollController.dispose();
    super.dispose();
  }

  void _selectDateRange() async {
    final picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );

    if (picked != null) {
      setState(() {
        selectedRange = picked;
      });
    }
  }

  void _updateOccupancyDisplay() {
    setState(() {
      _showRoomPicker = false;
    });
  }

  String _calculateSummary() {
    int totalPeople = 0;
    for (var room in _rooms) {
      //totalPeople += room['adults'] + room['children'];
      totalPeople +=
          (room['adults'] as num).toInt() + (room['children'] as num).toInt();
    }
    return '${_rooms.length} Room – $totalPeople People';
  }

  void _showRoomLimitWarning() {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Room limit reached'),
            content: const Text(
              'You can only add up to 5 rooms. For more, please contact support.',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      controller: _destinationController,
                      enabled: _isEditing,
                      decoration: const InputDecoration(
                        isDense: true,
                        border: InputBorder.none,
                      ),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    if (!_isEditing)
                      Text(
                        //'${selectedRange?.start.toString().split(' ')[0] ?? widget.dates} – ${selectedRange?.end.toString().split(' ')[0] ?? ''}   ${_calculateSummary()}','${selectedRange?.start.toString().split(' ')[0] ?? widget.dates} – ${selectedRange?.end.toString().split(' ')[0] ?? ''}\n${_calculateSummary()}'
                        '${selectedRange?.start.toString().split(' ')[0] ?? widget.dates}  ${selectedRange?.end.toString().split(' ')[0] ?? ''}\n${_calculateSummary()}',

                        style: const TextStyle(
                          color: Colors.black54,
                          fontSize: 13,
                        ),
                      ),
                  ],
                ),
              ),
              IconButton(
                icon: Icon(
                  _isEditing ? Icons.expand_less : Icons.edit_note_outlined,
                  color: Colors.black87,
                ),
                onPressed: () {
                  setState(() {
                    _isEditing = !_isEditing;
                  });
                },
              ),
            ],
          ),
          if (_isEditing) ...[
            const Divider(height: 20),
            _buildDateSelector(),
            const SizedBox(height: 12),
            _buildGuestsSection(),
          ],
        ],
      ),
    );
  }

  Widget _buildDateSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
            Icon(Icons.calendar_today, size: 18),
            SizedBox(width: 8),
            Text(
              'Dates',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: _selectDateRange,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    selectedRange?.start.toString().split(' ')[0] ?? 'Check-in',
                    style: const TextStyle(color: Colors.black54),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text('-'),
            ),
            Expanded(
              child: GestureDetector(
                onTap: _selectDateRange,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    selectedRange?.end.toString().split(' ')[0] ?? 'Check-out',
                    style: const TextStyle(color: Colors.black54),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildGuestsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              _showRoomPicker = !_showRoomPicker;
            });
          },
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                const Icon(Icons.people, size: 24),
                const SizedBox(width: 8),
                Text(
                  _calculateSummary(),
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
        ),
        if (_showRoomPicker) ...[
          const SizedBox(height: 8),
          Container(
            constraints: const BoxConstraints(maxHeight: 250),
            child: Scrollbar(
              controller: _roomScrollController,
              thumbVisibility: true,
              child: SingleChildScrollView(
                controller: _roomScrollController,
                child: Column(
                  children: List.generate(
                    _rooms.length,
                    (index) => _buildRoomCard(index),
                  ),
                ),
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              if (_rooms.length >= 5) {
                _showRoomLimitWarning();
              } else {
                setState(() {
                  _rooms.add({
                    'adults': 2,
                    'children': 0,
                    'childAges': <int>[],
                  });
                });
                Future.delayed(const Duration(milliseconds: 300), () {
                  _roomScrollController.animateTo(
                    _roomScrollController.position.maxScrollExtent,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOut,
                  );
                });
              }
            },
            child: const Text(
              'Add room',
              style: TextStyle(color: AppColors.primaryBlue),
            ),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: 16),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryBlue,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onPressed: _updateOccupancyDisplay,
              child: const Text('Ready'),
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildRoomCard(int index) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Room (${index + 1})',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              if (_rooms.length > 1)
                IconButton(
                  icon: const Icon(Icons.delete, size: 18),
                  onPressed: () {
                    setState(() {
                      _rooms.removeAt(index);
                    });
                  },
                ),
            ],
          ),
          const Divider(),
          _buildCounterRow(index, 'Adults', 'adults'),
          const SizedBox(height: 8),
          _buildCounterRow(index, 'Children', 'children'),
          if (_rooms[index]['children'] > 0) ...[
            Column(
              children: List.generate(_rooms[index]['children'], (childIndex) {
                List<int> childAges = _rooms[index]['childAges'];
                // Extend list if needed
                if (childAges.length <= childIndex) {
                  childAges.add(0);
                }
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: DropdownButtonFormField<int>(
                    value: childAges[childIndex],
                    items: List.generate(18, (age) {
                      return DropdownMenuItem(
                        value: age,
                        child: Text('Child age $age'),
                      );
                    }),
                    onChanged: (value) {
                      setState(() {
                        // childAges[childIndex] = value!;
                        childAges[childIndex] = value!.toInt();
                      });
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12,
                      ),
                    ),
                  ),
                );
              }),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildCounterRow(int index, String label, String key) {
    return Row(
      children: [
        Expanded(
          child: Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
        ),
        IconButton(
          icon: const Icon(Icons.remove_circle_outline),
          onPressed:
              _rooms[index][key] > 0
                  ? () {
                    setState(() {
                      _rooms[index][key]--;
                      if (key == 'children') {
                        _rooms[index]['childAges'].removeLast();
                      }
                    });
                  }
                  : null,
        ),
        Text('${_rooms[index][key]}', style: const TextStyle(fontSize: 16)),
        IconButton(
          icon: const Icon(Icons.add_circle_outline),
          onPressed: () {
            setState(() {
              _rooms[index][key]++;
              if (key == 'children') {
                _rooms[index]['childAges'].add(0);
              }
            });
          },
        ),
      ],
    );
  }
}
