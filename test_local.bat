@echo off
chcp 65001 >nul 2>&1
echo ============================================
echo   福利吧论坛签到 - 本地测试工具（v2）
echo ============================================
echo.
echo  支持两种方式：
echo    1. 账号密码登录（推荐，自动处理验证码）
echo    2. Cookie 方式
echo.

set /p mode="请选择模式 (1=账号密码, 2=Cookie): "

if "%mode%"=="2" goto cookie_mode

:account_mode
set /p username="请输入论坛账号: "
set /p password="请输入论坛密码: "
echo.
echo 正在执行签到测试（账号密码模式）...
echo.
set FORUM_USERNAME=%username%
set FORUM_PASSWORD=%password%
set CHECKIN_MODE=checkin
set PUSHPLUS_TOKEN=
set SERVERCHAN_KEY=
python wnflb_checkin.py
goto end

:cookie_mode
set /p cookie="请粘贴你的 Cookie 字符串: "
echo.
echo 正在执行签到测试（Cookie 模式）...
echo.
set FORUM_COOKIE=%cookie%
set CHECKIN_MODE=checkin
set PUSHPLUS_TOKEN=
set SERVERCHAN_KEY=
python wnflb_checkin.py
goto end

:end
echo.
pause
