build-lists:true

<br>
#[fit] ObjC -> Swift with *pop*!
<br>
#### Nikita Lutsenko
#### @nlutsenko
#### github.com/nlutsenko
#### Facebook, Parse

---

# Agenda

- pop.framework
- Using *pop.framework* in Swift
- Making *pop.framework* better in Swift

---

# pop.framework

![right](Resources/pop.png)

- Extensible Animation Engine
- Dynamic over static animations
- Bouncy, springy and curvy
- Written in ObjC++
- Built for iOS/OS X/tvOS
- Open-source

---

# pop Animations

![inline 200%](https://scontent-sea1-1.xx.fbcdn.net/hphotos-xfp1/t39.2365-6/851540_437493753062351_904305076_n.png)

---

# *Demo* 😁

---

# ObjC -> Swift

- Nullability Annotations
- ObjC Generics for Object Collections
- Swift Native Wrapper
- Swift Extension
- Disabling ObjC APIs in Swift

---

# Nullability Annotations

- `NS_ASSUME_NONNULL_BEGIN`/`NS_ASSUME_NONNULL_END`
- Add `nullable` to APIs that could accept/return `nil`
- ???
- Profit
- `CLANG_WARN_NULLABLE_TO_NONNULL_CONVERSION`
*http://modocache.io/clang-warn-nullable-to-nonnull-conversion*

---

# ObjC Lightweight Generics

- Class-level generics only
- Support covariance/contravariance
- Exported into Swift only for `NSDictionary`/`NSArray`/`NSSet`/etc
- Add additional typesafety and are generally very useful

---

# Disabling ObjC APIs in Swift

- `NS_REFINED_FOR_SWIFT`
Prefix methods with double underscore, so they could be used, but are discouraged.
- `NS_SWIFT_NAME`
Only applicable to factory methods, enumeration cases, option set values.
- `NS_SWIFT_UNAVAILABLE`
Removes method/property from Swift interface entirely.

---

## Thank you!

---

<br>
<br>
<br>
# Questions?
<br>
#### @nlutsenko
#### github.com/nlutsenko