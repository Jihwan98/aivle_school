from django.http import HttpResponse

def index(req):
    return HttpResponse("Hello")

def list(req):
    return HttpResponse("List")

def post(req, id):    
    return HttpResponse(f"Post {id}")

def gugu(req, num):
    num = int(num)
    gugudan = [f'{num} x {i} = {num * i}' for i in range(1, 10)]
    return HttpResponse('<br>'.join(gugudan))

def naver(req):
    import requests
    res = requests.get('https://www.naver.com')
    return HttpResponse(res.content)