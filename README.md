# Powershell-Scripts
This is a repository containing PowerShell scripts that were created for my own use

# List of scripts
<div>
  <h3>
    <a href="https://github.com/yuyuanchan/Powershell-Scripts/blob/main/ReminderTimesheetSubmission.ps1">
      ReminderTimesheetSubmission.ps1
    </a>
  </h3>
  <h3>
    Use Case
  </h3>
  <p>
    As an employee, have you ever forgot to submit your timesheets on time? This script was created to solve the problem! With the help of Task Scheduler, Windows will reminds you to submit your timesheets on the day that they are due.
  </p>
  <p>
    <em>Note: This script was not designed and tested to suit every scenario. This script assumes that timesheets will need to be submitted on or before the 15th of every month, and on or before end of the every month.</em>
  </p>
  <h3>
    Setup Instructions
  </h3>
  <p>
    <ol>
      <li>
        Launch <strong>Task Scheduler</strong>, and click <strong>Create Basic Task...</strong>
      </li>
      <li>
        Enter the name into the <strong>Name</strong> field, and click <strong>Next</strong>
      </li>
      <li>
        In the <strong>Trigger</strong> section, select the <strong>Daily</strong>, and click <strong>Next</strong>
      </li>
      <li>
        Specify the time when you want the script to execute, then click <strong>Next</strong>
      </li>
      <li>
        In the <strong>Action</strong> section, select the <strong>Start a program</strong>, and click <strong>Next</strong>
      </li>
      <li>
        Click <strong>Browse...</strong> section, select the PowerShell script, and click <strong>Next</strong>
      </li>
      <li>
        Click <strong>Finish</strong>, and the script should now execute on the specified trigger and show a reminder notification if it meets the condition mentioned in the Use Case section
      </li>
    </ol>
  </p>
</div>
<hr>
