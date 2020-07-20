/*
 * _coder_sys_output_api.h
 *
 * Code generation for function '_coder_sys_output_api'
 *
 */

#ifndef _CODER_SYS_OUTPUT_API_H
#define _CODER_SYS_OUTPUT_API_H

/* Include files */
#include "tmwtypes.h"
#include "mex.h"
#include "emlrt.h"
#include <stddef.h>
#include <stdlib.h>
#include "_coder_sys_output_api.h"

/* Variable Declarations */
extern emlrtCTX emlrtRootTLSGlobal;
extern emlrtContext emlrtContextGlobal;

/* Function Declarations */
extern void sys_output(real_T xp[6], real_T xd[4], real_T Ap[36], real_T Bp[6],
  real_T Cp[6], real_T Dp, real_T Apd[16], real_T Bpd[4], real_T Cpd[4], real_T
  Dpd, real_T u, real_T *Yp, real_T Xp[6], real_T Xd[4]);
extern void sys_output_api(const mxArray * const prhs[11], int32_T nlhs, const
  mxArray *plhs[3]);
extern void sys_output_atexit(void);
extern void sys_output_initialize(void);
extern void sys_output_terminate(void);
extern void sys_output_xil_terminate(void);

#endif

/* End of code generation (_coder_sys_output_api.h) */
