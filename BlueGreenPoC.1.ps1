# Script will search for the site with the binding "www.site.com". 
# If that site is called "Blue Site" it will remove the binding and add it to "Green Site". 
# If the site found is "Green Site" it will remove the binding and add it to "Blue Site"

Import-Module WebAdministration

$LiveHeader = Get-WebBinding -HostHeader "www.site.com"
If ($LiveHeader.Name = 'Blue Site') {
    Remove-WebBinding -name 'Blue site' -hostheader 'www.site.com'
    New-WebBinding -name 'Green site' -port 80 -IPAddress * -hostheader 'www.site.com'
}
If ($LiveHeader.Name = 'Green Site') {
    Remove-WebBinding -name 'Green Site' -hostheader 'www.site.com'
    New-WebBinding -name 'Blue Site' -port 80 -IPAddress * -hostheader 'www.site.com'
}