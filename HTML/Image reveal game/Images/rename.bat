@echo off

setlocal enabledelayedexpansion

 

set "folder=%~dp0"

 

pushd "%folder%"

 

set "count=1"

for %%F in (*.jpg) do (

    ren "%%F" "temp!count!.jpg"

    set /a "count+=1"

)

 

set "count=1"

for %%F in (temp*.jpg) do (

    ren "%%F" "image!count!.jpg"

    set /a "count+=1"

)

 

popd