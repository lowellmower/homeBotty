### Documentation and Information
This section serves as a place to collect and document usages and
other helpful pieces of interacting with homeBotty.

### Getting Started with a New Sonoff


### Debugging and Gotchas
Sonoff switch running tasmota is not logging to centralized syslog but seems to
except commands.
- Try resetting the log configs via the web interface
- Try restarting the web server with saved configuration
```
# from with in the LAN send params
# Restart=1
curl -v http://{LAN_ADDR_FOR_DEVICE}/cm?cmnd=Restart%201
```
If the above does not prevail, rebuild the module and rejoin the `LAN`:
- Hold sonoff switch button for 4+ seconds until restart
- Wait for consistent green blinking then press button rapidly 4 times to start
the web server
- Connect to sonoff device in listed wifi networks
- Once connected to device, proceed to `192.168.4.1`
- Rebuild desired configuration. Note that if emulation is selected, you will
will have to reset logging configuration after the reboot.
