# Terraform Installation Guide — Windows

This guide explains how to install Terraform on Windows and configure it so that the `terraform` command can be used from PowerShell or Command Prompt.

---

## Prerequisites

Before starting, make sure you have:

* A 64-bit Windows system
* Internet access
* Permission to install software and modify User Environment Variables

---

## 1. Check Windows Architecture

Open **PowerShell** and run:

```powershell
[Environment]::Is64BitOperatingSystem
```

Expected output:

```text
True
```

If the output is `True`, your system is 64-bit and you can use the **Windows AMD64** Terraform package.

---

## 2. Create a `bin` Directory

Open **PowerShell** and run:

```powershell
mkdir "$env:USERPROFILE\bin" -Force
```

This creates a `bin` directory inside your Windows user profile.

For example:

```text
C:\Users\<username>\bin
```

This directory will be used to store `terraform.exe`.

---

## 3. Download Terraform

Go to the official Terraform installation page:

https://developer.hashicorp.com/terraform/install

Download the Terraform package for:

```text
Windows
AMD64
```

The downloaded file will have a name similar to:

```text
terraform_<version>_windows_amd64.zip
```

> **Important:** Make sure you download the **Windows AMD64** package.
>
> `darwin` is for macOS and should not be used on Windows.

---

## 4. Extract Terraform

Extract the downloaded ZIP file into your **Downloads** folder.

After extraction, you should have a folder similar to:

```text
C:\Users\<username>\Downloads\terraform_<version>_windows_amd64
```

Inside this folder, you should see:

```text
terraform.exe
LICENSE.txt
```

The important file is:

```text
terraform.exe
```

---

## 5. Copy `terraform.exe` to the `bin` Directory

Open **PowerShell** and run the following command.

Replace `<version>` with the version you downloaded:

```powershell
Copy-Item "$env:USERPROFILE\Downloads\terraform_<version>_windows_amd64\terraform.exe" "$env:USERPROFILE\bin\terraform.exe"
```

For example:

```powershell
Copy-Item "$env:USERPROFILE\Downloads\terraform_1.16.4_windows_amd64\terraform.exe" "$env:USERPROFILE\bin\terraform.exe"
```

Terraform should now be located at:

```text
C:\Users\<username>\bin\terraform.exe
```

---

## 6. Verify `terraform.exe`

Run:

```powershell
Get-Item "$env:USERPROFILE\bin\terraform.exe"
```

You should see information about the `terraform.exe` file.

For example:

```text
Directory: C:\Users\<username>\bin

Mode        LastWriteTime    Length       Name
----        -------------    ------       ----
-a----      ...              ...          terraform.exe
```

---

## 7. Add Terraform to PATH

Windows needs to know where `terraform.exe` is located so that the `terraform` command can be executed from any directory.

The directory that needs to be added to PATH is:

```text
C:\Users\<username>\bin
```

### Open Environment Variables

Press:

```text
Windows + R
```

Enter:

```text
sysdm.cpl
```

Press **Enter**.

Then go to:

```text
Advanced
→ Environment Variables
```

---

## 8. Add the `bin` Directory to User PATH

Under **User variables**, find:

```text
Path
```

Select it and click:

```text
Edit
```

Click:

```text
New
```

Add:

```text
C:\Users\<username>\bin
```

Click:

```text
OK
```

Then click **OK** on the remaining Environment Variables and System Properties windows.

---

## 9. Restart PowerShell

Close the existing PowerShell window.

Open a **new PowerShell window**.

This is necessary because the new PowerShell session will load the updated PATH environment variable.

---

## 10. Verify Terraform Installation

Run:

```powershell
terraform version
```

You should see output similar to:

```text
Terraform v1.16.4
on windows_amd64
```

The version may be different depending on the version you installed.

---

## 11. Verify Terraform Command Location

Run:

```powershell
Get-Command terraform
```

The output should show the Terraform executable located inside your `bin` directory.

For example:

```text
C:\Users\<username>\bin\terraform.exe
```

---

## Installation Complete

Terraform is now installed and configured.

You should be able to run Terraform commands from any PowerShell directory:

```powershell
terraform version
```

You can now proceed with the Terraform project setup.

---

## Quick Installation Summary

```text
Check Windows Architecture
        ↓
Create bin Directory
        ↓
Download Terraform
        ↓
Extract ZIP
        ↓
Copy terraform.exe to bin
        ↓
Add bin Directory to PATH
        ↓
Restart PowerShell
        ↓
Run terraform version
        ↓
Terraform Ready
```
