<#
------------------------------------------
verification_faille_zerologon.ps1
Permet de vérifier la faille zerologon
Version:	V1.0
Modifications :	Nom De l'auteur  V1.0 :
Creation du script verification_faille_zerologon.ps1
Auteur :  Coyotenoir
------------------------------------------
#>
############### VARIABLES ############### 
$os = (Get-WmiObject -class Win32_OperatingSystem).Caption ;
$patch_2012_R2 = "KB4571723"
$patch2_2012_R2 = "KB4571703"
$patch_2016 = "KB4571694"
$patch_2019 = "KB4565349"
$Check2012R2 =wmic qfe | Select-String $patch_2012_R2
$Check2012R2_2 =wmic qfe | Select-String $patch2_2012_R2
$Check2016 =wmic qfe | Select-String $patch_2016
$Check2019 =wmic qfe | Select-String $patch_2019

#########################################
Write-Host " "
Write-Host "============ Vérification de la faille Zerologon ================="
Write-Host "la faille à été découverte et exploité a partir du 14.10.2020 "
Write-Host "Lien : https://msrc.microsoft.com/update-guide/en-US/vulnerability/CVE-2020-1472 "
Write-Host " "
Write-Host "Votre systeme est actuellement  en $os"
Write-Host " "

if ($os -like "*Microsoft Windows Server 2012 R2*")
    {
Write-Host -ForegroundColor green " Vous avez un Windows Server 2012 R2 Standard "
if ($Check2012R2)
{
Write-Host -ForegroundColor green " La faille zerologon est bien patché pour le serveur Windows $os"
Write-Host " "
Write-Host " "
}
else 
{
if ($Check2012R2_2)
{
Write-Host -ForegroundColor green " La faille zerologon est bien patché pour le serveur Windows $os"
Write-Host " "
Write-Host " "
}
 }
    else 
{
Write-Host -ForegroundColor red " /!\ La faille zerologon n est pas patché pour votre serveur  qui a comme systeme /!\ $os "
Write-Host -ForegroundColor red " /!\ Il suffit d'installer la  KB4571723 ou KB4571703 "
Write-Host " "
Write-Host " "
}
}

if ($os -like "*Microsoft Windows Server 2016*")
{

Write-Host -ForegroundColor green " Vous avez un Windows Server 2016 Standard "

if ($Check2016)
{
Write-Host -ForegroundColor green " La faille zerologon est bien patché pour le serveur Windows $os"
Write-Host " "
Write-Host " "
}

else 
{
Write-Host -ForegroundColor red " /!\ La faille zerologon n est pas patché pour votre serveur  qui a comme systeme /!\ $os "
Write-Host -ForegroundColor red " /!\ Il suffit d'installer la  KB4571694 "
Write-Host " "
Write-Host " "
}
    }

if ($os -like "*Microsoft Windows Server 2019*")
    {

Write-Host -ForegroundColor green " Vous avez un Windows Server 2019 Standard "

if ($Check2019)
{
Write-Host -ForegroundColor green " La faille zerologon est bien patché pour le serveur Windows $os"
Write-Host " "
Write-Host " "
}

else 
{
Write-Host -ForegroundColor red " /!\ La faille zerologon n est pas patché pour votre serveur  qui a comme systeme /!\ $os "
Write-Host -ForegroundColor red " /!\ Il suffit d'installer la  KB4565349 "
Write-Host " "
Write-Host " "
   }
 }
  
  
  if ($os -like "*Microsoft Windows 10*")
    {

Write-Host -ForegroundColor red " Le systeme n'est pas affecté concernant la faille dite ZEROlogon"
Write-Host -ForegroundColor red " La faille zerologon ne concerne que les 3 types de Windows serveurs"
Write-Host -ForegroundColor red " Vous n'avez pas un Windows Server 2012 R2 Standard ou Windows Server 2016 ou Windows Server 2019 "

     }
  
    if ($os -like "*Microsoft Windows 8*")
    {

Write-Host -ForegroundColor red " Le systeme n'est pas affecté concernant la faille dite ZEROlogon"
Write-Host -ForegroundColor red " La faille zerologon ne concerne que les 3 types de Windows serveurs"
Write-Host -ForegroundColor red " Vous n'avez pas un Windows Server 2012 R2 Standard ou Windows Server 2016 ou Windows Server 2019 "

     }
      if ($os -like "*Microsoft Windows 7*")
    {

Write-Host -ForegroundColor red " Le systeme n'est pas affecté concernant la faille dite ZEROlogon"
Write-Host -ForegroundColor red " La faille zerologon ne concerne que les 3 types de Windows serveurs"
Write-Host -ForegroundColor red " Vous n'avez pas un Windows Server 2012 R2 Standard ou Windows Server 2016 ou Windows Server 2019 "

     }