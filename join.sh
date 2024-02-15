#!/bin/bash
# Uses ical-buddy to find the next upcoming event in the calendar and opens the google meet link contained in the description

open $(icalBuddy -n -li 1 eventsToday | grep "https://meet.google.com/\w.*-\w.*-\w.*" | sed 's/^.*https/https/')
