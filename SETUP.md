# Setup & Onboarding — 10x Real Estate

How to get this repo running on a new machine or for a new teammate.

> ⚠️ **Secrets:** No tokens live in this repo. Everyone uses their **own** GitHub
> token. Never commit a token or paste one into shared docs/chat.

---

## 1. Clone

```bash
git clone https://github.com/alexv-grantcardone/10x-real_estate.git
cd 10x-real_estate
```

## 2. Git identity

```bash
git config user.name  "Your Name"
git config user.email "you@grantcardone.com"
```

## 3. GitHub authentication

We authenticate git over HTTPS using a token in an environment variable, read on
demand by a credential helper. Nothing secret is stored in the repo or `.git/config`.

### 3a. Create a **classic** token
1. <https://github.com/settings/tokens/new>
2. Note: `10x-real_estate local dev`, set an expiration.
3. Scope: check **`repo`** (add `workflow` only if you'll touch CI). `repo` is enough to push.
4. Generate and copy it (starts with `ghp_`).

> 💡 **Use a classic `ghp_` token, not a fine-grained `github_pat_` one.** Fine-grained
> tokens have a multi-minute propagation delay on the git push path — the API accepts
> them instantly but `git push` returns `403 denied` until it catches up. Classic
> tokens work immediately. (This cost us real time during initial setup.)

### 3b. Put the token in your shell profile
```bash
# ~/.zshrc (or ~/.bashrc)
export GITHUB_PERSONAL_ACCESS_TOKEN="ghp_your_token_here"
```
Then `source ~/.zshrc` (or open a new terminal).

### 3c. Configure the credential helper (one time)
```bash
git config --global credential.https://github.com.helper ""
git config --global --add credential.https://github.com.helper \
  '!f() { test "$1" = get && echo "username=x-access-token" && echo "password=$GITHUB_PERSONAL_ACCESS_TOKEN"; }; f'
```
The empty first value resets any other helper (e.g. macOS `osxkeychain`) for github.com
so it can't override your token with a stale cached credential.

### 3d. Verify
```bash
# git should resolve your token (password = your ghp_ token):
printf 'protocol=https\nhost=github.com\n' | git credential fill
# token can read the API (200 = good):
curl -s -o /dev/null -w "%{http_code}\n" -H "Authorization: Bearer $GITHUB_PERSONAL_ACCESS_TOKEN" https://api.github.com/user
```
After this, `git add` / `git commit` / `git push` work with no prompts.

---

## 4. Claude Code GitHub plugin (optional)
The official `github` plugin lets Claude manage issues/PRs from chat. It reads the
same `GITHUB_PERSONAL_ACCESS_TOKEN` env var.
- Set the env var (3b), then **restart Claude Code**.
- Verify: `claude mcp list` → `plugin:github:github` shows **✔ Connected**.

---

## 5. Troubleshooting

| Symptom | Cause | Fix |
|---|---|---|
| `git push` → `403 denied`, but API works | Fine-grained token (propagation lag) or stale keychain credential | Use a classic `ghp_` token (3a); ensure helper reset (3c). Clear keychain: `printf 'protocol=https\nhost=github.com\n' \| git credential-osxkeychain erase` |
| `git push` → `403`, API also fails | Token lacks write scope | Classic token needs the `repo` scope |
| Push rejected, `fetch first` | Remote has commits you don't | `git pull --rebase origin main`, then push |
| Plugin `✘ Failed to connect` / HTTP 400 | Env var not set when Claude Code started | Set the env var, restart Claude Code |

---

## 6. Read next
- **`CLAUDE.md`** — how this project works (mission, constraints, conventions, the memory system). Read it before doing any work.
- **`knowledge/`** — the shared, ever-growing brain. Skim it at the start of each session.
