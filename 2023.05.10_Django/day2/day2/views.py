from django.http import HttpResponse
from django.shortcuts import render

def index(req):
    data = {
        'title' : 'Django',
        'content' : '<a href="https://www.djangoproject.com/">Django</a> is ...'
    }
    return render(req, 'index.html', data)

def chapter(req, id):
    chapters = {
        '01' : {"title" : "Setting & Deploy", "content" : "Setting & Deploy is ..."},
        '02' : {"title" : "Routing & View", "content" : "Routing & View is ..."}
    }    
    return render(req, 'index.html', chapters.get(id))

def control(req):
    data = {
        'variable' : True,
        'another_variable' : True,
        'item_list' : ['사과', '딸기', '메론'],
        'item_dict' : {'고양이' : 4, '강아지' : 4, '닭' : 2}
    }
    return render(req, 'control.html', data)

def child(req):
    return render(req, 'child.html')