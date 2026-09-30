# Practical 6 – Version Control for Test Scripts using GitHub

## Folder contents

```
P6_Git_Version_Control/
├── src/
│   ├── calculator.py         # application code under test
│   └── login_validator.py    # application code under test
├── tests/
│   ├── test_calculator.py    # automation test scripts (pytest)
│   └── test_login.py
├── .github/workflows/tests.yml  # optional: runs tests on GitHub automatically
├── git_workflow.sh           # all Git steps in one script (Linux/macOS/Git Bash)
├── git_workflow.bat          # same for Windows Command Prompt
├── pytest.ini, requirements.txt, .gitignore
└── Lab_Record.md             # journal write-up
```

## 1. Install the software (one time)

1. **Git:** [https://git-scm.com/downloads](https://git-scm.com/downloads) → install with default options. Check: `git --version`
2. **VS Code:** [https://code.visualstudio.com/](https://code.visualstudio.com/)
3. **Python 3:** [https://www.python.org/downloads/](https://www.python.org/downloads/) (tick *Add Python to PATH* on Windows)
4. **GitHub account:** [https://github.com/signup](https://github.com/signup)

Configure Git with your name and email (one time):

```bash
git config --global user.name "Your Name"
git config --global user.email "you@example.com"
```

## 2. Check the test scripts work

Open this folder in VS Code → **Terminal → New Terminal**, then:

```bash
pip install -r requirements.txt
pytest -v
```

You should see **16 passed**.

## 3. Create an empty repository on GitHub

GitHub → **+ → New repository** → name `test-scripts-repo` → **Public** → do NOT tick "Add a README" → **Create repository**. Copy the URL, e.g. `https://github.com/yourname/test-scripts-repo.git`.

## 4. Run the Git workflow

### Option A – Type each command (best for demonstration)

```bash
# Step 1: Initialize repository
git init
git branch -M main

# Step 2: Add scripts
git status
git add .
git status

# Step 3: Commit changes
git commit -m "Initial commit: add calculator and login test scripts"
git log --oneline

# Step 4: Push to GitHub
git remote add origin https://github.com/yourname/test-scripts-repo.git
git push -u origin main

# Step 5: Pull latest changes
#   On GitHub: click Add file → Create new file → README.md → write something → Commit
git pull origin main
git log --oneline
```

On the first push, a browser window opens asking you to sign in to GitHub; approve it. (If asked for a password in the terminal, use a **Personal Access Token** from GitHub → Settings → Developer settings → Tokens.)

### Option B – Run the script

Windows Command Prompt:

```bat
git_workflow.bat https://github.com/yourname/test-scripts-repo.git
```

Git Bash / Linux / macOS:

```bash
./git_workflow.sh https://github.com/yourname/test-scripts-repo.git
```

The script pauses at Step 5 so you can edit a file on GitHub, then pulls it.

### Option C – VS Code GUI

Source Control icon (left bar) → **Initialize Repository** → **+** next to files (stage) → type message → **Commit** → **Publish Branch** → later **⋯ → Pull**.

## 5. Extra: show a second commit (recommended)

```bash
# add a new test in tests/test_calculator.py, e.g.
#   def test_add_negative(): assert add(-2, -3) == -5
pytest -v
git add tests/test_calculator.py
git commit -m "Add negative number test for add()"
git push
git log --oneline
```

If you pushed `.github/workflows/tests.yml`, open the **Actions** tab on GitHub to see the tests run automatically.

## Common errors

| Error                            | Fix                                                     |
| -------------------------------- | ------------------------------------------------------- |
| `remote origin already exists` | `git remote set-url origin <url>`                     |
| `rejected ... fetch first`     | Run`git pull origin main --rebase`, then `git push` |
| `Author identity unknown`      | Run the two`git config --global` commands above       |
| `pytest not recognized`        | `python -m pytest -v`                                 |
