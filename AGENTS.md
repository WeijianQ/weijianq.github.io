# Repository Guidelines

## Project Structure & Module Organization
- Site content: `_pages/` (static pages), `_posts/` (blog posts, `YYYY-MM-DD-title.md`), `_news/` (announcements), `_bibliography/` (BibTeX), `assets/` (css, js, img, pdf).
- Templating: `_layouts/` (page/post layouts), `_includes/` (partials), `_sass/` (SCSS partials), `_data/` (YAML/JSON data), `_plugins/` (Jekyll Ruby plugins).
- Config: `_config.yml` (prod) and `_config.dev.yml` (local overrides). Built site outputs to `_site/`.

## Build, Test, and Development Commands
- Local serve (recommended): `./bin/serve` — installs gems and runs `jekyll serve` with livereload at `http://127.0.0.1:4000`.
- Plain build: `bundle exec jekyll build` — generates the site into `_site/`.
- Docker dev: `docker-compose up --build` — runs Jekyll with livereload inside Docker.
- CI-style build: `./bin/cibuild` — shorthand for `jekyll build` used for sanity checks.

## Coding Style & Naming Conventions
- Indentation: 2 spaces for Markdown, Liquid, YAML, and SCSS. No tabs.
- Filenames: lowercase, hyphen-separated (e.g., `_pages/about.md`, `_posts/2025-09-07-hello-world.md`).
- Front matter: always include `layout`, `title`, and optional `permalink`. Example:
  ```yaml
  ---
  layout: post
  title: "Hello World"
  categories: [general]
  ---
  ```
- Liquid: prefer filters/pipes over inline logic; keep templates small and use `_includes/` for reuse.

## Testing Guidelines
- Build must succeed without warnings: run `./bin/cibuild` locally before PRs.
- Manual checks: verify key pages render, navigation works, and assets resolve under `http://127.0.0.1:4000`.
- Optional link/HTML checks can be added via html-proofer; none are enforced in this repo today.

## Commit & Pull Request Guidelines
- Commits: imperative mood and scoped (e.g., `layout: fix header meta`, `post: add 2025-09-07 entry`).
- PRs: include summary, screenshots/GIFs for visual changes, and link issues. Note build commands used for local verification.
- Do not commit `_site/` output or local caches; rely on the build.

## Security & Configuration Tips
- Do not commit secrets; keep keys out of `_config.yml` and content.
- Use `_config.dev.yml` for local-only settings. Review plugin changes in `Gemfile` before adding new dependencies.
