import 'package:coursphere/controller/UserController.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('UserController Tests', () {
    late UserController userController;

    setUp(() {
      userController = UserController();
    });

    test('Create User', () async {
      final response = await userController.createUser(
          'arya', 'arya@gmail.com', 'Arya1234@');
      expect(response['message'], 'User created successfully');
      expect(response['users'][{'username'}], 'arya');
      // Add more assertions based on your expected response structure
    });

    test('Login User', () async {
      final response =
          await userController.loginUser('test@example.com', 'password');
      expect(response['message'], 'Login successful');
      expect(response['user']['email'], 'test@example.com');
      // Add more assertions based on your expected response structure
    });

    test('Get All Users', () async {
      final response = await userController.getAllUsers();
      expect(response.length,
          2); // Assuming you have two users in the mock response
      // Add more assertions based on your expected response structure
    });

    test('Get User by ID', () async {
      final userId =
          '4be02694-60b7-4960-ad5c-db9c8e6f0139'; // Replace with a valid user ID in your mock response
      final response = await userController.getUserById(userId);
      expect(response['user']['id'], userId);
      // Add more assertions based on your expected response structure
    });

    // Add more tests as needed for updateUser and deleteUser methods

    test('Update User', () async {
      final userId =
          '4be02694-60b7-4960-ad5c-db9c8e6f0139'; // Replace with a valid user ID
      final response =
          await userController.updateUser(userId, 'Kevin Naserwan');
      expect(response['message'], 'User updated successfully');
      // Add more assertions based on your expected response structure
    });

    test('Delete User', () async {
      final userId =
          '7398c7c4-636e-4b9d-87fd-013b46e96ebc'; // Replace with a valid user ID
      await userController.deleteUser(userId);
      // If deleteUser does not throw an exception, assume success
    });
  });
}
