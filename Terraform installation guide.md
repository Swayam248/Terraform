In powershell:

--> [Environment]::Is64BitOperatingSystem
--> mkdir "$env:USERPROFILE\bin" -Force

Download terraform and extract it in Downloads folder

Check the extracted Terraform files
--> Get-ChildItem "$env:USERPROFILE\Downloads\terraform_1.16.4_windows_amd64"

Copy terraform.exe into our bin directory
--> Copy-Item "$env:USERPROFILE\Downloads\terraform_1.16.4_windows_amd64\terraform.exe" "$env:USERPROFILE\bin\terraform.exe"

Verify that terraform.exe exists
--> Get-Item "$env:USERPROFILE\bin\terraform.exe"

At this point Terraform was physically installed on the machine, but Windows didn't necessarily know where to find it when we typed:
--> terraform

PATH is an environment variable containing directories where Windows looks for executable programs.
When we type terraform, Terraform executable is located at:
C:\Users\Swayam\bin\terraform.exe
So we need C:\Users\Swayam\bin inside PATH. 

Temporarily add Terraform to PATH
--> $env:Path += ";$env:USERPROFILE\bin"
This allowed the current PowerShell window to find:
terraform.exe

This was only a temporary PATH change.
If we closed PowerShell and opened a new one, this change would disappear.
That's why we need to make it permanent.

Verify Terraform
--> terraform version

Check where Terraform was being found
--> Get-Command terraform

Make PATH permanent
-> Windows + R
-> type sysdm.cpl
-> Press Enter
-> Advanced -> Env Variables
-> Under User variables for Swayam:
-> Path -> Edit -> New
-> Add C:\Users\Swayam\bin
-> OK -> OK -> OK

Restart Powershell
--> terraform version

Final Setup:
C:\Users\Arpan
│
├── bin
│   └── terraform.exe
│
└── Downloads
    └── terraform_1.16.4_windows_amd64
        ├── terraform.exe
        └── LICENSE.txt

And Windows User PATH contains:
C:\Users\Swayam\bin
Now, from any PowerShell directory, we can simply run:
terraform or terraform version, without specifying the full path.


downloaded the Windows AMD64 Terraform binary, extracted terraform.exe, placed it in a dedicated user-level bin directory, added that directory to the Windows User PATH environment variable, and verified the installation using terraform version and Get-Command terraform.
