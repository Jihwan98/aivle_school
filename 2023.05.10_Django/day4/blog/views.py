from django.shortcuts import render, redirect
from django.urls import reverse
from django.http import HttpResponseNotFound, Http404
from . import models
from . import forms

# Create your views here.
def index(req):
    posts = models.Post.objects.all()
    return render(req, 'blog/index.html', {'post_list' : posts})

def detail(req, id):
    try:
        post = models.Post.objects.get(id=id)
    except Exception as e:
        return HttpResponseNotFound("그런 글은 없습니다.")
    return render(req, "blog/detail.html", {"post" : post})

def create(req):
    if req.method == 'POST':
        new_post = models.Post(
            title = req.POST.get('title'),
            content = req.POST.get('content')
        )
        new_post.save()
        return redirect(reverse('blog:list'))
    return render(req, 'blog/create.html')

def create_form(req):
    if req.method == 'POST':
        form = forms.PostForm(req.POST)
        if form.is_valid():
            new_post = models.Post(
                title = form.cleaned_data['title'],
                content = form.cleaned_data['content'],
                published_at = form.cleaned_data['published']
            )
            new_post.save()
            return redirect(reverse('blog:list'))
    else:
        form = forms.PostForm()

    return render(req, 'blog/create_form.html', {'form' : form})

def create_form2(req):
    if req.method == 'POST':
        form = forms.PostModelForm(req.POST)
        if form.is_valid():
            form.save()
            return redirect(reverse('blog:list'))
    else:
        form = forms.PostModelForm()

    return render(req, 'blog/create_form.html', {'form' : form})