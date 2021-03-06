/* linux/drivers/gpio/gpio-lpc313x.c
 *
 * Copyright (c) 2011 Jon Smirl <jonsmirl@gmail.com>
 * Modified for linux 3.x by Hans-Frieder Vogt <hfvogt@gmx.net>
 *
 * LPC313X GPIOlib support
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License.
*/

#include <linux/platform_device.h>
#include <linux/kernel.h>
#include <linux/init.h>
#include <linux/module.h>
#include <linux/device.h>
#include <linux/interrupt.h>
#include <linux/ioport.h>
#include <linux/io.h>
#include <linux/seq_file.h>

#include <mach/hardware.h>
#include <asm/irq.h>
#include <mach/gpio-lpc313x.h>

#undef USE_GPIO_NAMES

/**
 * struct lpc313x_gpio_chip - wrapper for specific implementation of gpio
 * @chip: The chip structure to be exported via gpiolib.
 * @base: The base pointer to the gpio configuration registers.
 * @config: special function and pull-resistor control information.
 * @pm_save: Save information for suspend/resume support.
 *
 * This wrapper provides the necessary information for the Samsung
 * specific gpios being registered with gpiolib.
 */
struct lpc313x_gpio_chip {
	struct gpio_chip	chip;
	const unsigned long 	regbase;
	const int		*events;
#ifdef CONFIG_PM
	u32			pm_save[4];
#endif
};

#define LPC313X_GPIO_CHIP(name, grp_regbase, grp_base, grp_no, grp_names, grp_evts) \
	{ \
	.chip	= {							\
		.label			= name,				\
		.owner			= THIS_MODULE,			\
		.base			= grp_base,			\
		.ngpio			= grp_no,			\
		.can_sleep		= 0,				\
		.request		= lpc313x_gpio_request,		\
		.free			= lpc313x_gpio_free,		\
		.direction_input	= lpc313x_gpio_direction_input,	\
		.direction_output	= lpc313x_gpio_direction_output,\
		.get			= lpc313x_gpio_get,		\
		.set			= lpc313x_gpio_set,		\
		.to_irq			= lpc313x_gpio_to_irq,		\
		.names			= grp_names,			\
	}, \
	.regbase = grp_regbase,						\
	.events	= grp_evts,						\
	}

#ifdef USE_GPIO_NAMES
static const char *gpio_pins_gpio_names[] = {
	"GPIO00", "GPIO01", "GPIO02", "GPIO03",
	"GPIO04", "-", "-", "-",
	"-", "-", "-", "GPIO11",
	"GPIO12", "GPIO13", "GPIO14", "GPIO15",
	"GPIO16", "GPIO17", "GPIO18", "GPIO19",
	"GPIO20"
};

static const char *gpio_pins_ebi_mci_names[] = {
	"mGPIO9", "mGPIO6", "mLCD_DB_7", "mLCD_DB_4",
	"mLCD_DB_2", "mNAND_RYBN0", "mI2STX_CLK0", "mI2STX_BCK0",
	"EBI_A_1_CLE", "EBI_NCAS_BLOUT_0", "mLCD_DB_0", "EBI_DQM_0_NOE",
	"mLCD_CSB", "mLCD_DB_1", "mLCD_E_RD", "mLCD_RS",
	"mLCD_RW_WR", "mLCD_DB_3", "mLCD_DB_5", "mLCD_DB_6",
	"mLCD_DB_8", "mLCD_DB_9", "mLCD_DB_10", "mLCD_DB_11",
	"mLCD_DB_12", "mLCD_DB_13", "mLCD_DB_14", "mLCD_DB_15",
	"mGPIO5", "mGPIO7", "mGPIO8", "mGPIO10"
};

static const char *gpio_pins_ebi_i2stx_0_names[] = {
	"mNAND_RYBN1", "mNAND_RYBN2", "mNAND_RYBN3", "mUART_CTS_N",
	"mUART_RTS_N", "mI2STX_DATA0", "mI2STX_WS0", "EBI_NRAS_BLOUT_1",
	"EBI_A_0_ALE", "EBI_NWE"
};

static const char *gpio_pins_cgu_names[] = {
	"CGU_SYSCLK_O"
};

