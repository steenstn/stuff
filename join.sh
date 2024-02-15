#!/bin/bash
# Uses ical-buddy to find the next upcoming event in the calendar and opens the google meet link contained in the description

meeting_title=$(icalBuddy -n -li 1 -b "" -iep title eventsToday)
meeting_link=$(icalBuddy -n -li 1 eventsToday | grep -o "https://meet.google.com/\w.*-\w.*-\w.")

if [[ -z "${meeting_link}" ]]; then
  meeting_link=$(icalBuddy -n -li 1 eventsToday | grep -o "https://wedbush.zoom.us/[^\s]/\d*" | head -1)
fi

echo "Joining ${meeting_title} at ${meeting_link}"

open ${meeting_link}
