# For Linux Mint/Ubuntu

* Go through <https://tinyfpga.com/bx/guide.html>. Essentiall this:
    * `pip install apio==0.4.0b5 tinyprog`
    * `apio install system scons icestorm iverilog`
    * `apio drivers --serial-enable`
* `sudo usermod -a -G dialout $USER`
* `./build.sh`
* Put this in `/etc/udev/rules.d/98-tinyfpga.rules`:

  ```
  SUBSYSTEM=="usb", ATTRS{idVendor}=="1209", ATTRS{idProduct}=="2100", MODE="0666"
  SUBSYSTEM=="usb-device", ATTRS{idVendor}=="1209", ATTRS{idProduct}=="2100", MODE="0666"
  ```

* `sudo udevadm control --reload-rules`
* Then as per [this thread](https://discourse.tinyfpga.com/t/bx-error-device-reports-readiness-to-read-but-returned-no-data-solved/492/10) get rid of `modemmanager` if it's installed:

  ```bash
  sudo apt-get purge modemmanager
  ```

  This fixes issues disconnection issues.

* Then reboot
