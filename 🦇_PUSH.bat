@echo off
REM ============================================
REM  Git Push - Qualitative Data Analysis
REM ============================================
REM  Quick push to GitHub
REM  Author: Edward Solomon Kweku Gyimah
REM ============================================

cls
color 0D
echo.
echo ========================================================
echo    QUALITATIVE DATA ANALYSIS - PUSH TO GITHUB
echo ========================================================
echo.

REM Check if git repo exists
if not exist ".git" (
    echo [ERROR] This is not a Git repository yet.
    echo.
    echo To create a GitHub repository:
    echo 1. Go to https://github.com/new
    echo 2. Create a new repository named "QualitativeDataAnalysis"
    echo 3. Run these commands:
    echo.
    echo    git init
    echo    git add .
    echo    git commit -m "Initial commit: Exam flashcards"
    echo    git branch -M main
    echo    git remote add origin https://github.com/eskgyimah/QualitativeDataAnalysis.git
    echo    git push -u origin main
    echo.
    pause
    goto END
)

git diff-index --quiet HEAD --
if %ERRORLEVEL% EQU 0 (
    echo [INFO] No changes to commit.
    echo.
    pause
    goto END
)

echo Files changed:
git status --short
echo.

set /p commit_msg="Enter commit message: "
if "%commit_msg%"=="" set commit_msg=Update qualitative data analysis materials

echo.
echo Staging all changes...
git add .

echo Committing...
git commit -m "%commit_msg%"

echo Pushing to GitHub...
git push origin main

if %ERRORLEVEL% EQU 0 (
    echo.
    echo [SUCCESS] Push completed!
    echo Live site will update in 1-2 minutes (if GitHub Pages enabled).
) else (
    echo.
    echo [ERROR] Push failed. Check connection.
)
echo.
echo ========================================================
echo.
pause

:END
exit
