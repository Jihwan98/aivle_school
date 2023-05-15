from django.urls import path
from django.http import HttpResponse
def cookie_counter(req):
    visits = int(req.COOKIES.get('visits', 0)) + 1
    res = HttpResponse(f"cookie: {visits}")
    res.set_cookie('visits', visits)
    return res

def session_counter(req):
    req.session['count'] = req.session.get('count', 0) + 1
    return HttpResponse(f"session: {req.session['count']}")
urlpatterns = [
    path('cookie/', cookie_counter),
    path('session/', session_counter),
]