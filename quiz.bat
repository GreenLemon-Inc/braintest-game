cls
cd quiz_questions
set question=0
set coins=0
:quiz
cls
set /A question=%question%+1
if not exist answer%question%.data goto end
set row=0
set "rightanswer="
for /f "delims=" %%f in ('more/e +%row% ^< answer%question%.data') do (if not defined rightanswer set "rightanswer=%%f")

@echo %question%. question
type %question%question.data
@echo.

choice /C 123 /N
if %errorlevel%==%rightanswer% goto true
goto false

:true
cls
set /a coins=%coins%+1
@echo That was the right answer you already have %coins% point/s.
pause
goto quiz

:false
@echo That was the wrong answer :( try again.
goto quiz

:end
@echo Thanks for playing you have total collected %coins% point/s.
pause
exit