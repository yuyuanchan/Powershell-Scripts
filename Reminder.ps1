# function below is used to check whether if the input date is considered a holiday
# please note that holidays have to be specified manually
function IsHoliday([DateTime]$InputDate) {
    [string[]]$Holidays =
        '01/01/2021', # New Years
        '01/18/2021', # MLK
        '02/15/2021', # President's day
        '05/31/2021', # Memorial day
        '07/05/2021', # Independence day
        '09/06/2021', # Labor's day
        '11/25/2021', # Thanksgiving
        '11/26/2021', # Black Friday
        '12/23/2021', # Christmas Eve
        '12/24/2021'  # Christmas
    $InputDateString = $InputDate.ToString('MM/dd/yyyy')
    foreach ($Holiday in $Holidays) {
        if ($Holiday -eq $InputDateString) {
            return $true
        }
    }
    return $false
}

# function below is used to determine whether the input date is weekday
function IsWeekday([DateTime]$InputDate) {
    $DayOfWeek = $InputDate.DayOfWeek
    if ($DayOfWeek -eq 'Saturday' -or $DayOfWeek -eq 'Sunday') {
        return $false
    }
    return $true
}

# function below finds the previous business day recursively
function FindPreviousBusinessDay([DateTime]$InputDate) {
    # Base case
    if (IsWeekday -InputDate $InputDate -and !(IsHoliday -InputDate $InputDate)) {
        return $InputDate
    }
    # Recursive call
    FindPreviousBusinessDay($InputDate.AddDays(-1))
}

<#
Example Scenario
Powershell should show a popup message on 15th and the last day of every month, only if it is a business day.
If not, Powershell should show a popup message on the previous business day.
#>
$InputDate = Get-Date '05/31/2021' # Get today's date
$TargetDay = 15 # By default, we set the target day to the 15th
if ($InputDate.Day -gt 15) { # If today's date is after the 15th
    $TargetDay = [DateTime]::DaysInMonth($InputDate.Year, $InputDate.Month) # Set target day to the last day of the month
}
$TargetDate = Get-Date "$($InputDate.Month)/$($TargetDay)/$($InputDate.Year)" # Construct the target date to be in the format of MM/DD/YYYY
$ScheduledDate = FindPreviousBusinessDay -InputDate $TargetDate # Find the pevious business day
if ($ScheduledDate -eq $InputDate) { # If today is the scheduled day
    $Wshell = New-Object -ComObject Wscript.Shell # Creating a shell object
    $Subject = "Your task is due on $($ScheduledDate.ToString('MM/dd/yyyy')) (today)" # Setting the message
    $Wshell.Popup("$Subject", 600, "Reminder", 64) # Show the popup
}