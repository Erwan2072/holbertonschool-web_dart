## Resources

**Read or watch**:

*   [Asynchronous Programming in Dart](/rltoken/RdTzY_XuZArmMUF2GXvDKw "Asynchronous Programming in Dart")
*   [Asynchronous Programming in Dart and Flutter](/rltoken/Uta_Izm3BIYHA5RuIx7cxg "Asynchronous Programming in Dart and Flutter")

## Requirements

### General

*   A README.md file, at the root of the folder of the project, is mandatory
*   Use the Provided `util.dart` file(no need to push it)

## Tasks

### 1.

Create a function `usersCount()` that prints the number of users.

Function prototype : `Future<void> usersCount()` Gets the user count by calling the provided function `fetchUsersCount()`. which will simulate fetching data from an api.

*   Do not push `0-util.dart`
```
achref@achref:~$ cat 0-main.dart
import '0-users\_count.dart';

main() async {
  await usersCount();
}
achref@achref:~$ cat 0-util.dart

Future<int> fetchUsersCount() => Future.delayed(
      const Duration(seconds: 2),
      () => 19,
    );

achref@achref:~$ dart 0-main.dart
19
achref@achref:~$
```


### 2.

Create a function `getUserID()` that returns a future string representing the user’s ID.

Function prototype : `Future<String> getUserId()`

Gets the user data by calling the provided function `fetchUserData()` which will simulate fetching data from an api.
```
achref@achref:~$ cat 1-main.dart
import '1-get\_user\_id.dart';

main() async {
  print(await getUserId());
}
achref@achref:~$ cat 1-util.dart
Future<String> fetchUserData() => Future.delayed(
      const Duration(seconds: 2),
      () =>
          '{"id" : "7ee9a243-01ca-47c9-aa14-0149789764c3", "username" : "admin"}',
    );

achref@achref:~$ dart 1-main.dart
7ee9a243-01ca-47c9-aa14-0149789764c3
achref@achref:~$
```


### 3.

Sometimes fetching data from an api could produce unwanted results and may cause errors therefore it’s wise to handle these errors before they become a problem.

Create a function `getUser()` that prints the user’s string representation.

Function prototype : `Future<void> getUser()`

Gets the user data by calling the provided function `fetchUser()`

Must use : try-catch If an error occurs the function should print “`error caught: <error>` ”
```
achref@achref:~$ cat 2-main.dart
import '2-get\_user.dart';

main() async {
  getUser();
}
achref@achref:~$ cat 2-util.dart
Future<String> fetchUser() =>
    // Imagine that this function is
    // more complex and slow.
    Future.delayed(
      const Duration(seconds: 2),
      () => throw 'Cannot locate user',
    );

achref@achref:~$ dart 2-main.dart
error caught: Cannot locate user
achref@achref:~$
```


### 4.

Create a function `greetUser()` that returns a string as follows `Hello <username>` .

Function prototype : `Future<String> greetUser()`

Gets the user data by calling the provided function `fetchUserData()`

Must use try-catch If an error occurs the function should return : `error caught: <error>`

Create a function `loginUser()`

Function prototype : `Future<String> loginUser()`

Should call the provided function `checkCredentials()` which returns a `future bool`.

*   If `checkCredentials()` returns `true` `loginUser()` should print `There is a user: true` and call `greetUser()` to return it’s value
*   If `checkCredentials()` returns `false` `loginUser()` should print `There is a user: false` and return `Wrong credentials`

Must use try-catch If an error occurs the function should return `error caught: <error>`
```
achref@achref:~$ cat 3-main.dart
import '3-greet\_user.dart';

main() async {
  print(await loginUser());
}
achref@achref:~$ cat 3-util.dart
Future<String> fetchUserData() => Future.delayed(
      const Duration(seconds: 2),
      () =>
          '{"id" : "7ee9a243-01ca-47c9-aa14-0149789764c3", "username" : "admin"}',
    );

Future<bool> checkCredentials() =>
    Future.delayed(const Duration(seconds: 2), () => true);

achref@achref:~$ dart 3-main.dart
There is a user: true
Hello admin
achref@achref:~$
```


### 5.

Create a function `calculateTotal()` that calculates the total price of items for a certain user.

*   Gets the user data by calling the provided function`fetchUserData()`
*   Gets the user orders by calling the provided function `fetchUserOrders(id)` which accepts one argument : ID of the user
*   Gets the products price by calling the provided function `fetchProductPrice(product)` which accepts one argument : product name
*   Returns the total price of items
*   Must use try-catch
*   If an error occurs the function should return -1
```
achref@achref:~$ cat 4-main.dart
import '4-get\_sum.dart';

main() async {
  print(await calculateTotal());
}

achref@achref:~$ cat 4-util.dart
import 'dart:convert';

Future<String> fetchUserOrders(String id) async {
  var orders = {
    "7ee9a243-01ca-47c9-aa14-0149789764c3": \["pizza", "orange"\]
  };
  try {
    return Future.delayed(
        const Duration(seconds: 2), () => json.encode(orders\[id\]));
  } catch (err) {
    return "error caught : $err";
  }
}

Future<String> fetchUserData() => Future.delayed(
      const Duration(seconds: 2),
      () =>
          '{"id" : "7ee9a243-01ca-47c9-aa14-0149789764c3", "username" : "admin"}',
    );

Future<String> fetchProductPrice(product) async {
  var products = {"pizza": 20.30, "orange": 10, "water": 5, "soda": 8.5};
  try {
    return Future.delayed(
        const Duration(seconds: 2), () => json.encode(products\[product\]));
  } catch (err) {
    return "error caught : $err";
  }
}
achref@achref:~$ dart 4-main.dart
30.3
achref@achref:~$
```


### 6.

Create a file “pubspec.yaml” containing the following lines :
```
name: rick\_and\_morty

dependencies:
  http: ^0.13.3

environment:
  sdk: ">=2.12.0 <3.0.0"
```
Then run : `dart pub get`

Now we can use http to send requests to an online api.

Create a function `printRmCharacters()` that prints all Rick and Morty Characters.

*   You should use [Rick and Morty API](/rltoken/sw4eYN8hy3A4hwV3gOWpRg "Rick and Morty API") to get the data required
*   Must use try-catch
*   If an error occurs the function should return `error caught: <error>`
```
achref@achref:~$ cat pubspec.yaml
name: rick\_and\_morty

dependencies:
  http: ^0.13.3

environment:
  sdk: ">=2.10.0 <3.0.0"

achref@achref:~$
achref@achref:~$ cat 5-main.dart
import 'rick\_and\_morty.dart';

main() async {
  await printRmCharacters();
}
achref@achref:~$
achref@achref:~$ dart 5-main.dart
Rick Sanchez
Morty Smith
Summer Smith
…
Amish Cyborg
Annie
```