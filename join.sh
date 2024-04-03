#!/bin/bash
# Uses ical-buddy to find the next upcoming event in the calendar and opens the meeting link contained in the description
# Searches for a Google/Zoom link and opens it

meeting_title=$(icalBuddy -n -li 1 -b "" -ea -iep title eventsToday)
meeting_link=$(icalBuddy -n -li 1 -ea eventsToday | grep -o "https://meet.google.com/\w.*-\w.*-\w.*" | head -1)

if [[ -z "${meeting_link}" ]]; then
  meeting_link=$(icalBuddy -n -li 1 -ea eventsToday | grep -o "https://wedbush.zoom.us/[^\s]/\d*" | head -1)
fi

if [[ -z "${meeting_link}" ]]; then
  echo "No meeting link found to join"
else
  echo "Joining ${meeting_title} at ${meeting_link}"
  open ${meeting_link}
fi
