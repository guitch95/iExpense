# 💸 iExpense

Application iOS de suivi des dépenses personnelles et professionnelles, développée avec SwiftUI.

![Swift](https://img.shields.io/badge/Swift-6.0-orange)
![iOS](https://img.shields.io/badge/iOS-17.0+-blue)
![SwiftUI](https://img.shields.io/badge/SwiftUI-5.0-green)

## 📱 Aperçu

<div align="center">
  <img src="assets/iExpense-demo.gif" alt="iExpense Demo" width="300"/>
  <p><em>Ajout et gestion des dépenses</em></p>
</div>

## ✨ Fonctionnalités

- 💵 Ajout de dépenses avec nom, type et montant
- 🏷️ Catégorisation (Personal / Business)
- 🗑️ Suppression par swipe
- 💾 Persistance automatique des données
- 💲 Format monétaire USD

## 🛠️ Technologies utilisées

| Technologie | Utilisation |
|-------------|-------------|
| Swift 6 | Langage de programmation |
| SwiftUI | Framework UI déclaratif |
| UserDefaults | Persistance locale |
| JSONEncoder/Decoder | Sérialisation des données |

## 🏗️ Architecture

```
iExpense/
├── ContentView.swift      # Vue principale avec liste des dépenses
├── AddView.swift          # Sheet pour ajouter une dépense
├── Expenses.swift         # Class @Observable - gestion d'état
└── ExpenseItem.swift      # Struct modèle de données
```

### Pattern Struct + Class

```
┌─────────────────────────────────────────────────────┐
│  ExpenseItem (Struct)                               │
│  → Définit la structure des données                 │
│  → Identifiable + Codable                           │
└─────────────────────────────────────────────────────┘
                        │
                        ▼
┌─────────────────────────────────────────────────────┐
│  Expenses (Class @Observable)                       │
│  → Contient [ExpenseItem]                           │
│  → Gère la persistance (didSet → UserDefaults)      │
│  → Charge les données à l'init                      │
└─────────────────────────────────────────────────────┘
                        │
                        ▼
┌─────────────────────────────────────────────────────┐
│  Vues (ContentView, AddView)                        │
│  → Partagent la même instance Expenses              │
│  → Modifications reflétées partout                  │
└─────────────────────────────────────────────────────┘
```

## 📚 Concepts SwiftUI appliqués

| Concept | Utilisation |
|---------|-------------|
| `@Observable` | Class Expenses pour partager l'état entre vues |
| `@State` | États locaux dans les vues |
| `@Environment(\.dismiss)` | Fermer la sheet après sauvegarde |
| `NavigationStack` | Navigation et toolbar |
| `.sheet` + `.presentationDetents` | Modal demi-hauteur pour ajout |
| `Identifiable` | Protocole pour ForEach sans id: |
| `Codable` | Encodage/décodage JSON pour persistance |

## 💾 Persistance

Les dépenses sont sauvegardées automatiquement dans UserDefaults :

```swift
// Sauvegarde automatique (didSet)
var items = [ExpenseItem]() {
    didSet {
        let encoded = try? JSONEncoder().encode(items)
        UserDefaults.standard.set(encoded, forKey: "Items")
    }
}

// Chargement à l'initialisation
init() {
    if let data = UserDefaults.standard.data(forKey: "Items"),
       let decoded = try? JSONDecoder().decode([ExpenseItem].self, from: data) {
        items = decoded
    }
}
```

## 🚀 Installation

```bash
git clone https://github.com/votre-username/iExpense.git
cd iExpense
open iExpense.xcodeproj
```

## 📈 Améliorations possibles

- [ ] Filtrer par type (Personal / Business)
- [ ] Icônes selon le type de dépense
- [ ] Style conditionnel selon le montant (vert/orange/rouge)
- [ ] Support multi-devises avec Locale
- [ ] Migration vers SwiftData
- [ ] Graphiques de suivi des dépenses

## 👤 Auteur

**Guillaume Richard**

## 📚 Ressources

- [100 Days of SwiftUI - Project 7](https://www.hackingwithswift.com/100/swiftui)

---

**⭐ Si ce projet vous a été utile, n'hésitez pas à lui donner une étoile !**
