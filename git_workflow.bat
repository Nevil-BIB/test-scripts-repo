@echo off
REM Practical 6 - Git workflow (Windows Command Prompt)
REM Usage: git_workflow.bat https://github.com/<username>/test-scripts-repo.git
if "%~1"=="" (
  echo Usage: git_workflow.bat ^<github-repo-url^>
  exit /b 1
)
echo == Step 1: Initialize repository ==
git init
git branch -M main
echo == Step 2: Add scripts ==
git add .
git status
echo == Step 3: Commit changes ==
git commit -m "Initial commit: add calculator and login test scripts"
git log --oneline
echo == Step 4: Push to GitHub ==
git remote remove origin 2>nul
git remote add origin %1
git remote -v
git push -u origin main
echo == Step 5: Pull latest changes ==
echo Now edit any file on GitHub (e.g. README.md) and commit it there.
pause
git pull origin main
git log --oneline
echo Git workflow completed successfully.
