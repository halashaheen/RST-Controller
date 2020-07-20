#include "coeff.h"
#include "sys_output.h"
#include "uart.h"
#define spaces 10
int main()
 {   UART0_INIT();
     int leng=0,isfloating=0,loop_space=0;
     double Xp[6]={0},Xd[4]={0},y=0,yc=0;
     double Xc[6]={0},Xcd[4]={0},Ts=0.1;
     int i=1,j=0;
     for(;i<20;i++)
     {
         sys_output(xp,xd,A_p, B_p, C_p, D_p, A_pd, B_pd, C_pd, D_pd,u,&y,Xp,Xd);
         sys_output(xc,xcd,A_c, B_c, C_c, D_c, A_cd, B_cd, C_cd, D_cd,u,&yc,Xc,Xcd);
         UART0Tx_str("K= ");
         UART0Tx_num(i);
         if(i<10){UART0TX_space();}
         UART0TX_space();
         UART0TX_space();
         UART0Tx_str("t= ");
         UART_sendFloatNumber(i*Ts,&leng,&isfloating);
         if(isfloating){loop_space=leng+4;}
         else{loop_space=leng;}
         for(j=0;j<spaces-loop_space;j++){UART0TX_space();}
         UART0Tx_str("plant output = ");
         UART_sendFloatNumber(y,&leng,&isfloating);
         if(isfloating){loop_space=leng+4;}
         else{loop_space=leng;}
         for(j=0;j<spaces-loop_space;j++){UART0TX_space();}
         UART0Tx_str("control signal = ");
         UART_sendFloatNumber(yc,&leng,&isfloating);
         UART0TX_newLine();
         for(j=0;j<6;j++){xp[j]=Xp[j];}
         for(j=0;j<4;j++){xd[j]=Xd[j];}
         for(j=0;j<6;j++){xc[j]=Xc[j];}
         for(j=0;j<4;j++){xcd[j]=Xcd[j];}
     }
         return 0;
 }
