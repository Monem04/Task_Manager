class Urls {
  static const String _baseUrl = 'http://35.73.30.144:2005/api/v1';
  static const String registrationUrl = '$_baseUrl/registration';
  static const String loginUrl = '$_baseUrl/login';
  static const String createTasknUrl = '$_baseUrl/createTask';
  static const String taskCountByStatusUrl = '$_baseUrl/taskStatusCount';

  static String taskListByStatusUrl(String status) =>
      '$_baseUrl/listTaskByStatus/$status';
}
// https://task.teamrabbil.com/api/v1