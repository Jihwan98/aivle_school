from django.urls import path
from . import views

app_name = 'blog'
urlpatterns = [
    path("", views.index, name="list"),
    path('<int:id>/', views.detail, name="detail"),
    path('create/', views.create, name="create"),
    path('create/form/', views.create_form, name="create_form"),
    path('create/form2/', views.create_form2, name="create_form2"),
]