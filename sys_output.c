/*
 * sys_output.c
 *
 * Code generation for function 'sys_output'
 *
 */

/* Include files */

#include "sys_output.h"

/* Function Definitions */
void sys_output(double xp[6], double xd[4], const double Ap[36],
                const double Bp[6], const double Cp[6], double Dp, const double
                Apd[16], const double Bpd[4], const double Cpd[4], double Dpd,
                double u, double *Yp, double Xp[6], double Xd[4])
{
  double d0;
  int i0;
  double d1;
  int i1;
  d0 = 0.0;
  for (i0 = 0; i0 < 6; i0++) {
    d0 += Cp[i0] * xp[i0];
  }

  d1 = 0.0;
  for (i0 = 0; i0 < 4; i0++) {
    d1 += Cpd[i0] * xd[i0];
  }

  *Yp = (d0 + Dp * u) - 0.25 * (d1 + Dpd * u);
  for (i0 = 0; i0 < 6; i0++) {
    d0 = 0.0;
    for (i1 = 0; i1 < 6; i1++) {
      d0 += Ap[i0 + 6 * i1] * xp[i1];
    }

    Xp[i0] = d0 + Bp[i0] * u;
  }

  for (i0 = 0; i0 < 4; i0++) {
    d0 = 0.0;
    for (i1 = 0; i1 < 4; i1++) {
      d0 += Apd[i0 + (i1 << 2)] * xd[i1];
    }

    Xd[i0] = d0 + Bpd[i0] * u;
  }
}

/* End of code generation (sys_output.c) */

