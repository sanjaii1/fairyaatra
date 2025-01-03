import "package:flutter/material.dart";

class FlightCard extends StatelessWidget {
  final String? tag;
  final String airline;
  final String flightCode;
  final String departureTime;
  final String arrivalTime;
  final String duration;
  final String price;
  final bool isSelected;

  const FlightCard({
    Key? key,
    this.tag,
    required this.airline,
    required this.flightCode,
    required this.departureTime,
    required this.arrivalTime,
    required this.duration,
    required this.price,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 5,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (tag != null)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: isSelected ? Colors.green[100] : Colors.blue[100],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                tag!,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: isSelected ? Colors.green : Colors.blue,
                ),
              ),
            ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "$airline $flightCode",
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              Text(
                price,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "$departureTime - $arrivalTime",
                style: const TextStyle(fontSize: 14),
              ),
              Text(
                duration,
                style: const TextStyle(fontSize: 14, color: Colors.black54),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: const [
              Icon(Icons.lock, size: 16, color: Colors.grey),
              SizedBox(width: 4),
              Text("7kg"),
              SizedBox(width: 16),
              Icon(Icons.block, size: 16, color: Colors.grey),
              SizedBox(width: 4),
              Text("No Baggage"),
            ],
          ),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerRight,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text("Book"),
            ),
          ),
        ],
      ),
    );
  }
}
