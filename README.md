## Launchd

List jobs being managed by launchd. The list subcommand can display specific jobs as well

```bash
launchctl list private.tiddler-tracker
```

There is a convention to plist files that schedule these jobs. Their location on the disk determines if they run as a Daemon or an Agent. As stated in this [helpful website](https://www.launchd.info/), "The main difference is that an agent is run on behalf of the logged in user while a daemon runs on behalf of the root user or any user you specify with the UserName key."

"Load" a job to start it

```bash
launchctl load ~/Library/LaunchAgents/tiddler-tracker.plist
```

Be sure to place the plist file before loading it.

## References

https://www.launchd.info/
