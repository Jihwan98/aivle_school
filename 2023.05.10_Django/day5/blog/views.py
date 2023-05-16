from django.shortcuts import render
from django.http import HttpResponse, JsonResponse, HttpResponseNotFound
from django.forms.models import model_to_dict
from . import models

# Create your views here.
def index(req):
    posts = models.Post.objects.all()
    return HttpResponse(posts)

def api_posts(req):
    if req.method == 'GET':
        posts = models.Post.objects.all()
        return JsonResponse({"results" : list(posts.values())})
    elif req.method == 'POST':
        # Post 생성 로직
        return JsonResponse({"results" : "ok"})
def api_post(req, id):
    try:
        post = models.Post.objects.get(id=id)
    except:
        return HttpResponseNotFound("없는 페이지")
    return JsonResponse({"results" : model_to_dict(post)})