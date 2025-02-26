---
layout: default
title: Blog
---

<div class="auto">

# Posts

{% for post in site.posts %}
— [{{ post.title }}]({{ post.url }})
{% endfor %}

</div>
