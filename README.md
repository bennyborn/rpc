# Raspberry PI Surveillance CAM

## Initial Setup

1. Clone this repository into your users home directory with the name `rpc` e.g `git clone https://github.com/bennyborn/rpc.git ~/rpc/`
2. Create a copy of `.rpc_config.sample` in your users home directory and rename it to `.rpc_config`
3. Make all necessary scripts executable e.g. `chmod +x ~/rpc/capture.sh`

## Running scripts

Simplest way is to create a Cronjob for each .sh file needed e.g.

```crontab
* * * * *    ~/rpc/capture.sh >/dev/null 2>&1
0 */2 * * *  ~/rpc/upload.sh  >/dev/null 2>&1
```
