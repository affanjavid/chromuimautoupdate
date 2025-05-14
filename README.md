### Scheduling the Task in Windows
To set up this script as a scheduled task, follow these steps:

#### 1. Save the Script
1. Save the script as `ChromeUpdate.ps1` in a directory of your choice (e.g., `C:\Scripts\ChromeUpdate.ps1`).

#### 2. Open Task Scheduler
1. Press `Win + R`, type `taskschd.msc`, and press Enter to open the Task Scheduler.

#### 3. Create a New Task
1. Click **Create Task** in the right-hand panel.
2. In the **General** tab:
   - Enter a name for the task, e.g., `Chromium Auto Update`.
   - Select **Run whether user is logged on or not**.
   - Check **Run with highest privileges**.
3. In the **Triggers** tab:
   - Click **New** to create a trigger.
   - Select the desired schedule (e.g., Daily, Weekly, or At Startup).
   - Configure the time and frequency according to your requirements.
   - Click **OK**.
4. In the **Actions** tab:
   - Click **New** to create an action.
   - Select **Start a Program**.
   - In the `Program/script` field, type:
     ```
     powershell.exe
     ```
   - In the `Add arguments` field, type:
     ```
     -NoProfile -ExecutionPolicy Bypass -File "C:\Scripts\ChromeUpdate.ps1"
     ```
   - Click **OK**.
5. In the **Conditions** tab:
   - Adjust any additional conditions, such as ensuring the task runs even if the computer is on battery power.
6. In the **Settings** tab:
   - Ensure **Allow task to be run on demand** is checked.
   - Optionally, check **Run task as soon as possible after a scheduled start is missed**.

#### 4. Save and Test
1. Click **OK** to save the scheduled task.
2. Enter your administrative credentials if prompted.
3. Test the task by right-clicking it in the Task Scheduler and selecting **Run**.

### Notes
- Ensure that the PowerShell execution policy on your system allows scripts to run. You can bypass this restriction in the task setup (`-ExecutionPolicy Bypass`).
- Modify the schedule to meet your update frequency requirements (e.g., daily or weekly).

This will ensure that the script runs automatically at the defined schedule without manual intervention. Let me know if you need further assistance!
