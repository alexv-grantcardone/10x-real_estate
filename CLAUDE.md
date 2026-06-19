# relt_funnel — Project & Setup Guide

A marketing funnel project. This document records how the repository was set up,
how GitHub authentication works, and how a new teammate gets up and running.

> ⚠️ **Secrets:** No tokens are stored in this file or in the repo. Every person
> uses their **own** GitHub token. Never commit a token or paste one into shared docs/chat.

---

## 1. Project status

- **Repo:** `https://github.com/alexv-grantcardone/relt_funnel` (public)
- **Stage:** Early setup. Repository connected to GitHub and verified with test pushes. No app code scaffolded yet.
- **Working tree:** `README.md`, `.gitignore`, `notes.txt`, `CLAUDE.md`.
- **Default branch:** `main`

---

## 2. What was done

1. **Installed the GitHub integration** in Claude Code (the official `github` plugin was already enabled; it just needed authentication).
2. **Connected this local folder to the GitHub repo** — `git init`, first commit, `main` branch, `origin` remote, pushed.
3. **Set up seamless git authentication** so `git push` works with no prompts and no token in commands (see §4).
4. **Verified end-to-end** with test commits/pushes; local `HEAD` matches `origin/main`.
5. **Cleaned up** temporary test commits from history.

---

## 3. Getting started (new teammate)

```bash
# 1. Clone
git clone https://github.com/alexv-grantcardone/relt_funnel.git
cd relt_funnel

# 2. Set your git identity (if not already global)
git config user.name  "Your Name"
git config user.email "you@grantcardone.com"

# 3. Set up GitHub auth — see §4
```

---

## 4. GitHub authentication (how it works here)

We authenticate git over HTTPS using a **GitHub token supplied via an environment
variable**, read on demand by a git credential helper. Nothing secret is written
into the repo or `.git/config`.

### 4a. Create your token

Use a **classic** token (recommended — takes effect immediately):

1. Go to <https://github.com/settings/tokens/new>
2. Note: `relt_funnel local dev`, pick an expiration
3. Scope: check **`repo`** (and `workflow` if you'll touch CI). `repo` alone is enough to push.
4. Generate and copy it (starts with `ghp_`).

> 💡 **Avoid fine-grained tokens (`github_pat_…`) for git push.** They have a
> several-minute propagation delay on the git/HTTPS path — the API accepts them
> instantly, but `git push` returns `403 denied` until propagation completes,
> which is confusing. Classic `ghp_` tokens work immediately. (This bit us during
> setup; documented so you don't lose time to it.)

### 4b. Store the token in your shell profile

```bash
# ~/.zshrc  (or ~/.bashrc)
export GITHUB_PERSONAL_ACCESS_TOKEN="ghp_your_token_here"
```

Then `source ~/.zshrc` (or open a new terminal).

### 4c. Configure the credential helper (one time)

This tells git to use the env-var token for github.com, without storing it on disk:

```bash
git config --global credential.https://github.com.helper "" 
git config --global --add credential.https://github.com.helper \
  '!f() { test "$1" = get && echo "username=x-access-token" && echo "password=$GITHUB_PERSONAL_ACCESS_TOKEN"; }; f'
```

The empty first value resets any other helper (e.g. macOS `osxkeychain`) for
github.com so it can't override your token with a stale cached credential.

### 4d. Verify

```bash
# Confirm git resolves your token (password should show your ghp_ token):
printf 'protocol=https\nhost=github.com\n' | git credential fill

# Confirm the token can write (HTTP 200 = good):
curl -s -o /dev/null -w "%{http_code}\n" \
  -H "Authorization: Bearer $GITHUB_PERSONAL_ACCESS_TOKEN" \
  https://api.github.com/user
```

After this, normal `git add` / `git commit` / `git push` work with no prompts.

---

## 5. The GitHub plugin in Claude Code (optional, for AI-assisted GitHub work)

The official `github` plugin lets Claude Code manage issues/PRs/repos from chat.
It reads the **same** `GITHUB_PERSONAL_ACCESS_TOKEN` env var.

- After setting the env var (§4b), **restart Claude Code** so the plugin picks it up.
- Verify: run `claude mcp list` and confirm `plugin:github:github` shows **✔ Connected**.

---

## 6. Troubleshooting

| Symptom | Cause | Fix |
|---|---|---|
| `git push` → `403 ... denied` but `curl` to the API works | Using a fine-grained token (propagation lag) **or** a stale credential in the macOS keychain | Use a classic `ghp_` token (§4a); ensure the helper reset is in place (§4c). To clear a stale keychain entry: `printf 'protocol=https\nhost=github.com\n' \| git credential-osxkeychain erase` |
| `git push` → `403` and API also fails | Token lacks write scope | Classic token needs the `repo` scope checked |
| Push rejected, `fetch first` | Remote has commits you don't have | `git pull --rebase origin main` then push |
| GitHub plugin shows `✘ Failed to connect` / HTTP 400 | Env var not set when Claude Code started | Set `GITHUB_PERSONAL_ACCESS_TOKEN`, restart Claude Code |

---

## 7. Conventions

- Branch off `main` for changes; open a PR rather than pushing directly to `main` once the team grows.
- `.gitignore` already excludes `node_modules/`, build output, `.env*` secrets, OS/editor files, and `.vercel/`.
- Never commit secrets. Use `.env.local` (git-ignored) for local secrets.
