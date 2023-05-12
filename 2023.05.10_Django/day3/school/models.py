from django.db import models
from django.contrib.auth.models import User

# Create your models here.
class Student(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    name = models.CharField(max_length=50)
    year = models.IntegerField()
    def __str__(self):
        return f"{self.name}, {self.year}"

class Book(models.Model):
    title = models.CharField(max_length=100)
    content = models.TextField()
    def __str__(self):
        return self.title

class Course(models.Model):
    title = models.CharField(max_length=100)
    students = models.ManyToManyField(Student)
    book = models.ForeignKey(Book, on_delete=models.CASCADE)
    def __str__(self):
        return self.title
    