static const char *gpio_pins_i2srx_0_names[] = {
	"I2SRX_BCK0", "I2SRX_DATA0", "I2SRX_WS0"
};

static const char *gpio_pins_i2srx_1_names[] = {
	"I2SRX_BCK1", "I2SRX_DATA1", "I2SRX_WS1"
};

static const char *gpio_pins_i2stx_1_names[] = {
	"I2STX_DATA1", "I2STX_BCK1", "I2STX_WS1", "I2STX_256FS_O"
};

static const char *gpio_pins_ebi_names[] = {
	"EBI_D_9", "EBI_D_10", "EBI_D_11", "EBI_D_12",
	"EBI_D_13", "EBI_D_14", "EBI_D_4", "EBI_D_0",
	"EBI_D_1", "EBI_D_2", "EBI_D_3", "EBI_D_5",
	"EBI_D_6", "EBI_D_7", "EBI_D_8", "EBI_D_15",
};

static const char *gpio_pins_i2c1_names[] = {
	"I2C_SDA1", "I2C_SCL1"
};

static const char *gpio_pins_spi_names[] = {
	"SPI_MISO", "SPI_MOSI", "SPI_CS_IN", "SPI_SCK",
	"SPI_CS_OUT0"
};

static const char *gpio_pins_nand_flash_names[] = {
	"NAND_NCS_3", "NAND_NCS_0", "NAND_NCS_1", "NAND_NCS_2"
};

static const char *gpio_pins_pwm_names[] = {
	"PWM_DATA"
};

static const char *gpio_pins_uart_names[] = {
	"UART_RXD", "UART_TXD"
};
#endif

static const int gpio_pins_gpio_events[] = {
	EVT_GPIO0, EVT_GPIO1, EVT_GPIO2, EVT_GPIO3,
	EVT_GPIO4, -1, -1, -1,
	-1, -1, -1, EVT_GPIO11,
	EVT_GPIO12, EVT_GPIO13, EVT_GPIO14, EVT_GPIO15,
	EVT_GPIO16, EVT_GPIO17, EVT_GPIO18, -1 /*EVT_GPIO19*/,
	-1 /*EVT_GPIO20*/
};

static const int gpio_pins_ebi_mci_events[] = {
	EVT_mGPIO9, EVT_mGPIO6, EVT_mLCD_DB_7, EVT_mLCD_DB_4,
	EVT_mLCD_DB_2, EVT_mNAND_RYBN0, EVT_mI2STX_CLK0, EVT_mI2STX_BCK0,
	EVT_EBI_A_1_CLE, EVT_EBI_NCAS_BLOUT_0, EVT_mLCD_DB_0, EVT_EBI_DQM_0_NOE,
	EVT_mLCD_CSB, EVT_mLCD_DB_1, EVT_mLCD_E_RD, EVT_mLCD_RS,
	EVT_mLCD_RW_WR, EVT_mLCD_DB_3, EVT_mLCD_DB_5, EVT_mLCD_DB_6,
	EVT_mLCD_DB_8, EVT_mLCD_DB_9, EVT_mLCD_DB_10, EVT_mLCD_DB_11,
	EVT_mLCD_DB_12, EVT_mLCD_DB_13, EVT_mLCD_DB_14, EVT_mLCD_DB_15,
	EVT_mGPIO5, EVT_mGPIO7, EVT_mGPIO8, EVT_mGPIO10
};

static const int gpio_pins_ebi_i2stx_0_events[] = {
	EVT_mNAND_RYBN1, EVT_mNAND_RYBN2, EVT_mNAND_RYBN3, EVT_mUART_CTS_N,
	EVT_mUART_RTS_N, EVT_mI2STX_DATA0, EVT_mI2STX_WS0, EVT_EBI_NRAS_BLOUT_1,
	EVT_EBI_A_0_ALE, EVT_EBI_NWE
};

static const int gpio_pins_spi_events[] = {
	EVT_SPI_MISO, EVT_SPI_MOSI, EVT_SPI_CS_IN, EVT_SPI_SCK,
	EVT_SPI_CS_OUT0
};

static const int gpio_pins_uart_events[] = {
	EVT_UART_RXD, EVT_UART_TXD
};

static inline struct lpc313x_gpio_chip *to_lpc313x_gpio(struct gpio_chip *gpc)
{
	return container_of(gpc, struct lpc313x_gpio_chip, chip);
}

