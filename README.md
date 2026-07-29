# 📔 Journal

A personal journal app built with **SwiftUI**, focused on a native iOS experience — fluid tab navigation, note editing, and real-time search.

> ⚠️ **Status:** UI prototype. The current focus is **navigation and content**; data persistence and some heavier features (real sorting/grouping, saving edits) are not yet implemented.

---

## ✨ Features

- **Tab-based navigation** with `TabView` and independent navigation stacks per tab.
- **Segmented journal** (Your Journal / Shared / Favorites) using a native `Picker` in *palette* style (pill).
- **"See all" deep-link**: from the home screen, opens the Journal tab already positioned on the correct category.
- **Sort & group menu** with native `Picker` + `Section` (automatic checkmark and dividers).
- **Real-time search** with `.searchable`, filtering by title and content of the records.
- **Note editor**: create and edit records Notes-style (no "Edit" button — fields are live).
- **Smooth animations** when switching segments and in the records list.

---

## 🏗️ Architecture

The project follows an **MVVM** approach with a **centralized Router** to orchestrate navigation.

### Router

Single source of navigation intent (`@Observable`). Holds the selected tab, a `path` per tab, and the deep-link "messages".

```swift
@Observable
final class Router {
    var selectedTab: AppTab = .inicio
    var inicioPath: [Route] = []
    var diarioPath: [Route] = []
    var rotinasPath: [Route] = []
    var showNewEntry: Bool = false
    var pendingDiaryCategory: TypeDiary?   // "see all" message

    func openDiary(_ category: TypeDiary) { ... }
    func popToRoot(_ tab: AppTab) { ... }
    func push(_ route: Route, on tab: AppTab) { ... }
}
```

### "See all" deep-link flow

```
[ListOf] user taps "See all"
   └─► router.openDiary(.shared)        // clears path + stores category + switches tab
          ▼
[Diary]  .onChange consumes pendingDiaryCategory
          └─► viewModel.tab = .shared   // pill slides + list filters
```

Each piece has a single responsibility: `ListOf` decides **what**, the `Router` carries the **intent**, `Diary` **consumes** it, and `DiaryViewModel` **filters**.

---

## 📁 Project structure

```
Journal/
├── Journal.xcodeproj
└── Journal/
    ├── Assets.xcassets
    ├── Components/
    │   ├── Carousel.swift
    │   ├── DiaryMenu.swift          # sort/group menu (Picker + Section)
    │   ├── DiaryPicker.swift        # palette picker (native pill)
    │   ├── ListOf.swift             # records list + "See all" deep-link
    │   ├── RegisterPreview.swift
    │   └── RegisterRow.swift        # single row (extracted to help the type-checker)
    ├── Models/
    │   ├── ColorModel.swift
    │   ├── DateModel.swift
    │   ├── DiaryViewModel.swift     # filter by tab, sorting, grouping
    │   ├── RegisterModel.swift      # Register, RegisterType, mock data
    │   ├── RowContent.swift
    │   └── TypeDiary.swift          # enum for Journal segments
    ├── Navigation/
    │   ├── NavView.swift            # TabView + NavigationStacks + Router
    │   └── Router.swift             # Router, AppTab, Route
    ├── Views/
    │   ├── Diary.swift              # journal screen (list + picker + toolbar)
    │   ├── Home.swift               # home screen
    │   ├── NewRegisterView.swift    # create / edit a record
    │   ├── Routine.swift            # routines screen
    │   └── SearchView.swift         # search with .searchable
    ├── JournalApp.swift             # app entry point
    └── Readme.md
```

---

## 🧱 Core models

```swift
struct Register: Hashable, Identifiable {
    let id: UUID = UUID()
    let title: String
    var subtitle: String? = nil
    var lock: Bool? = false
    var favorite: Bool? = false
}

struct RegisterType: Identifiable {
    let id: UUID = UUID()
    let type: String
    let listOfRegisters: [Register]
}

enum TypeDiary: Hashable, CaseIterable {
    case diary, shared, favorites
}
```

Data is provided by an in-memory mock array (`registerTypes`) in `RegisterModel.swift`.

---

## 🔧 Key components

| Component | File | Description |
|---|---|---|
| `DiaryPicker` | `Components/DiaryPicker.swift` | Journal segments in `.pickerStyle(.palette)` — animated native pill. |
| `DiaryMenu` | `Components/DiaryMenu.swift` | Options menu with `Picker` + `Section` (automatic checkmark + dividers). |
| `ListOf` | `Components/ListOf.swift` | Grouped records list; hosts the "See all" deep-link logic. |
| `RegisterRow` | `Components/RegisterRow.swift` | Single row, extracted to keep the compiler's type-checker happy. |
| `NewRegisterView` | `Views/NewRegisterView.swift` | Note editor for creating and editing records. |
| `SearchView` | `Views/SearchView.swift` | Search with `.searchable` + `ContentUnavailableView.search` for the empty state. |

---

## 🚀 Getting started

1. Clone the repository:
   ```bash
   git clone https://github.com/<your-username>/Journal.git
   ```
2. Open `Journal.xcodeproj` in **Xcode**.
3. Pick a simulator (e.g. iPhone 15) and run with **⌘R**.

### Requirements
- **Xcode 15+**
- **iOS 17+** (uses features like `@Observable`, `ContentUnavailableView`, `.searchable`, `Picker` inside menus)

---

## 📝 License

Personal / study project. Feel free to use it as a reference.

---
