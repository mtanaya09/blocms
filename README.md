BLOCSM TUTURIAL REMINDERS:

NOTE:
Bloc Library
- powerful state management solution
- we use this to create blocs, cubits, states, events in order to dynamically change the ui based on every component

Hydrated bloc 
- state maintaning solution for Bloc Library
- we use this to internally export/import the state of a bloc or cubit

WARNING:
1. Never mutate existing states
    - you can access the existing state but never modify
2. Don't forget to mention your correct PROPS variable