static int lpc313x_gpio_request(struct gpio_chip *chip, unsigned offset)
{
	struct lpc313x_gpio_chip *pchip = to_lpc313x_gpio(chip);
	unsigned long flags;

	dev_dbg(chip->dev, "%s: base: 0x%08lx, offset: %u\n",
		__func__, pchip->regbase, offset);

	/* initially set the GPIO to input */
	raw_local_irq_save(flags);
	GPIO_IN(pchip->regbase, 1 << offset);
	raw_local_irq_restore(flags);

	return 0;
}

static void lpc313x_gpio_free(struct gpio_chip *chip, unsigned offset)
{
	struct lpc313x_gpio_chip *pchip = to_lpc313x_gpio(chip);
	unsigned long flags;

	dev_dbg(chip->dev, "%s: base: 0x%08lx, offset: %u\n",
		__func__, pchip->regbase, offset);

	/* set to default value */
	raw_local_irq_save(flags);
	GPIO_DRV_IP(pchip->regbase, 1 << offset);
	raw_local_irq_restore(flags);
}

static inline int lpc313x_gpio_direction_input(struct gpio_chip *chip,
	unsigned offset)
{
	struct lpc313x_gpio_chip *pchip = to_lpc313x_gpio(chip);
	unsigned long flags;

	dev_dbg(chip->dev, "%s: base: 0x%08lx, offset: %u\n",
		__func__, pchip->regbase, offset);

	raw_local_irq_save(flags);
	GPIO_IN(pchip->regbase, 1 << offset);
	raw_local_irq_restore(flags);

	return 0;
}

static inline int lpc313x_gpio_direction_output(struct gpio_chip *chip,
	unsigned offset, int value)
{
	struct lpc313x_gpio_chip *pchip = to_lpc313x_gpio(chip);
	unsigned long flags;

	dev_dbg(chip->dev, "%s: base: 0x%08lx, offset: %u, value: %d\n",
		__func__, pchip->regbase, offset, value);

	raw_local_irq_save(flags);
	if (value)
		GPIO_OUT_HIGH(pchip->regbase, 1 << offset);
	else
		GPIO_OUT_LOW(pchip->regbase, 1 << offset);
	raw_local_irq_restore(flags);

	return 0;
}

static inline int lpc313x_gpio_get(struct gpio_chip *chip, unsigned offset)
{
	struct lpc313x_gpio_chip *pchip = to_lpc313x_gpio(chip);

	return (GPIO_STATE(pchip->regbase) & (1 << offset));
}

static inline void lpc313x_gpio_set(struct gpio_chip *chip, unsigned offset,
	int value)
{
	struct lpc313x_gpio_chip *pchip = to_lpc313x_gpio(chip);
	unsigned long flags;

	raw_local_irq_save(flags);
	if (value)
		GPIO_OUT_HIGH(pchip->regbase, 1 << offset);
	else
		GPIO_OUT_LOW(pchip->regbase, 1 << offset);
	raw_local_irq_restore(flags);
}

static int lpc313x_gpio_to_irq(struct gpio_chip *chip, unsigned offset)
{
	struct lpc313x_gpio_chip *pchip = to_lpc313x_gpio(chip);

	dev_dbg(chip->dev, "%s: base: 0x%08lx, offset: %u\n",
		__func__, pchip->regbase, offset);
	if (pchip->events) {
		int event = pchip->events[offset];

		if (event >= 0) {
			return (event + NR_IRQ_CPU);
			/* In patch 0009... by Ingo Albrecht this is
			   IRQ_FOR_EVENT(event);    --hh */
		}
	}
	return -1;
}

static int lpc313x_gpio_request_p0(struct gpio_chip *chip, unsigned offset)
{
	int real_offset = gpio_pins_gpio_map[offset];

	if (real_offset >= 0)
		return lpc313x_gpio_request(chip, real_offset);
	else
		return -EINVAL;
}

static void lpc313x_gpio_free_p0(struct gpio_chip *chip, unsigned offset)
{
	int real_offset = gpio_pins_gpio_map[offset];

	if (real_offset >= 0)
		lpc313x_gpio_free(chip, real_offset);
}

