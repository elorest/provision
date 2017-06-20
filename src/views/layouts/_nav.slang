- active = context.request.path == "/" ? "active" : ""
a class="nav-item #{active}" href="/" Home
- active = context.request.path == "/posts" ? "active" : ""
a class="nav-item #{active}" href="/posts" Posts
- active = context.request.path == "/cats" ? "active" : ""
a class="nav-item #{active}" href="/cats" Cats
- active = context.request.path == "/birds" ? "active" : ""
a class="nav-item #{active}" href="/birds" Birds
