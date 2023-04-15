@echo off
For /f "tokens=1-4 delims=/ " %%a in ('date /t') do (set mydate=%%c%%b%%a)
For /f "tokens=1-3 delims=/:" %%a in ("%TIME:~0,8%") do (set mytime=%%a%%b%%c)
set timestamp=%mydate%%mytime%
@echo on
docker buildx build --platform linux/arm64 -t joshendriks/trivial-wol-server:%timestamp% -f Dockerfile .
docker push joshendriks/trivial-wol-server:%timestamp%
docker tag joshendriks/trivial-wol-server:%timestamp% joshendriks/trivial-wol-server
docker push joshendriks/trivial-wol-server