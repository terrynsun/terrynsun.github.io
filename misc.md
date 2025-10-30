---
layout: default
title: Blog
---

<div class="auto">

# Posts

I hope to have a crossword blog some day, but in the meantime, I just have a
series of notes I've written to myself over the years, mostly documenting my
computer setup.

{% for post in site.posts %}
— [{{ post.title }}]({{ post.url }})
{% endfor %}

</div>
