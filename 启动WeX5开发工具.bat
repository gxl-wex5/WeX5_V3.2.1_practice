@echo off
title WeX5��������
@echo ��������WeX5��������...
cd /d %~dp0
set startDir=%cd%
echo %startDir%|findstr /ibe "[0-9a-z:\\\~\!\@\#\$\(\)\_\+\`\-\=\;\'\.\,]*">nul&&goto run||goto error

:error
echo ���󣺲�Ҫ�Ѱ汾��ѹ���ڰ��������ġ��ո�������ַ���Ŀ¼��
pause
goto end

:run
set JRE_HOME=""
set JAVA_HOME=""
set CLASSPATH=""
set PATH=%windir%;%windir%\System32
cd "%startDir%\studio"
start studio.exe

rem �ӳٹر�
ping 127.0.0.1 > nul

:end
