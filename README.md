# Concurrent Workers
This project is a setup for long-lasting API calls where every call spins up a new worker, does some work, and returns a value which kills the worker

This will eventually be used to analyze large datasets with many concurrent users to avoid slowdown and starting each worker as it's own asynchronous process.

Currently it's infintely scalable which also means it's still vulnerable.

Not yet recommended to use in a prod application

# TODO's
1. Write Tests
2. Create a scheduler
3. Create a queueing system
4. Limit the amount of workers