static inline int lpc313x_gpio_direction_input_p0(struct gpio_chip *chip,
	unsigned offset)
{
	int real_offset = gpio_pins_gpio_map[offset];

	if (real_offset >= 0)
		return lpc313x_gpio_direction_input(chip, real_offset);
	else
		return -EINVAL;
}

static inline int lpc313x_gpio_direction_output_p0(struct gpio_chip *chip,
	unsigned offset, int value)
{
	int real_offset = gpio_pins_gpio_map[offset];

	if (real_offset >= 0)
		return lpc313x_gpio_direction_output(chip, real_offset, value);
	else
		return -EINVAL;
}

static inline int lpc313x_gpio_get_p0(struct gpio_chip *chip, unsigned offset)
{
	struct lpc313x_gpio_chip *pchip = to_lpc313x_gpio(chip);
	int real_offset = gpio_pins_gpio_map[offset];

	if (real_offset >= 0)
		return (GPIO_STATE(pchip->regbase) & (1 << real_offset));
	else
		return -EINVAL;
}

static inline void lpc313x_gpio_set_p0(struct gpio_chip *chip, unsigned offset,
	int value)
{
	struct lpc313x_gpio_chip *pchip = to_lpc313x_gpio(chip);
	unsigned long flags;
	int real_offset = gpio_pins_gpio_map[offset];

	raw_local_irq_save(flags);
	if (value)
		GPIO_OUT_HIGH(pchip->regbase, 1 << real_offset);
	else
		GPIO_OUT_LOW(pchip->regbase, 1 << real_offset);
	raw_local_irq_restore(flags);
}

static struct lpc313x_gpio_chip lpc313x_gpiochip[] = {
	{
	.chip	= {
		.label			= "GPIO",
		.owner			= THIS_MODULE,
		.base			= LPC313X_GPIO_GPIO_GRP,
		.ngpio			= LPC313X_GPIO_GPIO_MAX,
		.can_sleep		= 0,
		.request		= lpc313x_gpio_request_p0,
		.free			= lpc313x_gpio_free_p0,
		.direction_input	= lpc313x_gpio_direction_input_p0,
		.direction_output	= lpc313x_gpio_direction_output_p0,
		.get			= lpc313x_gpio_get_p0,
		.set			= lpc313x_gpio_set_p0,
		.to_irq			= lpc313x_gpio_to_irq,
#ifdef USE_GPIO_NAMES
		.names			= gpio_pins_gpio_names,
#endif
	},
	.regbase = IOCONF_GPIO,
	.events	= gpio_pins_gpio_events,
	},
	LPC313X_GPIO_CHIP(
		"EBI_MCI", IOCONF_EBI_MCI,
		LPC313X_GPIO_EBI_MCI_GRP, LPC313X_GPIO_EBI_MCI_MAX,
#ifdef USE_GPIO_NAMES
		gpio_pins_ebi_mci_names, gpio_pins_ebi_mci_events),
#else
		NULL, gpio_pins_ebi_mci_events),
#endif
	LPC313X_GPIO_CHIP(
		"EBI_I2STX_0", IOCONF_EBI_I2STX_0,
		LPC313X_GPIO_EBI_I2STX_0_GRP, LPC313X_GPIO_EBI_I2STX_0_MAX,
#ifdef USE_GPIO_NAMES
		gpio_pins_ebi_i2stx_0_names, gpio_pins_ebi_i2stx_0_events),
#else
		NULL, gpio_pins_ebi_i2stx_0_events),
#endif
	LPC313X_GPIO_CHIP(
		"CGU", IOCONF_CGU,
		LPC313X_GPIO_CGU_GRP, LPC313X_GPIO_CGU_MAX,
#ifdef USE_GPIO_NAMES
		gpio_pins_cgu_names, NULL),
#else
		NULL, NULL),
#endif
	LPC313X_GPIO_CHIP(
		"I2SRX_0", IOCONF_I2SRX_0,
		LPC313X_GPIO_I2SRX_0_GRP, LPC313X_GPIO_I2SRX_0_MAX,
#ifdef USE_GPIO_NAMES
		gpio_pins_i2srx_0_names, NULL),
#else
		NULL, NULL),
