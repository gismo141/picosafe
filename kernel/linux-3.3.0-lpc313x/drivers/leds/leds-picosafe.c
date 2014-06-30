/*
 * LEDs driver for picosafe net48xx
 *
 * Copyright (C) 2012 Michael Hartmann <hartmann@embedded-projects.net>
 *
 * Based on leds-net48xx.c
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 2 as
 * published by the Free Software Foundation.
 */

#include <linux/kernel.h>
#include <linux/init.h>
#include <linux/platform_device.h>
#include <linux/leds.h>
#include <linux/err.h>
#include <asm/io.h>
#include <linux/nsc_gpio.h>
#include <linux/scx200_gpio.h>
#include <linux/module.h>

#define DRVNAME "picosafe-led"
#define PICOSAFE_LED_GPIO	(1<<3)

static struct platform_device *pdev;

static void picosafe_led_set(struct led_classdev *led_cdev,
		enum led_brightness value)
{
  if(value)
    GPIO_OUT_HIGH(IOCONF_GPIO, PICOSAFE_LED_GPIO);
  else
    GPIO_OUT_LOW (IOCONF_GPIO, PICOSAFE_LED_GPIO);
}

static struct led_classdev picosafe_led = {
	.name		        = "picosafe::blue",
	.brightness_set	= picosafe_led_set,
	.flags		      = LED_CORE_SUSPENDRESUME,
};

static int picosafe_led_probe(struct platform_device *pdev)
{
	return led_classdev_register(&pdev->dev, &picosafe_led);
}

static int picosafe_led_remove(struct platform_device *pdev)
{
	led_classdev_unregister(&picosafe_led);
	return 0;
}

static struct platform_driver picosafe_led_driver = {
	.probe		= picosafe_led_probe,
	.remove		= picosafe_led_remove,
	.driver		= {
		.name		= DRVNAME,
		.owner		= THIS_MODULE,
	},
};

static int __init picosafe_led_init(void)
{
	int ret;

	ret = platform_driver_register(&picosafe_led_driver);
	if (ret < 0)
		goto out;

	pdev = platform_device_register_simple(DRVNAME, -1, NULL, 0);
	if (IS_ERR(pdev)) {
		ret = PTR_ERR(pdev);
		platform_driver_unregister(&picosafe_led_driver);
		goto out;
	}

out:
	return ret;
}

static void __exit picosafe_led_exit(void)
{
	platform_device_unregister(pdev);
	platform_driver_unregister(&picosafe_led_driver);
}

module_init(picosafe_led_init);
module_exit(picosafe_led_exit);

MODULE_AUTHOR("Michael Hartmann <hartmann@embedded-projects.net>");
MODULE_DESCRIPTION("picosafe LED driver");
MODULE_LICENSE("GPL");

