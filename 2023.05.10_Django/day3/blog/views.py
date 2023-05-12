from django.shortcuts import render
from django.http import HttpResponse, HttpRequest
from . import models

def post_list(req):
   posts = models.Post.objects.all()
   return render(req, 'index.html', { 'post_list': posts })

def post_detail(req, id):
    posts = models.Post.objects.all()
    post = models.Post.objects.get(id=id)
    return render(req, 'detail.html', {
        'post_list' : posts,
        'post' : post
    })
def post_detail(req: HttpRequest, id: int) -> HttpResponse:
   post = models.Post.objects.get(id=id)
   return render(req, 'detail.html', { 'post': post })
