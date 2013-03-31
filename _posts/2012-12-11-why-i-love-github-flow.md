---
layout: post
category: notes
title: "Why I Love GitHub Flow"
type: "text"
tags: [workflow, git, tools]
---
It's funny to think that one article has entirely changed how I want to work moving forward, but Scott Chacon's [GitHub Flow](http://scottchacon.com/2011/08/31/github-flow.html) has done just that.

A co-worker, [Todd Larsen](http://toddjlarsen.com/), suggested that our team consider it when we formed earlier this fall. Luckily for us, we made the right decision.

The main precepts are deceptively simple *(my steps slightly differ from Scott's, but the idea is the same)*:

1. Our `master` branch in Git is always deployable.
2. Whenever we begin new work, we create a branch (use a very specific name `animate-gift-finder-on-init` for example) that tracks `master`.
3. We push up this branch to GitHub, and [turn it into a Pull Request](https://help.github.com/articles/creating-a-pull-request).
4. We push updates to this branch early and often getting code critiques as we go. (GitHub's interface for this is amazing — we can [make comments in the code](https://github.com/blog/785-pull-request-diff-comments)). When it's ready to be merged into `master`, we simply ask others to give it a final review, and share their thoughts in the comments.
5. Once people have reviewed and signed off on the feature, it can be merged into `master` right through [GitHub's interface](https://help.github.com/articles/merging-a-pull-request).

It seems almost obvious; a logical progression of the tools a lot of us use everyday. It has had a profound impact in the way we feel about our work and the way we work together. Here are three benefits I've noticed:

1. **It improved communication.** Because we post code early in the process, the team can literally see how others think through problems. If you like what you see, tell them specifically (ie: "Great use of variables here!"). When you see something that can be improved, share that too (ie: "Let's refactor this section, and make it a module to be used everywhere.").
2. **It improved communication, part 2.** Despite our development staff living in two different cities with time zone differences, we were never kept out of the loop. This is largely because all of our communication was had out in the open — in the code — via Pull Requests.
3. **Overall developer happiness.** For the first time in my professional life, I felt like the code my teammates and I were producing was a joint effort, and I was able to see how every line was assembled along the way.

I'm sure there are situations where this breaks down or doesn't work for everyone, but it's helped change the way that I think about going to work in the morning. I encourage everyone to look into how it might benefit your workflow.