
from django.contrib import admin
from django.urls import path, include
from . import views

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', views.index),
    path('chapter/<id>/' , views.chapter),
    path('control/', views.control),
    path('child/', views.child),
    path('blog/', include('blog.urls')),
    path('portfolio/', include('portfolio.urls'))
]