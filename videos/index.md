---
layout: page
title: Videos
has_children: true
---

# YouTube Channels

* [Numberphile - Videos about numbers](https://www.youtube.com/user/numberphile)

# Interesting videos

{% for page in site.pages %}
{% if page.layout == "video" %} <a href="{{page.url}}">{{page.title}}</a>
{% endif %}
{% endfor %}
