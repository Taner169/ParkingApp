import 'package:assignment_1/models/person.dart';
import 'package:assignment_1/models/vehicle.dart';
import 'package:assignment_1/models/parking_space.dart';
import 'package:assignment_1/models/parking.dart';
import 'package:assignment_1/repositories/person_repository.dart';
import 'package:assignment_1/repositories/vehicle_repository.dart';
import 'package:assignment_1/repositories/parking_space_repository.dart';
import 'package:assignment_1/repositories/parking_repository.dart';

import 'dart:io';

void main() {
  var persons = PersonRepository();
  var vehicles = VehicleRepository();
  var parkingSpaces = ParkingSpaceRepository();
  var parkings = ParkingRepository();

  while (true) {
    print("\n🚗 Välkommen till Parkeringsappen! 🚗");
    print("1. Hantera personer");
    print("2. Hantera fordon");
    print("3. Hantera parkeringsplatser");
    print("4. Hantera parkeringar");
    print("5. Avsluta");
    stdout.write("Välj ett alternativ (1-5): ");

    String? choice = stdin.readLineSync();

    if (choice == "1") {
      managePersons(persons);
    } else if (choice == "2") {
      manageVehicles(vehicles, persons);
    } else if (choice == "3") {
      manageParkingSpaces(parkingSpaces);
    } else if (choice == "4") {
      manageParking(parkings, vehicles, parkingSpaces);
    } else if (choice == "5") {
      print("👋 Avslutar programmet...");
      break;
    } else {
      print("⚠️ Ogiltigt val, försök igen.");
    }
  }
}

void managePersons(PersonRepository persons) {
  print("\n1. Lägg till person");
  print("2. Visa alla personer");
  stdout.write("Välj: ");
  String? choice = stdin.readLineSync();

  if (choice == "1") {
    stdout.write("Ange namn: ");
    String? name = stdin.readLineSync();
    stdout.write("Ange personnummer: ");
    String? personalNumber = stdin.readLineSync();
    if (name != null && personalNumber != null) {
      persons.add(Person(name, personalNumber));
      print("✅ Person tillagd!");
    }
  } else if (choice == "2") {
    persons.getAll().forEach(print);
  }
}

void manageVehicles(VehicleRepository vehicles, PersonRepository persons) {
  print("\n1. Lägg till fordon");
  print("2. Visa alla fordon");
  print("3. Sök fordon per ägare");
  stdout.write("Välj: ");
  String? choice = stdin.readLineSync();

  if (choice == "1") {
    stdout.write("Ange registreringsnummer: ");
    String? regNum = stdin.readLineSync();
    stdout.write("Ange typ (bil, mc, etc.): ");
    String? type = stdin.readLineSync();
    stdout.write("Ange personnummer på ägaren: ");
    String? ownerId = stdin.readLineSync();

    var owner = persons.getAll().firstWhere((p) => p.personalNumber == ownerId,
        orElse: () => Person("Okänd", "0000"));
    if (regNum != null && type != null) {
      vehicles.add(Vehicle(regNum, type, owner));
      print("✅ Fordon tillagt!");
    }
  } else if (choice == "2") {
    vehicles.getAll().forEach(print);
  } else if (choice == "3") {
    findVehiclesByOwner(vehicles);
  }
}

void findVehiclesByOwner(VehicleRepository vehicles) {
  stdout.write("Ange personnummer på ägaren: ");
  String? ownerId = stdin.readLineSync();

  List<Vehicle> ownerVehicles = vehicles.findByOwner(ownerId!);

  if (ownerVehicles.isEmpty) {
    print("🚫 Ingen fordon hittades för den personen.");
  } else {
    ownerVehicles.forEach(print);
  }
}

void manageParkingSpaces(ParkingSpaceRepository parkingSpaces) {
  print("\n1. Lägg till parkeringsplats");
  print("2. Visa alla parkeringsplatser");
  stdout.write("Välj: ");
  String? choice = stdin.readLineSync();

  if (choice == "1") {
    stdout.write("Ange ID: ");
    int id = int.parse(stdin.readLineSync()!);
    stdout.write("Ange adress: ");
    String? address = stdin.readLineSync();
    stdout.write("Ange pris per timme: ");
    double price = double.parse(stdin.readLineSync()!);

    if (address != null) {
      parkingSpaces.add(ParkingSpace(id, address, price));
      print("✅ Parkeringsplats tillagd!");
    }
  } else if (choice == "2") {
    parkingSpaces.getAll().forEach(print);
  }
}

void manageParking(ParkingRepository parkings, VehicleRepository vehicles,
    ParkingSpaceRepository spaces) {
  print("\n1. Starta ny parkering");
  print("2. Avsluta parkering");
  print("3. Visa alla parkeringar");
  stdout.write("Välj: ");
  String? choice = stdin.readLineSync();

  if (choice == "1") {
    stdout.write("Ange fordonets registreringsnummer: ");
    String? regNum = stdin.readLineSync();
    stdout.write("Ange parkeringsplatsens ID: ");
    int spaceId = int.parse(stdin.readLineSync()!);

    var vehicle = vehicles.getAll().firstWhere(
        (v) => v.registrationNumber == regNum,
        orElse: () => Vehicle("???", "???", Person("Okänd", "0000")));
    var space = spaces.getAll().firstWhere((s) => s.id == spaceId,
        orElse: () => ParkingSpace(0, "???", 0));

    parkings.add(Parking(vehicle, space, DateTime.now()));
    print("✅ Parkering startad!");
  } else if (choice == "2") {
    endParking(parkings);
  } else if (choice == "3") {
    parkings.getAll().forEach(print);
  }
}

void endParking(ParkingRepository parkings) {
  stdout.write("Ange registreringsnummer: ");
  String? regNum = stdin.readLineSync();

  for (var parking in parkings.getAll()) {
    if (parking.vehicle.registrationNumber == regNum &&
        parking.endTime == null) {
      parking.endTime = DateTime.now();
      print("✅ Parkering avslutad!");
      return;
    }
  }

  print("⚠️ Ingen aktiv parkering hittades för fordonet.");
}
