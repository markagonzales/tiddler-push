## Setup

Copy `./jobs/tiddler-tracker.plist` into `~/Library/LaunchAgents/tiddler-tracker.plist`.
Copy `./scripts/tiddler-git-push.sh` into `~/bin/`. Run `chmod +x ~/bin/tiddler-git-push.sh`.

Edit `~/Library/LaunchAgents/tiddler-tracker.plist`, find the value field associated with `WorkingDirectory` and fill in whatever path to the tiddler files.

Run the following commands once the `.plist` is in place

```bash
launchctl load ~/Library/LaunchAgents/tiddler-tracker.plist # runs when the computer is rebooted
launchctl start private.tiddler-tracker # starts the job before a reboot happens
```

In MacOS 11.7, you'll need to allow full disk access to `/bin/bash` as well.

1. Select System Preferences->Security & Privacy->Full Disk Access
2. Click the lock to make changes
3. Click '+'
4. Press 'cmd + Shift + .' to show hidden files
5. select /bin/bash


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
