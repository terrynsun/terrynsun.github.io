---
layout: default
title: Blog
---

<div class="auto">

# Posts

I hope to have a crossword blog some day, but in the meantime, I just have some
notes about my computer setup.

{% for post in site.posts %}
– [{{ post.title }}]({{ post.url }})
{% endfor %}

</div>
