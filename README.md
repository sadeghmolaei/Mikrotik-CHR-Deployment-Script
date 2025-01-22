# Mikrotik-CHR-Deployment-Script
MikroTik CHR Installation for DigitalOcean, OVH, and Hetzner

### This script automates the installation of MikroTik CHR (Cloud Hosted Router) on cloud platforms like DigitalOcean, OVH, and Hetzner. It performs the following steps:
1.	Download: Retrieves the CHR image from the MikroTik official website.
2.	Extract: Decompresses the downloaded ZIP file to obtain the .img file.
3.	Mount: Mounts the image to a directory for configuration.
4.	Configure: Retrieves the system's IP and gateway to generate an initial configuration script.
5.	Write to Disk: Writes the CHR image to the primary partition (/dev/sda1).
6.	Finalize and Reboot: Synchronizes the file system, waits for changes to apply, and reboots the system.
### Important Notes:
-	Replace xxxxxx with a strong password for the admin user in the configuration step.
-	Ensure the correct network interface name (enp0s3) matches your environment.
-	Double-check that /dev/sda1 points to the intended target disk.

### این اسکریپت برای نصب خودکار MikroTik CHR (روتر مبتنی بر کلاد) در پلتفرم‌های ابری مانند DigitalOcean، OVH و Hetzner طراحی شده است. مراحل زیر را انجام می‌دهد:
1.	دانلود: دریافت فایل CHR از وب‌سایت رسمی MikroTik.
2.	استخراج: خارج کردن فایل ZIP برای به دست آوردن فایل ایمیج .img.
3.	مونت کردن: ایمیج را روی یک دایرکتوری برای تنظیمات اولیه مونت می‌کند.
4.	پیکربندی: آدرس IP و Gateway سیستم را استخراج کرده و اسکریپت پیکربندی اولیه را می‌سازد.
5.	نوشتن روی دیسک: ایمیج CHR را روی پارتیشن اصلی سیستم (/dev/sda1) می‌نویسد.
6.	نهایی‌سازی و راه‌اندازی مجدد: سیستم را همگام‌سازی کرده، چند ثانیه منتظر می‌ماند و سپس ریبوت می‌کند.
### نکات مهم:
-	رمز عبور xxxxxx را با یک رمز قوی جایگزین کنید.
-	مطمئن شوید که نام اینترفیس شبکه (enp0s3) با محیط شما سازگار است.
-	بررسی کنید که /dev/sda1 دیسک هدف صحیح باشد.
