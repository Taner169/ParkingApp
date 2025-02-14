# 🚗 Parkeringsappen - En CLI-baserad Parkeringshanterare i Dart

Detta är en **kommandoradsbaserad applikation** byggd i **Dart**, som hanterar personer, fordon, parkeringsplatser och parkeringar. Applikationen lagrar all data i minnet och ger användaren möjlighet att lägga till, visa, uppdatera och ta bort poster.

---

## 📌 Funktioner
✅ **Hantera personer** (Lägg till, visa alla)  
✅ **Hantera fordon** (Lägg till, visa alla, söka per ägare)  
✅ **Hantera parkeringsplatser** (Lägg till, visa alla)  
✅ **Hantera parkeringar** (Starta, avsluta, visa alla)  
✅ **Beräknar parkeringskostnad** baserat på tid och pris per timme  
✅ **Felhantering** för ogiltiga inmatningar  

---

## 📚 Mappstruktur
```
assignment_1/
│── bin/
│   ├── assignment_1.dart  <-- Huvudfilen (CLI)
│── lib/
│   ├── models/
│   │   ├── parking_space.dart  <-- Parkeringsplatsmodell
│   │   ├── parking.dart  <-- Parkeringar
│   │   ├── person.dart  <-- Personmodell
│   │   ├── vehicle.dart  <-- Fordonmodell
│   ├── repositories/
│   │   ├── parking_repository.dart  <-- Hanterar parkeringar
│   │   ├── parking_space_repository.dart  <-- Hanterar parkeringsplatser
│   │   ├── person_repository.dart  <-- Hanterar personer
│   │   ├── vehicle_repository.dart  <-- Hanterar fordon
│── test/
│   ├── assignment_1_test.dart  <-- Tester
│── pubspec.yaml
│── README.md  <-- Dokumentation
```

---

## 🚀 Installation och körning

### 1️⃣ **Klona repo från GitHub**
```sh
git clone https://github.com/ditt-anvandarnamn/assignment_1.git
cd assignment_1
```

### 2️⃣ **Installera beroenden**
```sh
dart pub get
```

### 3️⃣ **Kör programmet**
```sh
dart run bin/assignment_1.dart
```

---

## 🖥️ Exempel på användning

```sh
🚗 Välkommen till Parkeringsappen! 🚗
1. Hantera personer
2. Hantera fordon
3. Hantera parkeringsplatser
4. Hantera parkeringar
5. Avsluta
Välj ett alternativ (1-5): 1

1. Lägg till person
2. Visa alla personer
Välj: 1

Ange namn: Johan Svensson
Ange personnummer: 890101-1234
✅ Person tillagd!
```

---

## 🛠️ Verktyg & Tekniker
- **Dart** (Programmeringsspråk)
- **Kommandoradsgränssnitt (CLI)**
- **Dart-paketstyrning (`pubspec.yaml`)**
- **Objektorienterad programmering (OOP)**
- **Listor & Repositories för datahantering**

---

## 👨‍💻 Att göra & framtida förbättringar
🔲 Spara data i en **databas eller JSON-fil**  
🔲 Implementera **sökfunktion för parkeringar**  
🔲 Bygga ett **Webb- eller mobilgränssnitt** med **Flutter**  
🔲 Lägga till **enhetstester**  

---

## 📚 Licens
MIT License - Använd fritt och förbättra koden!

---

## 💡 Kontakt & Feedback
Om du har frågor eller vill bidra, skicka en pull request eller kontakta mig! 😊  

🚀 **Byggd med ❤️ i Dart!**
