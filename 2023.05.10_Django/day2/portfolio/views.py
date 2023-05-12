from django.shortcuts import render

def post_list(req):
    posts = [
        {'id': 1, 'title': 'html', 'content': 'html is ...'},
        {'id': 2, 'title': 'css', 'content': 'css is ...'},
        {'id': 3, 'title': 'javascript', 'content': 'javascript is ...'},
        {'id': 4, 'title': 'python', 'content': 'python is ...'},
    ]
    return render(req, 'list.html', {'post_list': posts})

def post_detail(req, num):
    num = int(num)
    posts = {1 : {'title': 'html', 'content': 'html is ...'},
        2 : {'title': 'css', 'content': 'css is ...'},
        3 : {'title': 'javascript', 'content': 'javascript is ...'},
        4 : {'title': 'python', 'content': 'python is ...'},
    }
    return render(req, 'child_post.html', 
                  {'post_title' : posts.get(num).get('title'),
                   'post_content' : posts.get(num).get('content')})
