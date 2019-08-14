# Raspberry PI Surveillance CAM



####Initial Setup

Create a copy of `.rpc_config.sample` in your users home directory and rename it to `.rpc_config`



####Running scripts

Simplest way is to create a Cronjob for each .sh file needed e.g.

```crontab
* * * * *    ~/rpc/capture.sh >/dev/null 2>&1
0 */2 * * *  ~/rpc/upload.sh  >/dev/null 2>&1
```
