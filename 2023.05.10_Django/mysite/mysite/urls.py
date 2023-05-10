from django.urls import path
from . import views

urlpatterns = [
    path( '', views.index),
    path( 'chapter/<id>/' , views.chapter),
    path('search/', views.search)
]