# Module 04 -- State Management & Reactivity (Decorator Supplement)

> **Status**: Synthesized from cross-references, code examples, and error-code documentation in the local harmonyos-references tree (V207/V217). No standalone API reference pages exist for these decorators locally -- the full canonical docs live on `developer.huawei.com` (guide pages linked below). This file compiles what the local knowledge base does contain.

---

## Decorator Table

| Decorator | Import Path | Signature (inferred from usage) | Key Rules | Cross-Reference |
|-----------|-------------|--------------------------------|-----------|-----------------|
| `@State` | Built-in (none) | `@State variable: Type = initialValue` | -- Must be initialized (error 10905303)<br>-- One state decorator per variable (error 10905302)<br>-- Must specify a type (error 10905305)<br>-- Pairs with `@Watch` callback | [arkts-state](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkts-state) |
| `@Prop` | Built-in (none) | `@Prop variable: Type = initialValue` | -- One-way parent-to-child binding<br>-- Child receives a copy; parent mutation propagates | [arkts-prop](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkts-prop) |
| `@Link` | Built-in (none) | `@Link variable: Type` (no initializer) | -- Two-way parent-child binding<br>-- MUST NOT be initialized (error 10905304)<br>-- Parent passes `this.variable` | [arkts-link](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkts-link) |
| `@ObjectLink` | Built-in (none) | `@ObjectLink variable: ClassType` (no initializer) | -- Observes nested `@Observed` objects<br>-- MUST NOT be initialized (error 10905304)<br>-- Can be initialized with `UIUtils.makeV1Observed()` | [arkts-observed-and-objectlink](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkts-observed-and-objectlink) |
| `@Observed` | Built-in (none) | `@Observed class ClassName { ... }` | -- Class-level decorator (V1)<br>-- Makes all properties observable<br>-- Equivalent to `UIUtils.makeV1Observed()` at runtime | [arkts-observed-and-objectlink](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkts-observed-and-objectlink) |
| `@Builder` | Built-in (none) | `@Builder [function] name(args) { ... }` | -- Builds UI from a function (custom component or global)<br>-- Parameters are read-only by default<br>-- Use `MutableBinding<T>` from `@kit.ArkUI` for writable params (error 140109)<br>-- `Binding<T>` provides read-only `.value`; `MutableBinding<T>` provides read-write `.value` | [arkts-builder](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkts-builder) |
| `@BuilderParam` | Built-in (none) | `@BuilderParam builder: () => void` | -- Can ONLY be initialized by `@Builder` or `@LocalBuilder` decorated functions (error 10905101)<br>-- Enables slot/child-content pattern in custom components | [arkts-buildercustom-param](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkts-buildercustom-param) |
| `@StorageLink` | Built-in (none) | `@StorageLink('key') variable: Type = initialValue` | -- Two-way link to an AppStorage property<br>-- Must be initialized (error 10905303)<br>-- Registered as a subscriber; `AppStorage.delete()` fails until subscriber is removed | [arkts-appstorage#storagelink](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkts-appstorage#storagelink) |
| `@StorageProp` | Built-in (none) | `@StorageProp('key') variable: Type = initialValue` | -- One-way sync from AppStorage to component<br>-- Must be initialized (error 10905303)<br>-- Same subscriber semantics as `@StorageLink` | [arkts-appstorage#storageprop](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkts-appstorage#storageprop) |

---

## Detailed Notes from Local Docs

### `@State`

- **Error 10905303** (compile error): `@State` variables MUST specify a default value (`@State x: number = 0`). This also applies to `@StorageLink`, `@StorageProp`, `@LocalStorageLink`, `@LocalStorageProp`, and `@Provide`.
- **Error 10905302** (compile error): A variable cannot carry multiple state management decorators (e.g., cannot combine `@State` with `@Prop`).
- **Error 10905305** (compile error): Decorated variables must specify a type.
- Works in `@Component` (V1) structs only. Pairs naturally with `@Watch('callbackName')` for change callbacks.

### `@Prop`

- Used in **example code** throughout component API docs (SegmentButton, ExceptionPrompt, many system UI components). Always in `@Component` structs.
- Not documented standalone in the local knowledge base -- only shows up as `@Prop someVar: Type` in example snippets.

### `@Link`

- **Error 10905304** (compile error): `@Link` (and `@Consume`, `@ObjectLink`) variables MUST NOT be initialized. The parent provides the value.
- Used in component example files (List, WaterFlow, CustomDialog, etc.) showing parent-to-child two-way binding.
- Not to be confused with the `AppStorage.link()` / `LocalStorage.link()` **API methods**, which are documented in `应用级变量的状态管理.md`. The `@Link` **decorator** is a separate concept (component-to-component binding).

### `@Observed` / `@ObjectLink`

- **`@Observed`** is a class-level decorator: `@Observed class MyClass { ... }`. It makes instances of the class observable by V1 state management.
- `UIUtils.makeV1Observed(source)` has **equivalent capability** to `@Observed` -- it wraps a plain class instance at runtime so it can be used where `@Observed` was required.
- **`@ObjectLink`** consumes an `@Observed` instance or a `makeV1Observed()` return. It provides deep/nested observation of object properties. See the `makeV1Observed` example in StateManagement.md (lines 1005-1048):
  ```ts
  @Component
  struct Child {
    @ObjectLink inner: Inner;   // <-- no initializer
    build() { Text(`${this.inner.interValue}`) }
  }
  ```
- `makeV1Observed` supports: plain classes, `Array`, `Map`, `Set`, `Date`. Does NOT support `collections.*` types, `@Sendable` classes, `undefined`, `null`, or V2 data.

### `@Builder`

- Can be defined **inside** a struct (as a method) or **outside** as a global function.
- Parameters: Use `Binding<T>` (read-only) or `MutableBinding<T>` (read-write) from `@kit.ArkUI`.
- **Error 140109** (runtime error): `@Builder` functions must not modify parameter properties directly. Use `MutableBinding` instead.
- Builder parameters are created via `UIUtils.makeBinding<T>(getter)` for read-only or `UIUtils.makeBinding<T>(getter, setter)` for mutable bindings.

### `@BuilderParam`

- **Error 10905101** (compile error): `@BuilderParam` can ONLY be initialized by a `@Builder` or `@LocalBuilder` decorated function.
- Used to accept builder content (slots) from parent components.

### `@StorageLink` / `@StorageProp`

- Both are built-in V1 decorators that connect component variables to `AppStorage` keys.
- **Subscriber semantics**: When `@StorageLink('propName')` or `@StorageProp('propName')` decorates a variable, it registers as a subscriber on the AppStorage property. `AppStorage.delete('propName')` returns `false` as long as any subscriber exists.
- To delete a property, the subscriber component must be removed first (component lifecycle ends).
- **Error 10905303**: Both MUST have a default value at declaration: `@StorageLink('count') count: number = 0`.

---

## V1 State Management Architecture (Context)

These decorators belong to **V1 state management** (used with `@Component`/`@Entry` decorators). HarmonyOS also has a **V2 state management** system using `@ComponentV2`, `@ObservedV2`, `@Trace`, `@Local`, `@Param`, `@Event`, and `@Computed`.

**V1 decorator family**: `@State`, `@Prop`, `@Link`, `@ObjectLink`, `@Observed`, `@Consume`, `@Provide`, `@StorageLink`, `@StorageProp`, `@LocalStorageLink`, `@LocalStorageProp`, `@Watch`.

Key V1 rules extracted from compile error codes:
- `@State`, `@StorageLink`, `@StorageProp`, `@LocalStorageLink`, `@LocalStorageProp`, `@Provide` -> **must initialize**
- `@Link`, `@ObjectLink`, `@Consume` -> **must NOT initialize** (parent provides)
- All decorated variables -> **must specify type**
- No mixing of decorators on the same variable

---

## Source Files Read

| File | Version |
|------|---------|
| `.../01_ArkTS UI界面/14_ohos.arkui.StateManagement (状态管理).md` | V207 |
| `.../05_错误码/03_UI编译/01_编译错误码.md` | V198 |
| `.../05_错误码/01_UI界面/25_状态管理错误码.md` | V153 |
| `.../02_ArkTS组件/27_状态管理与渲染控制/01_应用级变量的状态管理.md` | V207 |
