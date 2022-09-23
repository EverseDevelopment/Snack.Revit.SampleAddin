; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "SampleRevitAddin"
#define MyAppVersion "1.0"
#define MyAppPublisher "e-verse"

[Setup]
; NOTE: The value of AppId uniquely identifies this application. Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{264AD411-643C-43AC-9F07-34523C752100}
AppName={#MyAppName}
#define installerPath "{commonpf64}\e-verse\Snacks\"
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
DefaultDirName={#installerPath}
DisableDirPage=yes
DefaultGroupName=Revit Extractor
DisableProgramGroupPage=yes


#define Revit2020 "\Autodesk\ApplicationPlugins\SampleRevitAddin.bundle\Contents\2020\"
#define Revit2021 "\Autodesk\ApplicationPlugins\SampleRevitAddin.bundle\Contents\2021\"
#define Revit2022 "\Autodesk\ApplicationPlugins\SampleRevitAddin.bundle\Contents\2022\"
#define Revit2023 "\Autodesk\ApplicationPlugins\SampleRevitAddin.bundle\Contents\2023\"


; Uncomment the following line to run in non administrative install mode (install for current user only.)
;PrivilegesRequired=lowest
OutputDir=.\Output
OutputBaseFilename=SampleRevitAddin
Compression=lzma
SolidCompression=yes
WizardStyle=modern

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Files]


Source: "..\SampleRevitAddin.2020\bin\Release\*"; DestDir: "{userappdata}{#Revit2020}\"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "..\SampleRevitAddin.Common\SampleRevitAddin.addin"; DestDir: "{userappdata}{#Revit2020}\"; Flags: ignoreversion recursesubdirs createallsubdirs

Source: "..\SampleRevitAddin.2021\bin\Release\*"; DestDir: "{userappdata}{#Revit2021}\"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "..\SampleRevitAddin.Common\SampleRevitAddin.addin"; DestDir: "{userappdata}{#Revit2021}\"; Flags: ignoreversion recursesubdirs createallsubdirs


Source: "..\SampleRevitAddin.2022\bin\Release\*"; DestDir: "{userappdata}{#Revit2022}\"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "..\SampleRevitAddin.Common\SampleRevitAddin.addin"; DestDir: "{userappdata}{#Revit2022}\"; Flags: ignoreversion recursesubdirs createallsubdirs

Source: "..\SampleRevitAddin.2023\bin\Release\*"; DestDir: "{userappdata}{#Revit2023}\"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "..\SampleRevitAddin.Common\SampleRevitAddin.addin"; DestDir: "{userappdata}{#Revit2022}\"; Flags: ignoreversion recursesubdirs createallsubdirs

Source: "..\SampleRevitAddin.Common\PackageContents.xml"; DestDir: "{userappdata}\Autodesk\ApplicationPlugins\SampleRevitAddin.bundle\"; Flags: ignoreversion

; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Icons]
Name: "{group}\{cm:UninstallProgram,{#MyAppName}}"; Filename: "{uninstallexe}"

