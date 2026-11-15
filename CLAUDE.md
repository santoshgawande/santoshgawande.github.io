# santoshgawande.github.io

Santosh's personal site (santoshgawande.com via `CNAME`): a content repo, Jekyll with the minima
theme, published by GitHub Pages. Board project **WS** (tickets titled with the repo name),
branches `<type>/WS-<n>-<slug>`. Owner: **claude**.

- **Verify command: `scripts/verify.sh`** (checks CNAME, config and front matter, then runs the
  Jekyll build if `bundle exec jekyll` works; otherwise it prints SKIP for the build).
- Local preview, once `bundle install` has run: `bundle exec jekyll serve`.
- **`_site/` is tracked in git.** It is generated output, so never hand-edit it, and expect
  rebuilds to touch it. Rebuild instead of editing.
- `CNAME` holds the custom domain. Do not change or remove it without Santosh's say-so; it
  takes the live site down. The open `fix/CE-2-redirect-to-com` branch concerns the redirect.
- `_config.yml` is not reloaded by `jekyll serve`; restart after editing. `description` and
  `url` are still the Jekyll defaults or empty.
- Content only: `_posts/` (posts), `index.markdown`, `about.markdown`. Write real content for
  Santosh, never invent biography details, employers or dates; leave a placeholder.
- No CHANGELOG, no releases (content repo).
- Read on demand: Jekyll docs for the minima theme; `Gemfile` for the pinned versions.
