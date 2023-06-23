@echo off
title windows-cleanup-BAT-script

echo Greetings, this script will free space on your C drive.
echo:
echo It is recommended to close as many programs as you can, as this will clear their temporary data.
echo:
echo The current free space on your C drive is:
dir C:|findstr "dirs"
echo:
echo If you wish to start the clean process, press Enter, and wait patiently, the script will let you know once it is done.
echo:
pause

set LIST_TO_DELETE=(^
	"C:\Program Files (x86)\Ubisoft\Ubisoft Game Launcher\cache"^
	"C:\ProgramData\GOG.com\Galaxy\webcache"^
	"C:\ProgramData\Microsoft\Windows\DeviceMetadataCache"^
	"C:\ProgramData\Microsoft\Windows\DeviceStageCache"^
	"C:\ProgramData\Microsoft\Windows\WER\ReportArchive"^
    "C:\ProgramData\Microsoft\Windows\WER\ReportQueue"^
	"C:\ProgramData\Microsoft\Windows Defender\Scans\History\Results"^
	"C:\ProgramData\VMware\VDM\Dumps"^
	"C:\Users\%USERNAME%\.cache"^
	"C:\Users\%USERNAME%\AppData\Local\Adobe\Acrobat\11.0\Cache"^
	"C:\Users\%USERNAME%\AppData\Local\Adobe\Acrobat\DC\Cache"^
    "C:\Users\%USERNAME%\AppData\Local\Adobe\AcroCef\DC\Acrobat\Cache"^
    "C:\Users\%USERNAME%\AppData\Local\Cache"^
	"C:\Users\%USERNAME%\AppData\Local\CrashDumps"^
	"C:\Users\%USERNAME%\AppData\Local\Google\CrashDumps"^
	"C:\Users\%USERNAME%\AppData\Local\Google\CrashReports"^
	"C:\Users\%USERNAME%\AppData\Local\Google\Chrome\User Data\Default\Cache"^
	"C:\Users\%USERNAME%\AppData\Local\Google\Chrome\User Data\Default\Code Cache"^
	"C:\Users\%USERNAME%\AppData\Local\Google\Chrome\User Data\Default\Service Worker\CacheStorage"^
    "C:\Users\%USERNAME%\AppData\Local\setup\cache"^
    "C:\Users\%USERNAME%\AppData\Local\Temp"^
	"C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\User Data\Default\Cache"^
    "C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\User Data\Default\Code Cache"^
	"C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\User Data\Default\Service Worker\CacheStorage"^
    "C:\Users\%USERNAME%\AppData\Local\Microsoft\FontCache"^
	"C:\Users\%USERNAME%\AppData\Local\Microsoft\Internet Explorer\CacheStorage"^
	"C:\Users\%USERNAME%\AppData\Local\Microsoft\Office\16.0\Lync\Tracing"^
	"C:\Users\%USERNAME%\AppData\Local\Microsoft\Office\16.0\OfficeFileCache"^
	"C:\Users\%USERNAME%\AppData\Local\Microsoft\Office\16.0\Wef\"^
    "C:\Users\%USERNAME%\AppData\Local\Microsoft\Terminal Server Client\Cache"^
	"C:\Users\%USERNAME%\AppData\Local\Microsoft\Windows\Caches"^
	"C:\Users\%USERNAME%\AppData\Local\Microsoft\Windows\Explorer"^
	"C:\Users\%USERNAME%\AppData\Local\Microsoft\Windows\INetCache"^
	"C:\Users\%USERNAME%\AppData\Local\Microsoft\Windows\Temporary Internet Files"^
	"C:\Users\%USERNAME%\AppData\Local\Microsoft\Windows\WebCache"^
	"C:\Users\%USERNAME%\AppData\Local\Microsoft\Windows Mail"^
	"C:\Users\%USERNAME%\AppData\Local\NVIDIA Corporation\NVIDIA GeForce Experience\CefCache"^
	"C:\Users\%USERNAME%\AppData\Local\TileDataLayer\Database"^
	"C:\Users\%USERNAME%\AppData\Local\TileDataLayer\IconCache"^
	"C:\Users\%USERNAME%\AppData\Local\Steam\htmlcache"^
	"C:\Users\%USERNAME%\AppData\Local\VMware\VDM\Dumps"^
    "C:\Users\%USERNAME%\AppData\Local\WebEx\wbxcache"^
	"C:\Users\%USERNAME%\AppData\LocalLow\Adobe\AcroCef\DC\Acrobat\Cache\Cache"^
    "C:\Users\%USERNAME%\AppData\LocalLow\Temp"^
	"C:\Users\%USERNAME%\AppData\Roaming\discord\Cache"^
	"C:\Users\%USERNAME%\AppData\Roaming\Microsoft\Teams\Cache"^
	"C:\Users\%USERNAME%\AppData\Roaming\Microsoft\Teams\Code Cache"^
    "C:\Users\%USERNAME%\AppData\Roaming\Microsoft\Teams\Service Worker\CacheStorage"^
	"C:\Users\%USERNAME%\AppData\Roaming\Temp"^
    "C:\Windows.old"^
    "C:\Windows\ccmcache"^
    "C:\Windows\Installer\$PatchCache$"^
	"C:\Windows\Logs"^
	"C:\Windows\Minidump"^
	"C:\Windows\Prefetch"^
	"C:\Windows\ServiceProfiles\LocalService\AppData\Local\FontCache"^
	"C:\Windows\ServiceProfiles\LocalService\AppData\Local\Temp"^
	"C:\Windows\ServiceProfiles\NetworkService\AppData\Local\FontCache"^
	"C:\Windows\ServiceProfiles\NetworkService\AppData\Local\Microsoft\Windows\INetCache"^
    "C:\Windows\SoftwareDistribution\Download"^
	"C:\Windows\System32\config\systemprofile\AppData\Local\CrashDumps"^
    "C:\Windows\Temp"^
)

