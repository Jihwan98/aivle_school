from django.db import models

# Create your models here.
class Post(models.Model):
    title = models.CharField(max_length=100)
    content = models.TextField()
    created_at = models.DateField(auto_now_add=True)
    published_at = models.DateField(null=True)
    
    def __str__(self):
        return self.title
    