class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Vehicle List')),
      body: ListView.builder(
        itemCount: vehicles.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(vehicles[index].name),
            onTap: () {
              // Navigate to the QR code view screen with the selected vehicle
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ViewQRCodeScreen(vehicle: vehicles[index])),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to the add vehicle screen
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddVehicleScreen()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}