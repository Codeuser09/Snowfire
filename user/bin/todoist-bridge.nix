{ pkgs, userSettings, ... }:
let myScript = ''
# Function to check for tasks and send notification
check_tasks() {
    # Get the current date in the desired format
    current_date=$(date +"%y/%m/%d(%a) %H:%M")

    # Fetch the list of tasks from Todoist
    tasks=$(todoist sync && todoist list)

    # Check if the current date is present in the tasks list
    if echo "$tasks" | grep "$current_date"; then
        # Send a notification
        task=$(echo "$tasks" | grep "$current_date" | cut -d '#' -f2)
        notify-send "$task"
        mpv ~/Apple-Pay-Success-Sound-Effect-_l3Jvigvxsvc_.mp3
    fi
}

# Infinite loop to run the check every second
if date +%M | grep '00'; then
  sleep 1
fi
while true; do

    check_tasks
    sleep 60
done
    '';
in
{
  home.packages = [
    (pkgs.writeScriptBin "todoist-bridge" myScript)
  ];
}
