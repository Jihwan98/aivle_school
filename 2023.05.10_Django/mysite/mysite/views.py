from django.http import HttpResponse
from django.views.decorators.csrf import csrf_exempt

html = """<!doctype html>
<html>
    <head>
        <title>Django</title>
        <meta charset="utf-8">
    </head>
    <body>
        <h1><a href="/">Django</a></h1>
        <ol>
            <li><a href="/chapter/01/">Setting & Deploy</a></li>
            <li><a href="/chapter/02/">Routing & View</a></li>
        </ol>
        <h2>{title}</h2>
        <p>{content}</p>
    </body>
</html>
"""

chapters = {
    "01": {"title": "Setting & Deploy" , "content": "Setting & Deploy is ..." },
    "02": {"title": "Routing & View" , "content": "Routing & View is ..." },
}

def index(req):
    d = {
        'title' : 'django',
        'content' : 'django is ...'
    }
    return HttpResponse(html.format(**d))

def chapter(req, id):
    return HttpResponse(html.format(**chapters.get(id)))

@csrf_exempt
def search(request):
    print(request.method)
    print(f"Query String: {request.GET.get( 'q')}")
    print(f"BODY: {request.POST.get( 'key', '')}")
    return HttpResponse( f'search' )