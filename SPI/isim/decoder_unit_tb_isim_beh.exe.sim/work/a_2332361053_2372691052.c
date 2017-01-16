/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/jorge/Desktop/TrabajoSED/SPI/decoder_unit_tb.vhd";



static void work_a_2332361053_2372691052_p_0(char *t0)
{
    char *t1;
    char *t2;
    int t3;
    char *t4;
    int t5;
    int t6;
    char *t7;
    char *t8;
    int t9;
    int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    int64 t21;
    unsigned char t22;
    unsigned int t23;

LAB0:    t1 = (t0 + 2472U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(68, ng0);
    if (0 > 3)
        goto LAB8;

LAB9:    if (1 == -1)
        goto LAB13;

LAB14:    t3 = 3;

LAB10:    t2 = (t0 + 5312);
    *((int *)t2) = 0;
    t4 = (t0 + 5316);
    *((int *)t4) = t3;
    t5 = 0;
    t6 = t3;

LAB4:    if (t5 <= t6)
        goto LAB5;

LAB7:    xsi_set_current_line(76, ng0);
    if ((unsigned char)0 == 0)
        goto LAB28;

LAB29:    goto LAB2;

LAB5:    xsi_set_current_line(69, ng0);
    t7 = (t0 + 1488U);
    t8 = *((char **)t7);
    t7 = (t0 + 5312);
    t9 = *((int *)t7);
    t10 = (t9 - 0);
    t11 = (t10 * 1);
    xsi_vhdl_check_range_of_index(0, 3, 1, *((int *)t7));
    t12 = (16U * t11);
    t13 = (0 + t12);
    t14 = (t13 + 0U);
    t15 = (t8 + t14);
    t16 = (t0 + 2856);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    memcpy(t20, t15, 2U);
    xsi_driver_first_trans_fast(t16);
    xsi_set_current_line(70, ng0);
    t21 = (20 * 1000LL);
    t2 = (t0 + 2280);
    xsi_process_wait(t2, t21);

LAB17:    *((char **)t1) = &&LAB18;

LAB1:    return;
LAB6:    t2 = (t0 + 5312);
    t5 = *((int *)t2);
    t4 = (t0 + 5316);
    t6 = *((int *)t4);
    if (t5 == t6)
        goto LAB7;

LAB27:    t3 = (t5 + 1);
    t5 = t3;
    t7 = (t0 + 5312);
    *((int *)t7) = t5;
    goto LAB4;

LAB8:    if (1 == 1)
        goto LAB11;

LAB12:    t3 = 0;
    goto LAB10;

LAB11:    t3 = 3;
    goto LAB10;

LAB13:    t3 = 0;
    goto LAB10;

LAB15:    xsi_set_current_line(71, ng0);
    t2 = (t0 + 1192U);
    t4 = *((char **)t2);
    t2 = (t0 + 1488U);
    t7 = *((char **)t2);
    t2 = (t0 + 5312);
    t3 = *((int *)t2);
    t9 = (t3 - 0);
    t11 = (t9 * 1);
    xsi_vhdl_check_range_of_index(0, 3, 1, *((int *)t2));
    t12 = (16U * t11);
    t13 = (0 + t12);
    t14 = (t13 + 2U);
    t8 = (t7 + t14);
    t22 = 1;
    if (8U == 8U)
        goto LAB21;

LAB22:    t22 = 0;

LAB23:    if (t22 == 0)
        goto LAB19;

LAB20:    goto LAB6;

LAB16:    goto LAB15;

LAB18:    goto LAB16;

LAB19:    t17 = (t0 + 5320);
    xsi_report(t17, 18U, (unsigned char)3);
    goto LAB20;

LAB21:    t23 = 0;

LAB24:    if (t23 < 8U)
        goto LAB25;
    else
        goto LAB23;

LAB25:    t15 = (t4 + t23);
    t16 = (t8 + t23);
    if (*((unsigned char *)t15) != *((unsigned char *)t16))
        goto LAB22;

LAB26:    t23 = (t23 + 1);
    goto LAB24;

LAB28:    t2 = (t0 + 5338);
    xsi_report(t2, 37U, (unsigned char)3);
    goto LAB29;

}


extern void work_a_2332361053_2372691052_init()
{
	static char *pe[] = {(void *)work_a_2332361053_2372691052_p_0};
	xsi_register_didat("work_a_2332361053_2372691052", "isim/decoder_unit_tb_isim_beh.exe.sim/work/a_2332361053_2372691052.didat");
	xsi_register_executes(pe);
}
