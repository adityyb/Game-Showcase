import 'package:flutter/material.dart';

class FilterWidget extends StatelessWidget {
  final String selectedPublisher;
  final Function(String?) onPublisherChanged;
  final List<String> publisherItems;

  FilterWidget({
    required this.selectedPublisher,
    required this.onPublisherChanged,
    required this.publisherItems,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          const Text('Filter by Publisher: '),
          const SizedBox(width: 10.0),
          DropdownButton<String>(
            value: selectedPublisher,
            items: [
              const DropdownMenuItem<String>(
                value: 'All',
                child: Text('All'),
              ),
              ...publisherItems.map(
                    (publisher) => DropdownMenuItem<String>(
                  child: Text(publisher),
                  value: publisher,
                ),
              ),
            ],
            onChanged: onPublisherChanged,
          ),
        ],
      ),
    );
  }
}
