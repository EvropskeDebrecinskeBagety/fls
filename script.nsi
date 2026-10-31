!include "MUI.nsh"

Name "Worst Bowling Game"
InstallDir "$APPDATA\Worst Bowling Game"
OutFile "wbginstaller.exe"
#!define MUI_ICON "file.ico"
BrandingText "Evropske Debrecinske Bagety - EDB"

#!define MUI_HEADERIMAGE
#!define MUI_HEADERIMAGE_BITMAP "ban2.bmp"
#!define MUI_WELCOMEFINISHPAGE_BITMAP "ban1.bmp"

!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_LICENSE "license.txt"
!insertmacro MUI_PAGE_COMPONENTS
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH

!insertmacro MUI_UNPAGE_WELCOME
!insertmacro MUI_UNPAGE_CONFIRM
!insertmacro MUI_UNPAGE_INSTFILES
!insertmacro MUI_UNPAGE_FINISH

!insertmacro MUI_LANGUAGE "English"

#!define MUI_FINISHPAGE_RUN "$INSTDIR\launcher.exe"

Section "Executables & Required"
    SectionIn RO
    SetOutPath "$INSTDIR"
    File "launcher.exe"
    File "CHANGELOG"
    SetOutPath "$INSTDIR\.config"
    File ".config\conf.toml"

    WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\WorstBowlingGame" "DisplayName" "Worst Bowling Game"
    WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\WorstBowlingGame" "DisplayVersion" "2026.09.1.2"
    WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\WorstBowlingGame" "Publisher" "Evropske Debrecinske Bagety"
    WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\WorstBowlingGame" "NoModify" 1
    WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\WorstBowlingGame" "NoRepair" 1
    WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\WorstBowlingGame" "UninstallString" "$INSTDIR\uninstall.exe"

    SetOutPath "$INSTDIR\bin"
    File "bin\Worst Bowling Game.exe"
    WriteUninstaller "$INSTDIR\uninstall.exe"
    CreateShortCut "$DESKTOP\Worst Bowling Game.lnk" "$INSTDIR\launcher.exe"
    CreateShortCut "$STARTMENU\Worst Bowling Game.lnk" "$INSTDIR\launcher.exe"
    CreateShortCut "$STARTMENU\WBG - Uninstall.lnk" "$INSTDIR\uninstall.exe"
SectionEnd

Section "Manual"
    SetOutPath "$INSTDIR\manual"
    File "manual\manual_cs.pdf"
    File "manual\manual_en.pdf"
    File "manual\manual_de.pdf"
SectionEnd

Section "Additional"
    SetOutPath "$INSTDIR\additional\downloadable"
    File "additional\downloadable\README"
SectionEnd

Section "Uninstall"
    SetOutPath "$INSTDIR"
    Delete "launcher.exe"
    SetOutPath "$INSTDIR\additional\downloadable"
    Delete "README"
    SetOutPath "$INSTDIR\manual"
    Delete "manual_cs.pdf"
    Delete "manual_en.pdf"
    SetOutPath "$INSTDIR\bin"
    Delete "Worst Bowling Game.exe"
    DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\WorstBowlingGame"
    Delete "$DESKTOP\Worst Bowling Game.lnk"
    Delete "$STARTMENU\Worst Bowling Game\Worst Bowling Game.lnk"
    SetOutPath "$INSTDIR\.config"
    Delete "conf.toml"
    Delete "$STARTMENU\Worst Bowling Game\Uninstall.lnk"
SectionEnd