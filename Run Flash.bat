@echo off
REM ============================================
REM  Run Flash - Qualitative Data Analysis
REM ============================================
REM  Flashcard manager with Git operations
REM  Author: Edward Solomon Kweku Gyimah
REM ============================================

:MENU
cls
color 0E
title Run Flash - Qualitative Data Analysis

echo.
echo ========================================================
echo.
echo     RUN FLASH - QUALITATIVE DATA ANALYSIS
echo.
echo ========================================================
echo.
echo   Student: Edward Solomon Kweku Gyimah (SE/DAT/24/0007)
echo   Exam Date: October 21, 2025 at 3:00 PM
echo.
echo ========================================================
echo.
echo   [1] Initialize Git Repository (First Time Setup)
echo   [2] View Status
echo   [3] Push (Upload changes to GitHub)
echo   [4] View Recent Commits
echo   [5] Open Flashcards in Browser
echo   [6] Exit
echo.
echo ========================================================
echo.

set /p choice="Select option (1-6): "

if "%choice%"=="1" goto INIT
if "%choice%"=="2" goto STATUS
if "%choice%"=="3" goto PUSH
if "%choice%"=="4" goto LOG
if "%choice%"=="5" goto OPEN
if "%choice%"=="6" goto EXIT

echo.
echo [ERROR] Invalid choice. Please select 1-6.
timeout /t 2 > nul
goto MENU

:INIT
cls
color 0A
echo.
echo ========================================================
echo    INITIALIZE GIT REPOSITORY
echo ========================================================
echo.

if exist ".git" (
    echo [INFO] Git repository already exists.
    echo.
    pause
    goto MENU
)

echo Creating GitHub repository...
echo.
echo STEP 1: Creating local Git repository...
git init
git branch -M main

echo.
echo STEP 2: Adding files...
git add .

echo.
echo STEP 3: Creating initial commit...
git commit -m "Initial commit: Qualitative Data Analysis exam flashcards with countdown timer"

echo.
echo ========================================================
echo    MANUAL STEPS REQUIRED
echo ========================================================
echo.
echo 1. Go to: https://github.com/new
echo 2. Repository name: QualitativeDataAnalysis
echo 3. Description: Exam study materials for Qualitative Data Analysis
echo 4. Public repository
echo 5. Click "Create repository"
echo.
echo 6. Then run this command:
echo    git remote add origin https://github.com/eskgyimah/QualitativeDataAnalysis.git
echo    git push -u origin main
echo.
echo 7. Enable GitHub Pages:
echo    - Go to Settings ^> Pages
echo    - Source: main branch
echo    - Save
echo.
echo ========================================================
echo.
pause
goto MENU

:STATUS
cls
color 0B
echo.
echo ========================================================
echo    GIT STATUS
echo ========================================================
echo.

if not exist ".git" (
    echo [ERROR] Not a Git repository. Run option [1] to initialize.
    echo.
    pause
    goto MENU
)

git status
echo.
echo Current branch:
git branch --show-current
echo.
echo ========================================================
echo.
pause
goto MENU

:PUSH
cls
color 0D
echo.
echo ========================================================
echo    PUSHING TO GITHUB
echo ========================================================
echo.

if not exist ".git" (
    echo [ERROR] Not a Git repository. Run option [1] to initialize.
    echo.
    pause
    goto MENU
)

git diff-index --quiet HEAD --
if %ERRORLEVEL% EQU 0 (
    echo [INFO] No changes to commit.
    echo.
    pause
    goto MENU
)

echo Files changed:
git status --short
echo.

set /p commit_msg="Enter commit message (optional, press Enter for default): "
if "%commit_msg%"=="" set commit_msg=Update exam study materials

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
    echo GitHub Pages will update in 1-2 minutes.
) else (
    echo.
    echo [ERROR] Push failed. Check connection or remote setup.
)
echo.
echo ========================================================
echo.
pause
goto MENU

:LOG
cls
color 0C
echo.
echo ========================================================
echo    RECENT COMMITS (Last 10)
echo ========================================================
echo.

if not exist ".git" (
    echo [ERROR] Not a Git repository. Run option [1] to initialize.
    echo.
    pause
    goto MENU
)

git log --oneline --graph --decorate -10
echo.
echo ========================================================
echo.
pause
goto MENU

:OPEN
cls
echo.
echo Opening flashcards in browser...
start QUALITATIVE_DATA_ANALYSIS_FLASHCARDS.html
timeout /t 1 > nul
goto MENU

:EXIT
cls
echo.
echo ========================================================
echo.
echo   Thank you for using Run Flash!
echo.
echo   Student: Edward Solomon Kweku Gyimah (SE/DAT/24/0007)
echo   Exam: October 21, 2025 at 3:00 PM
echo   Good luck with your studies!
echo.
echo ========================================================
echo.
timeout /t 2 > nul
exit