for %%a in %LIST_TO_DELETE% do (
    if exist %%a (
        for /D %%p in (%%a) do rmdir "%%p" /S /Q > NUL 2> NUL
        del %%a\* /F /Q /S > NUL 2> NUL
    )
)

REM This clears Firefox cache
cd /d "C:\Users\%USERNAME%\AppData\Local\Mozilla\Firefox\Profiles"

for /d %%a in (*.default) do (
	if exist %%a (
		for /D %%p in (%%a\cache2) do rmdir "%%p" /S /Q > NUL 2> NUL
		del %%a\cache2\* /F /Q /S > NUL 2> NUL
		for /D %%p in (%%a\startupCache) do rmdir "%%p" /S /Q > NUL 2> NUL
		del %%a\startupCache\* /F /Q /S > NUL 2> NUL
		for /D %%p in (%%a\jumpListCache) do rmdir "%%p" /S /Q > NUL 2> NUL
		del %%a\jumpListCache\* /F /Q /S > NUL 2> NUL
		for /D %%p in (%%a\OfflineCache) do rmdir "%%p" /S /Q > NUL 2> NUL
		del %%a\OfflineCache\* /F /Q /S > NUL 2> NUL
	)
)

for /d %%a in (*.default-release) do (
	if exist %%a (
		for /D %%p in (%%a\cache2) do rmdir "%%p" /S /Q > NUL 2> NUL
		del %%a\cache2\* /F /Q /S > NUL 2> NUL
		for /D %%p in (%%a\startupCache) do rmdir "%%p" /S /Q > NUL 2> NUL
		del %%a\startupCache\* /F /Q /S > NUL 2> NUL
		for /D %%p in (%%a\jumpListCache) do rmdir "%%p" /S /Q > NUL 2> NUL
		del %%a\jumpListCache\* /F /Q /S > NUL 2> NUL
		for /D %%p in (%%a\OfflineCache) do rmdir "%%p" /S /Q > NUL 2> NUL
		del %%a\OfflineCache\* /F /Q /S > NUL 2> NUL
	)
)

echo All done, you can close the script
echo:
echo The current free space on your C drive after cleaning is:
dir C:|findstr "dirs"
echo:
pause