/*
 * Based on the driver of Deepak Saxena <dsaxena@plexity.net>
 * (drivers/char/hw_random/ixp4xx-rng.c).
 *
 * RNG driver for LPC314x
 *
 * Author: Michael Hartmann <hartmann@speicherleck.de>
 *
 * Copyright 2012 (c) Embedded Projects GmbH
 *
 * This file is licensed under  the terms of the GNU General Public
 * License version 2. This program is licensed "as is" without any
 * warranty of any kind, whether express or implied.
 */

#include <linux/kernel.h>
#include <linux/types.h>
#include <linux/module.h>
#include <linux/moduleparam.h>
#include <linux/init.h>
#include <linux/bitops.h>
#include <linux/hw_random.h>

#include <asm/io.h>
#include <mach/hardware.h>

#define LPC314x_RNG_ADDR      (0x13006000)
#define LPC314x_RNG_POWERDOWN (0x13006FF4)
#define LPC314x_RING_OSC_CFG  (0x13002814)

/* read 4 bytes of the RNG */
static int lpc314x_rng_read(struct hwrng *rng, u32 *buffer)
{
  void __iomem *rng_base = (void __iomem *)rng->priv;

  *buffer = __raw_readl(rng_base);

  return 4;
}

static struct hwrng lpc314x_rng_ops = {
  .name      = "lpc314x",
  .data_read = lpc314x_rng_read,
};

static int __init lpc314x_rng_init(void)
{
  void __iomem *rng_base;
  int err;

  /* enable the RNG_PCLK clock via the cgu */
  cgu_clk_en_dis(CGU_SB_RNG_PCLK_ID, 1);

  /* enable both ring oscillator clocks */
  {
    void __iomem *ring_osc;

    if(!(ring_osc = ioremap(LPC314x_RING_OSC_CFG, 4)))
      return -ENOMEM;

    __raw_writel(0x03, ring_osc); // switch ring osc on
    iounmap(ring_osc);
  }

  /* set the POWERDOWN bit to 0 */
  {
    void __iomem *rng_powerdown;

    if(!(rng_powerdown = ioremap(LPC314x_RNG_POWERDOWN, 4)))
      return -ENOMEM;

    __raw_writel(0x00, rng_powerdown);
    iounmap(rng_powerdown);
  }

  if(!(rng_base = ioremap(LPC314x_RNG_ADDR, 4)))
    return -ENOMEM;

  lpc314x_rng_ops.priv = (unsigned long)rng_base;
  if((err = hwrng_register(&lpc314x_rng_ops)))
    iounmap(rng_base);

  return err;
}

static void __exit lpc314x_rng_exit(void)
{
  void __iomem * rng_base = (void __iomem *)lpc314x_rng_ops.priv;

  hwrng_unregister(&lpc314x_rng_ops);
  iounmap(rng_base);

  // switch off ANALOG_CLK_RNG[0], ANALOG_CLK_RNG[1], RNG_PCLK
  {
    void __iomem *ring_osc;

    // switch off the RNG clock via the CGU
    cgu_clk_en_dis(CGU_SB_RNG_PCLK_ID, 0);

    //  Switch off the Ring Oscillators' clocks
    if((ring_osc = ioremap(LPC314x_RING_OSC_CFG, 4)))
    {
      __raw_writel(0x00, ring_osc); // switch ring osc off
      iounmap(ring_osc);
    }
    else
      printk("Can't switch off clocks\n");
  }
}

module_init(lpc314x_rng_init);
module_exit(lpc314x_rng_exit);

MODULE_AUTHOR("Michael Hartmann <hartmann@embedded-projects.net>");
MODULE_DESCRIPTION("H/W Random Number Generator (RNG) driver for LPC314x");
MODULE_LICENSE("GPL");
