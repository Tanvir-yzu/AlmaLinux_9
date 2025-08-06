

<div align="center">

# 🚀 GIT COMMANDS MASTERLIST
### *Complete Reference Guide with Advanced Techniques*

![Git](https://img.shields.io/badge/Git-F05032?style=for-the-badge&logo=git&logoColor=white)
![Version Control](https://img.shields.io/badge/Version%20Control-Expert-brightgreen?style=for-the-badge)
![Documentation](https://img.shields.io/badge/Documentation-Complete-blue?style=for-the-badge)

</div>

---

## 📋 Table of Contents

<details>
<summary>Click to expand navigation</summary>

- [🟦 1. Git Configuration & Setup](#-1-git-configuration--setup)
- [🟨 2. Creating and Cloning Repositories](#-2-creating-and-cloning-repositories)
- [🟩 3. Basic Snapshotting](#-3-basic-snapshotting)
- [🟧 4. Branching and Merging](#-4-branching-and-merging)
- [🟫 5. Viewing History](#-5-viewing-history)
- [🟪 6. Remote Repositories](#-6-remote-repositories)
- [🟥 7. Undoing Changes](#-7-undoing-changes)
- [🟦 8. Stashing (Save Work for Later)](#-8-stashing-save-work-for-later)
- [🟨 9. Tagging](#-9-tagging)
- [🟩 10. Advanced Tools](#-10-advanced-tools)
- [🛠️ 11. Useful Shortcuts](#️-11-useful-shortcuts)
- [⚡ 12. Advanced Git Workflows](#-12-advanced-git-workflows)
- [🔧 13. Git Hooks & Automation](#-13-git-hooks--automation)
- [🔍 14. Debugging & Troubleshooting](#-14-debugging--troubleshooting)
- [🌐 15. Advanced Remote Operations](#-15-advanced-remote-operations)
- [📊 16. Git Statistics & Analysis](#-16-git-statistics--analysis)
- [🔐 17. Security & Signing](#-17-security--signing)
- [📄 18. Useful Aliases](#-18-useful-aliases)
- [💡 19. Pro Tips & Best Practices](#-19-pro-tips--best-practices)

</details>

---

## 🟦 1. Git Configuration & Setup

<details>
<summary>🔧 Basic Configuration</summary>

| Command | Description | Example |
|---------|-------------|---------|
| `git config --global user.name "Your Name"` | Set your Git username globally | `git config --global user.name "John Doe"` |
| `git config --global user.email "you@example.com"` | Set your email globally | `git config --global user.email "john@example.com"` |
| `git config --list` | Show current configuration | - |
| `git config -e` | Edit the global config file | - |
| `git help <command>` | Show help for a Git command | `git help commit` |

</details>

<details>
<summary>⚙️ Advanced Configuration</summary>

| Command | Description |
|---------|-------------|
| `git config --global init.defaultBranch main` | Set default branch name |
| `git config --global core.editor "code --wait"` | Set VS Code as default editor |
| `git config --global merge.tool vimdiff` | Set merge tool |
| `git config --global core.autocrlf true` | Handle line endings (Windows) |
| `git config --global core.autocrlf input` | Handle line endings (Mac/Linux) |
| `git config --global push.default simple` | Set push behavior |
| `git config --global pull.rebase true` | Always rebase on pull |

</details>

---

## 🟨 2. Creating and Cloning Repositories

> **💡 Pro Tip:** Use `--depth 1` for shallow clones to save bandwidth and time

| Command | Description | Use Case |
|---------|-------------|----------|
| `git init` | Initialize a new Git repository | Starting a new project |
| `git init --bare` | Create a bare repository | Setting up a server repo |
| `git clone <url>` | Clone a repository from a URL | Getting existing project |
| `git clone <url> <folder>` | Clone into a specific folder | Custom directory name |
| `git clone --depth 1 <url>` | Shallow clone (latest commit only) | Large repos, CI/CD |
| `git clone --branch <branch> <url>` | Clone specific branch | Working on feature branch |

---

## 🟩 3. Basic Snapshotting

<details>
<summary>📸 Staging & Committing</summary>

| Command | Description | When to Use |
|---------|-------------|-------------|
| `git add <file>` | Stage a file for commit | Specific file changes |
| `git add .` | Stage all changes | All current changes |
| `git add -A` | Stage all changes (including deletions) | Complete staging |
| `git add -p` | Interactive staging (patch mode) | Selective staging |
| `git status` | Show staged, unstaged, untracked files | Check current state |
| `git status -s` | Short status format | Quick overview |
| `git commit -m "message"` | Commit with a message | Standard commit |
| `git commit -a -m "message"` | Stage & commit tracked files | Quick commit |
| `git commit --amend` | Modify last commit | Fix last commit |
| `git commit --amend --no-edit` | Amend without changing message | Add forgotten files |

</details>

<details>
<summary>🔍 Viewing Changes</summary>

| Command | Description |
|---------|-------------|
| `git diff` | Show unstaged changes |
| `git diff --staged` | Show staged changes |
| `git diff HEAD` | Show all changes since last commit |
| `git diff <commit1> <commit2>` | Compare two commits |
| `git diff --name-only` | Show only changed file names |
| `git diff --stat` | Show change statistics |

</details>

---

## 🟧 4. Branching and Merging

<details>
<summary>🌿 Branch Management</summary>

| Command | Description | Best Practice |
|---------|-------------|---------------|
| `git branch` | List branches | Check current branches |
| `git branch -a` | List all branches (including remote) | See complete branch structure |
| `git branch <name>` | Create a new branch | Feature development |
| `git checkout <name>` | Switch to a branch | Legacy command |
| `git switch <name>` | Modern alternative to `checkout` | **Recommended** |
| `git checkout -b <name>` | Create and switch to a branch | Quick branch creation |
| `git switch -c <name>` | Modern create and switch | **Recommended** |
| `git branch -d <name>` | Delete a branch (safe) | Cleanup merged branches |
| `git branch -D <name>` | Force delete a branch | ⚠️ Use with caution |
| `git branch -m <old> <new>` | Rename a branch | Fix naming mistakes |

</details>

<details>
<summary>🔀 Merging Strategies</summary>

| Command | Description | When to Use |
|---------|-------------|-------------|
| `git merge <branch>` | Merge another branch | Standard merge |
| `git merge --no-ff <branch>` | Force merge commit | Preserve branch history |
| `git merge --squash <branch>` | Squash merge | Clean history |
| `git merge --abort` | Abort current merge | Resolve conflicts later |
| `git rebase <branch>` | Reapply commits on top of another base | Linear history |
| `git rebase -i <commit>` | Interactive rebase | Clean up commits |

</details>

---

## 🟫 5. Viewing History

<details>
<summary>📚 Log Commands</summary>

| Command | Description | Output Style |
|---------|-------------|--------------|
| `git log` | View commit history | Full details |
| `git log --oneline` | Condensed one-line format | Quick overview |
| `git log --graph` | ASCII graph of branch history | Visual branching |
| `git log --graph --oneline --all` | Complete visual history | **Recommended** |
| `git log --stat` | Show file change statistics | File-level changes |
| `git log -p` | Show patch (actual changes) | Detailed changes |
| `git log --since="2 weeks ago"` | Commits from specific time | Time-based filtering |
| `git log --author="John"` | Commits by specific author | Author filtering |
| `git log --grep="bug"` | Search commit messages | Message filtering |

</details>

<details>
<summary>🔍 Advanced History</summary>

| Command | Description |
|---------|-------------|
| `git show <commit>` | Show changes in a specific commit |
| `git show --name-only <commit>` | Show only changed files |
| `git log --follow <file>` | Follow file history through renames |
| `git log --all --graph --decorate` | Beautiful branch visualization |
| `git reflog` | Show reference log (recovery tool) |

</details>

---

## 🟪 6. Remote Repositories

<details>
<summary>🌐 Remote Management</summary>

| Command | Description | Common Usage |
|---------|-------------|--------------|
| `git remote -v` | Show remote URLs | Check remote configuration |
| `git remote add origin <url>` | Add a remote repo | Link to GitHub/GitLab |
| `git remote add upstream <url>` | Add upstream remote | Fork workflows |
| `git remote remove <name>` | Remove a remote | Cleanup |
| `git remote rename <old> <new>` | Rename a remote | Fix naming |
| `git remote set-url origin <url>` | Change remote URL | Update repository location |

</details>

<details>
<summary>📤 Push & Pull Operations</summary>

| Command | Description | Best Practice |
|---------|-------------|---------------|
| `git push -u origin <branch>` | Push and set upstream | First push |
| `git push` | Push changes | Regular updates |
| `git push --force-with-lease` | Safe force push | **Recommended over --force** |
| `git push --tags` | Push all tags | Release management |
| `git fetch` | Fetch changes from remote | Update local refs |
| `git fetch --all` | Fetch from all remotes | Multi-remote setup |
| `git pull` | Fetch + merge changes | Quick update |
| `git pull --rebase` | Fetch + rebase | Linear history |

</details>

---

## 🟥 7. Undoing Changes

<details>
<summary>↩️ File-Level Undo</summary>

| Command | Description | Safety Level |
|---------|-------------|--------------|
| `git restore <file>` | Restore a file (modern command) | ✅ Safe |
| `git restore --staged <file>` | Unstage a file | ✅ Safe |
| `git checkout -- <file>` | Older way to discard changes | ⚠️ Legacy |
| `git clean -fd` | Remove untracked files/directories | ⚠️ Destructive |
| `git clean -n` | Dry run of clean | ✅ Preview |

</details>

<details>
<summary>🔄 Commit-Level Undo</summary>

| Command | Description | Impact |
|---------|-------------|--------|
| `git reset --soft HEAD~1` | Undo commit, keep changes staged | Minimal |
| `git reset HEAD~1` | Undo commit, unstage changes | Moderate |
| `git reset --hard HEAD~1` | ⚠️ Completely undo commit | **Destructive** |
| `git revert <commit>` | Create new commit to undo changes | ✅ Safe |
| `git commit --amend` | Change the last commit | Local only |

</details>

---

## 🟦 8. Stashing (Save Work for Later)

> **💡 Pro Tip:** Use descriptive stash messages with `git stash push -m "message"`

<details>
<summary>💾 Stash Operations</summary>

| Command | Description | Use Case |
|---------|-------------|----------|
| `git stash` | Save uncommitted changes | Quick context switch |
| `git stash push -m "message"` | Stash with descriptive message | **Recommended** |
| `git stash -u` | Include untracked files | Complete stash |
| `git stash pop` | Re-apply and remove from stash | Resume work |
| `git stash apply` | Apply stash but keep it | Test stash |
| `git stash apply stash@{2}` | Apply specific stash | Multiple stashes |
| `git stash list` | Show all stashes | Stash management |
| `git stash show -p` | Show stash contents | Preview changes |
| `git stash drop` | Delete a stash | Cleanup |
| `git stash clear` | Delete all stashes | Complete cleanup |

</details>

---

## 🟨 9. Tagging

<details>
<summary>🏷️ Tag Management</summary>

| Command | Description | Best Practice |
|---------|-------------|---------------|
| `git tag` | List tags | Check existing tags |
| `git tag <name>` | Create a lightweight tag | Quick marking |
| `git tag -a <name> -m "message"` | Create an annotated tag | **Recommended for releases** |
| `git tag -a <name> <commit>` | Tag specific commit | Retroactive tagging |
| `git push origin <tag>` | Push a tag to remote | Share specific tag |
| `git push origin --tags` | Push all tags to remote | Release deployment |
| `git tag -d <name>` | Delete local tag | Local cleanup |
| `git push origin --delete <tag>` | Delete remote tag | Remote cleanup |

</details>

---

## 🟩 10. Advanced Tools

<details>
<summary>🔧 Power User Commands</summary>

| Command | Description | Complexity |
|---------|-------------|------------|
| `git rebase <branch>` | Reapply commits on top of another base | ⭐⭐⭐ |
| `git rebase -i HEAD~3` | Interactive rebase last 3 commits | ⭐⭐⭐⭐ |
| `git cherry-pick <commit>` | Apply a specific commit to current branch | ⭐⭐ |
| `git cherry-pick -n <commit>` | Cherry-pick without committing | ⭐⭐⭐ |
| `git bisect start` | Binary search to find bad commit | ⭐⭐⭐⭐ |
| `git blame <file>` | Show who changed what line | ⭐⭐ |
| `git blame -L 10,20 <file>` | Blame specific lines | ⭐⭐ |
| `git grep "pattern"` | Search for pattern in tracked files | ⭐⭐ |
| `git worktree add <path> <branch>` | Create linked working tree | ⭐⭐⭐⭐ |

</details>

---

## 🛠️ 11. Useful Shortcuts

| Command | Description | Time Saved |
|---------|-------------|------------|
| `git init .` | Initialize Git in current directory | Quick setup |
| `git commit -am "msg"` | Add & commit in one step (tracked files) | ⚡ Fast |
| `git log --stat` | Show commits with file-level changes | Detailed overview |
| `git diff HEAD~1` | Compare last commit to current changes | Quick comparison |
| `git checkout -` | Switch to previous branch | ⚡ Super fast |
| `git branch --merged` | List merged branches | Cleanup helper |
| `git branch --no-merged` | List unmerged branches | Safety check |

---

## ⚡ 12. Advanced Git Workflows

<details>
<summary>🔄 Git Flow Commands</summary>

| Command | Description |
|---------|-------------|
| `git flow init` | Initialize git flow |
| `git flow feature start <name>` | Start new feature |
| `git flow feature finish <name>` | Finish feature |
| `git flow release start <version>` | Start release |
| `git flow hotfix start <name>` | Start hotfix |

</details>

<details>
<summary>🔀 Advanced Merging</summary>

| Command | Description |
|---------|-------------|
| `git merge -X ours <branch>` | Merge favoring our changes |
| `git merge -X theirs <branch>` | Merge favoring their changes |
| `git merge --strategy-option=patience` | Use patience merge algorithm |
| `git rerere` | Reuse recorded resolution |

</details>

---

## 🔧 13. Git Hooks & Automation

<details>
<summary>🪝 Hook Management</summary>

| Location | Description |
|----------|-------------|
| `.git/hooks/pre-commit` | Run before commit |
| `.git/hooks/pre-push` | Run before push |
| `.git/hooks/post-merge` | Run after merge |
| `.git/hooks/commit-msg` | Validate commit message |

**Example pre-commit hook:**
```bash
#!/bin/sh
npm test
```

</details>

---

## 🔍 14. Debugging & Troubleshooting

<details>
<summary>🐛 Diagnostic Commands</summary>

| Command | Description | Use Case |
|---------|-------------|----------|
| `git fsck` | Check repository integrity | Corruption detection |
| `git gc` | Garbage collection | Performance optimization |
| `git reflog` | Show reference log | Recovery operations |
| `git log --walk-reflogs` | Walk through reflog | Detailed recovery |
| `git show-branch` | Show branch relationships | Branch analysis |
| `git describe` | Describe current commit | Version identification |
| `git ls-files` | List tracked files | File management |
| `git count-objects -v` | Show repository statistics | Size analysis |

</details>

---

## 🌐 15. Advanced Remote Operations

<details>
<summary>🔄 Multi-Remote Workflows</summary>

| Command | Description |
|---------|-------------|
| `git remote update` | Fetch from all remotes |
| `git push --all origin` | Push all branches |
| `git push --mirror` | Mirror repository |
| `git fetch --unshallow` | Convert shallow to full clone |
| `git bundle create <file> <branch>` | Create bundle file |
| `git bundle verify <file>` | Verify bundle |

</details>

---

## 📊 16. Git Statistics & Analysis

<details>
<summary>📈 Repository Analytics</summary>

| Command | Description |
|---------|-------------|
| `git shortlog -sn` | Commit count by author |
| `git log --since="1 month ago" --pretty=tformat: --numstat \| awk '{ add += $1; subs += $2; loc += $1 - $2 } END { printf "added lines: %s, removed lines: %s, total lines: %s\n", add, subs, loc }'` | Lines of code statistics |
| `git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit` | Beautiful log format |

</details>

---

## 🔐 17. Security & Signing

<details>
<summary>🔏 GPG Signing</summary>

| Command | Description |
|---------|-------------|
| `git config --global user.signingkey <key-id>` | Set signing key |
| `git config --global commit.gpgsign true` | Auto-sign commits |
| `git commit -S -m "message"` | Sign specific commit |
| `git tag -s <name> -m "message"` | Sign tag |
| `git verify-commit <commit>` | Verify commit signature |
| `git verify-tag <tag>` | Verify tag signature |

</details>

---

## 📄 18. Useful Aliases

Add these to your `.gitconfig` file:

<details>
<summary>⚡ Power Aliases</summary>

```ini
[alias]
    # Short commands
    co = checkout
    br = branch
    ci = commit
    st = status
    
    # Advanced aliases
    unstage = reset HEAD --
    last = log -1 HEAD
    visual = !gitk
    
    # Beautiful logs
    lg = log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit
    lga = log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --all
    
    # Useful shortcuts
    amend = commit --amend --no-edit
    force = push --force-with-lease
    undo = reset --soft HEAD~1
    
    # Branch management
    cleanup = "!git branch --merged | grep -v '\\*\\|master\\|main\\|develop' | xargs -n 1 git branch -d"
    
    # Stash shortcuts
    save = stash push -m
    pop = stash pop
    
    # Quick operations
    ac = !git add -A && git commit -m
    acp = "!f() { git add -A && git commit -m \"$1\" && git push; }; f"
```

</details>

---

## 💡 19. Pro Tips & Best Practices

<details>
<summary>🎯 Expert Recommendations</summary>

### 🔥 Workflow Best Practices

1. **Commit Messages**: Use conventional commits format
   ```
   feat: add user authentication
   fix: resolve login bug
   docs: update README
   ```

2. **Branch Naming**: Use descriptive names
   ```
   feature/user-authentication
   bugfix/login-error
   hotfix/security-patch
   ```

3. **Regular Maintenance**:
   ```bash
   git fetch --prune          # Remove stale remote branches
   git gc --aggressive        # Optimize repository
   git fsck                   # Check integrity
   ```

4. **Safety First**:
   - Always use `--force-with-lease` instead of `--force`
   - Test interactive rebases on feature branches first
   - Keep backups of important branches

### ⚡ Performance Tips

- Use shallow clones for CI/CD: `git clone --depth 1`
- Enable parallel processing: `git config --global submodule.fetchJobs 4`
- Use sparse checkout for large repositories
- Configure appropriate `.gitignore` files

### 🛡️ Security Guidelines

- Sign commits with GPG keys
- Use SSH keys for authentication
- Regularly rotate access tokens
- Never commit sensitive information

</details>

---

<div align="center">

## 🎉 Congratulations!

You now have access to the most comprehensive Git command reference available. 
Bookmark this guide and refer to it whenever you need to level up your Git skills!

---

**Made with ❤️ for developers who want to master Git**

![Git Mastery](https://img.shields.io/badge/Git%20Mastery-Achieved-gold?style=for-the-badge)

</div>