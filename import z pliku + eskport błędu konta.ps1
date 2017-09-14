$serwer = Get-Content -path "C:\Users\slawad1\serwery.txt"


$cred=Get-Credential hestia\sa-slawad1


$serwer |%{$_ |Out-File c:\users\slawad1\OOS\kontabledy.txt -Append ;try{Get-WMIObject win32_useraccount -filter "localAccount='true' and name='administrator'" -computername $_ -Credential $cred -ErrorAction Continue |
    select PSComputername, name, Lockout, PasswordChangeable |
        export-csv c:\users\slawad1\OOS\konta123.csv -Append -NoTypeInformation}
        
    catch{
         $_ | Out-file c:\users\slawad1\OOS\kontabledy.txt -Append; 
        
}}
