#!/bin/bash

# Claude Process Monitor
# Automatically restarts Claude whenever the process terminates

echo "Starting Claude Process Monitor..."
echo "This script will restart Claude whenever it exits."
echo "Press Ctrl+C to stop monitoring."

while true; do
    echo "[$(date)] Starting Claude process..."
    
    # Run Claude and wait for it to complete
    claude -p "Read ai/CLAUDE.md, identify exactly what to do, append your working plan to ai/TODO.ai.md, and continue working" --dangerously-skip-permissions
    
    # Get the exit status
    EXIT_STATUS=$?
    
    echo "[$(date)] Claude process exited with status: $EXIT_STATUS"
    
    # Optional: Log the restart
    echo "[$(date)] Claude exited with status $EXIT_STATUS, restarting..." >> ai/claude_monitor.log
    
    # Wait a bit before restarting to avoid rapid restart loops
    echo "Waiting 15 mins before restart..."
    sleep 900
done