#endif
	LPC313X_GPIO_CHIP(
		"I2SRX_1", IOCONF_I2SRX_1,
		LPC313X_GPIO_I2SRX_1_GRP, LPC313X_GPIO_I2SRX_1_MAX,
#ifdef USE_GPIO_NAMES
		gpio_pins_i2srx_1_names, NULL),
#else
		NULL, NULL),
#endif
	LPC313X_GPIO_CHIP(
		"I2STX_1", IOCONF_I2STX_1,
		LPC313X_GPIO_I2STX_1_GRP, LPC313X_GPIO_I2STX_1_MAX,
#ifdef USE_GPIO_NAMES
		gpio_pins_i2stx_1_names, NULL),
#else
		NULL, NULL),
#endif
	LPC313X_GPIO_CHIP(
		"EBI", IOCONF_EBI,
		LPC313X_GPIO_EBI_GRP, LPC313X_GPIO_EBI_MAX,
#ifdef USE_GPIO_NAMES
		gpio_pins_ebi_names, NULL),
#else
		NULL, NULL),
#endif
	LPC313X_GPIO_CHIP(
		"I2C1", IOCONF_I2C1,
		LPC313X_GPIO_I2C1_GRP, LPC313X_GPIO_I2C1_MAX,
#ifdef USE_GPIO_NAMES
		gpio_pins_i2c1_names, NULL),
#else
		NULL, NULL),
#endif
	LPC313X_GPIO_CHIP(
		"SPI", IOCONF_SPI,
		LPC313X_GPIO_SPI_GRP, LPC313X_GPIO_SPI_MAX,
#ifdef USE_GPIO_NAMES
		gpio_pins_spi_names, gpio_pins_spi_events),
#else
		NULL, gpio_pins_spi_events),
#endif
	LPC313X_GPIO_CHIP(
		"NAND_CTRL", IOCONF_NAND_CTRL,
		LPC313X_GPIO_NAND_CTRL_GRP, LPC313X_GPIO_NAND_CTRL_MAX,
#ifdef USE_GPIO_NAMES
		gpio_pins_nand_flash_names, NULL),
#else
		NULL, NULL),
#endif
	LPC313X_GPIO_CHIP(
		"PWM", IOCONF_PWM,
		LPC313X_GPIO_PWM_GRP, LPC313X_GPIO_PWM_MAX,
#ifdef USE_GPIO_NAMES
		gpio_pins_pwm_names, NULL),
#else
		NULL, NULL),
#endif
	LPC313X_GPIO_CHIP(
		"UART", IOCONF_UART,
		LPC313X_GPIO_UART_GRP, LPC313X_GPIO_UART_MAX,
#ifdef USE_GPIO_NAMES
		gpio_pins_uart_names, gpio_pins_uart_events),
#else
		NULL, gpio_pins_uart_events),
#endif
};

static int __devinit lpc313x_gpio_probe(struct platform_device *pdev)
{
	struct resource *res;
	int i;

	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
	if (!res) {
		dev_err(&pdev->dev, "Missing MEM resource\n");
		return -ENODEV;
	}
	if (!devm_request_mem_region(&pdev->dev, res->start,
				     resource_size(res), pdev->name)) {
                dev_err(&pdev->dev,
                       "I/O region 0x%08x for GPIO already in use.\n",
                       res->start);
                return -EBUSY;
        }

	for (i = 0; i < ARRAY_SIZE(lpc313x_gpiochip); i++)
		gpiochip_add(&lpc313x_gpiochip[i].chip);

	return 0;
}

#ifdef CONFIG_OF
static const struct of_device_id lpc313x_gpio_of_match[] = {
        { .compatible = "nxp,lpc313x-gpio" },
        { },
};
MODULE_DEVICE_TABLE(of, lpc313x_gpio_of_match);
#endif

static struct platform_driver lpc313x_gpio_driver = {
	.driver		= {
		.name	= "lpc313x-gpio",
		.owner	= THIS_MODULE,
#ifdef CONFIG_OF
		.of_match_table	= lpc313x_gpio_of_match,
#endif
	},
	.probe		= lpc313x_gpio_probe,
};

static int __init lpc313x_gpio_init(void)
{
	return platform_driver_register(&lpc313x_gpio_driver);
}
postcore_initcall(lpc313x_gpio_init);
