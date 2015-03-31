# Deploytron

One click deployment? Hell no, we want one button deployment.
The [dream cheeky](http://dreamcheeky.com/big-red-button) USB button is neat. Let's deploy sites with it. This project is an example of how you might be able to do it.

## Usage

You need to create some rules for what your deployment looks like. Currently this is done in an amazing shell script: https://github.com/arthur24b6/deploytron/blob/master/deployment-script.sh#L18 You have all the bounty that the shell offers you.

Start the deamon:
```
ruby deployment-controler.rb start
```

You can monitor deployment progress with the deployment logs:
```
tail -f logs/log
```

## Install

Clone this repository and then build it:

```
bundle install --path vender/bundle
```

You may need to a bunch of work to get the pieces in place that are required to read data from the USB button. You should review https://github.com/derrick/dream_cheeky/blob/master/README.md however:
* OSX seems to work pretty much out of the box.
* On linux (specifically I tested this on raspbian) a udev rule was needed: Create a file named 99-dream_cheeky.rules in /etc/udev/rules.d :

```
echo 'SUBSYSTEM=="usb", ATTRS{idVendor}=="1d34", ATTRS{idProduct}=="000d", MODE="0666", GROUP="plugdev"' > 99-dream_cheeky.rules
sudo cp 99-dream_cheeky.rules /etc/udev/rules.d/99-dream_cheeky.rules

```

On linux you may find that you need some additional libraries:
```
sudo apt-get install ruby1.9.3 rubygems installruby-dev libusb-1.0-0-dev
```
was sufficient to get things running on raspbian.

![Deploy that thing](http://24b6.net/sites/default/files/deploy.jpg)
![![Deploy that thing](http://24b6.net/sites/default/files/deploy.jpg)](https://24b6.net/sites/default/files/deploytron.mp4)]

## Credits

Credit is due to [https://github.com/derrick/dream_cheeky/blob/master/README.md](https://github.com/derrick/dream_cheeky/blob/master/README.md). This is just a very simply overlay of that work.
