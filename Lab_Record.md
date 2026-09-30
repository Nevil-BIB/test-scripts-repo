# Practical 6: Version Control for Test Scripts using GitHub

## Aim
To manage automation scripts using Git.

## Software Required
Git, GitHub, VS Code (and Python 3 with pytest for the test scripts).

## Theory

**Version control** records changes to files over time so that earlier versions can be recalled, changes can be compared, and several people can work on the same scripts safely.

**Git** is a distributed version control system: every developer has a full copy of the repository, including its history, on their own machine. **GitHub** is a cloud hosting service for Git repositories that adds collaboration features (pull requests, issues, Actions for CI).

**Why version control test scripts?** Test automation code changes along with the application. Git keeps a history of every change, lets testers roll back a broken script, allows team members to work in parallel on branches, and lets CI tools run the latest tests automatically.

**Git areas**
```
Working Directory --git add--> Staging Area --git commit--> Local Repository --git push--> Remote (GitHub)
        ^                                                                                      |
        +------------------------------------- git pull -------------------------------------+
```

**Important commands**

| Command | Purpose |
|---|---|
| `git init` | Create a new local repository |
| `git status` | Show changed / staged / untracked files |
| `git add .` | Stage all changes for the next commit |
| `git commit -m "msg"` | Save a snapshot of staged files with a message |
| `git log --oneline` | Show commit history |
| `git remote add origin <url>` | Link the local repo to GitHub |
| `git push -u origin main` | Upload commits to GitHub |
| `git pull origin main` | Download and merge the latest changes |
| `git clone <url>` | Copy a remote repository to the local machine |
| `git branch`, `git checkout -b` | List / create branches |

## Procedure
1. Installed Git and VS Code, and configured `user.name` and `user.email`.
2. Created a project folder containing application code (`src/`) and pytest automation scripts (`tests/`), and verified them with `pytest -v`.
3. **Initialized repository** with `git init` and renamed the branch to `main`.
4. **Added scripts** to the staging area with `git add .` and checked with `git status`.
5. **Committed changes** using `git commit -m "Initial commit: add calculator and login test scripts"`.
6. Created an empty repository `test-scripts-repo` on GitHub, linked it using `git remote add origin <url>`, and **pushed** with `git push -u origin main`.
7. Edited README.md directly on GitHub and committed it, then **pulled the latest changes** using `git pull origin main`.
8. Verified the history using `git log --oneline`.

## Observations

**Test execution before committing**
```
$ pytest -v
tests/test_calculator.py::test_add PASSED
tests/test_calculator.py::test_subtract PASSED
...
tests/test_login.py::test_password_strength[nouppercase@1-False] PASSED
======================== 16 passed ========================
```

**Git commands and output**

| Step | Command | Observed Output |
|---|---|---|
| Initialize | `git init` | Initialized empty Git repository in .../.git/ |
| Add | `git add .` then `git status` | Changes to be committed: new file: src/calculator.py, tests/test_login.py ... |
| Commit | `git commit -m "Initial commit..."` | [main (root-commit) f4bcc01] Initial commit ... 12 files changed |
| Push | `git push -u origin main` | branch 'main' set up to track 'origin/main' |
| Pull | `git pull origin main` | Fast-forward README.md \| 2 ++ 1 file changed |
| History | `git log --oneline` | a1b2c3d Create README.md / f4bcc01 Initial commit ... |

*(Commit IDs will be different on your machine. Attach screenshots of the terminal and the GitHub repository page.)*

## Expected Outcome
Test scripts are version controlled.

## Result
Git workflow successfully completed.

## Viva Questions
1. What is the difference between Git and GitHub?
2. What is the staging area?
3. What is the difference between `git pull` and `git fetch`?
4. What is a merge conflict and how is it resolved?
5. Why should `.gitignore` be used?
