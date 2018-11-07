@pushd .
@call "\Program Files (x86)\Microsoft Visual Studio\2017\Community\VC\Auxiliary\Build\vcvars%p%.bat"
@popd
@mkdir obj
@mkdir bin

cl /MP8 /Zi /EHsc /Fo"./obj/" /Fe"./bin/le.exe" /DNDEBUG /DWIN32 /D_TIMESPEC_DEFINED /DZIP_STATIC /DCURL_STATICLIB /MT /DUNICODE /D_UNICODE /Ilib /Iinternal main/main.cpp lib/acme-exception.cpp lib/acme-lw.cpp internal/http.cpp WS2_32.LIB Crypt32.lib Advapi32.lib libcurl.lib legacy_stdio_definitions.lib user32.lib Wldap32.lib /I C:\VS_Projects\OpenSSL-Win64\include C:\VS_Projects\OpenSSL-Win64\lib\VC\static\libcrypto64MT.lib /IC:\VS_Projects\third_party\curl\include /IC:\VS_Projects\third_party /link /LIBPATH:C:\VS_Projects\third_party\curl\build_x64\lib\Release /LIBPATH:C:\VS_Projects\OpenSSL-Win64\lib\VC\static /RELEASE /STACK:12000000,2000000

IF %ERRORLEVEL% NEQ 0 (
	echo COMPILE ERROR
)
IF %ERRORLEVEL% EQU 0 (
	echo COMPILE OK
)
