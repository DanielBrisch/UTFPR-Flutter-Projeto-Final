import 'package:dio/dio.dart';
import 'package:projeto_final/data/models/task.dart';
import 'package:retrofit/retrofit.dart';

part 'task_service.g.dart';

@RestApi(baseUrl: "https://api-do-back-para-ser-implementada")
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET("/todos")
  Future<List<Task>> getTasks();

  @POST("/todos")
  Future<Task> createTask(@Body() Task task);

  @PUT("/todos/{id}")
  Future<Task> updateTask(@Path("id") int id, @Body() Task task);

  @DELETE("/todos/{id}")
  Future<void> deleteTask(@Path("id") int id);
}
