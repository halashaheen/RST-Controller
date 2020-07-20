/*
 * main.c
 *
 * Code generation for function 'main'
 *
 */

/*************************************************************************/
/* This automatically generated example C main file shows how to call    */
/* entry-point functions that MATLAB Coder generated. You must customize */
/* this file for your application. Do not modify this file directly.     */
/* Instead, make a copy of this file, modify it, and integrate it into   */
/* your development environment.                                         */
/*                                                                       */
/* This file initializes entry-point function arguments to a default     */
/* size and value before calling the entry-point functions. It does      */
/* not store or use any values returned from the entry-point functions.  */
/* If necessary, it does pre-allocate memory for returned values.        */
/* You can use this file as a starting point for a main function that    */
/* you can deploy in your application.                                   */
/*                                                                       */
/* After you copy the file, and before you deploy it, you must make the  */
/* following changes:                                                    */
/* * For variable-size function arguments, change the example sizes to   */
/* the sizes that your application requires.                             */
/* * Change the example values of function arguments to the values that  */
/* your application requires.                                            */
/* * If the entry-point functions return values, store these values or   */
/* otherwise use them as required by your application.                   */
/*                                                                       */
/*************************************************************************/
/* Include files */
#include "rt_nonfinite.h"
#include "sys_output.h"
#include "main.h"
#include "sys_output_terminate.h"
#include "sys_output_initialize.h"

/* Function Declarations */
static void argInit_1x4_real_T(double result[4]);
static void argInit_1x6_real_T(double result[6]);
static void argInit_4x1_real_T(double result[4]);
static void argInit_4x4_real_T(double result[16]);
static void argInit_6x1_real_T(double result[6]);
static void argInit_6x6_real_T(double result[36]);
static double argInit_real_T(void);
static void main_sys_output(void);

/* Function Definitions */
static void argInit_1x4_real_T(double result[4])
{
  int idx1;

  /* Loop over the array to initialize each element. */
  for (idx1 = 0; idx1 < 4; idx1++) {
    /* Set the value of the array element.
       Change this value to the value that the application requires. */
    result[idx1] = argInit_real_T();
  }
}

static void argInit_1x6_real_T(double result[6])
{
  int idx1;

  /* Loop over the array to initialize each element. */
  for (idx1 = 0; idx1 < 6; idx1++) {
    /* Set the value of the array element.
       Change this value to the value that the application requires. */
    result[idx1] = argInit_real_T();
  }
}

static void argInit_4x1_real_T(double result[4])
{
  int idx0;

  /* Loop over the array to initialize each element. */
  for (idx0 = 0; idx0 < 4; idx0++) {
    /* Set the value of the array element.
       Change this value to the value that the application requires. */
    result[idx0] = argInit_real_T();
  }
}

static void argInit_4x4_real_T(double result[16])
{
  int idx0;
  int idx1;

  /* Loop over the array to initialize each element. */
  for (idx0 = 0; idx0 < 4; idx0++) {
    for (idx1 = 0; idx1 < 4; idx1++) {
      /* Set the value of the array element.
         Change this value to the value that the application requires. */
      result[idx0 + (idx1 << 2)] = argInit_real_T();
    }
  }
}

static void argInit_6x1_real_T(double result[6])
{
  int idx0;

  /* Loop over the array to initialize each element. */
  for (idx0 = 0; idx0 < 6; idx0++) {
    /* Set the value of the array element.
       Change this value to the value that the application requires. */
    result[idx0] = argInit_real_T();
  }
}

static void argInit_6x6_real_T(double result[36])
{
  int idx0;
  int idx1;

  /* Loop over the array to initialize each element. */
  for (idx0 = 0; idx0 < 6; idx0++) {
    for (idx1 = 0; idx1 < 6; idx1++) {
      /* Set the value of the array element.
         Change this value to the value that the application requires. */
      result[idx0 + 6 * idx1] = argInit_real_T();
    }
  }
}

static double argInit_real_T(void)
{
  return 0.0;
}

static void main_sys_output(void)
{
  double dv0[6];
  double dv1[4];
  double dv2[36];
  double dv3[6];
  double dv4[6];
  double dv5[16];
  double dv6[4];
  double dv7[4];
  double Yp;
  double Xp[6];
  double Xd[4];

  /* Initialize function 'sys_output' input arguments. */
  /* Initialize function input argument 'xp'. */
  /* Initialize function input argument 'xd'. */
  /* Initialize function input argument 'Ap'. */
  /* Initialize function input argument 'Bp'. */
  /* Initialize function input argument 'Cp'. */
  /* Initialize function input argument 'Apd'. */
  /* Initialize function input argument 'Bpd'. */
  /* Initialize function input argument 'Cpd'. */
  /* Call the entry-point 'sys_output'. */
  argInit_6x1_real_T(dv0);
  argInit_4x1_real_T(dv1);
  argInit_6x6_real_T(dv2);
  argInit_6x1_real_T(dv3);
  argInit_1x6_real_T(dv4);
  argInit_4x4_real_T(dv5);
  argInit_4x1_real_T(dv6);
  argInit_1x4_real_T(dv7);
  sys_output(dv0, dv1, dv2, dv3, dv4, argInit_real_T(), dv5, dv6, dv7,
             argInit_real_T(), argInit_real_T(), &Yp, Xp, Xd);
}

int main(int argc, const char * const argv[])
{
  (void)argc;
  (void)argv;

  /* Initialize the application.
     You do not need to do this more than one time. */
  sys_output_initialize();

  /* Invoke the entry-point functions.
     You can call entry-point functions multiple times. */
  main_sys_output();

  /* Terminate the application.
     You do not need to do this more than one time. */
  sys_output_terminate();
  return 0;
}

/* End of code generation (main.c) */
