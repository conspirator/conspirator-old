---
layout: post
category: notes
title: "Git Chipper"
type: "text"
tags: [workflow, git]
---
On Mondays, after downing a large cup of coffee, I try to ease back into the saddle by getting my environment back into proper working order. I'll get my windows organized the way I like them, run database migrations, pull down my repo updates, and invariably I'll find myself deleting 20+ local branches from the previous iteration. Occasionally there's a branch or two that I'll carry into the next week, but more often than not, I just want to blow away everything.

Up until now, I'd clench my jaw, put my head down and type out `git branch -D` a bunch of times. Don't get me wrong - **this is not difficult**, it's just needlessly repetitive. Inspired by helpful scripts like [git fresh](/notes/2012/11/26/git-fresh.html), I sought a better way to automate the process of branch removal. Now all I have to type is `git chipper`, a calm washes over me, and I can attack the day focused on shipping code.

All you need to do is place this file somewhere in your PATH, and make it executable. Then you can call it from any git repo. The process might look something like this:

{% highlight bash %}
    $ cd ~/bin/
    $ chmod +x git-chipper
    $ cd ~/sites/groupon/
    $ git chipper
{% endhighlight %}

*If there's a smarter way to do this, please don't hesitate to reach out. I'd love to hear how I can make this better.*