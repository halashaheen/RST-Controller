% 
 function [c_r c_D U_r U_D]=calculate_CLTFs(B, A, R, S, T,Bm,Am)%r reference, c plant output, U control signal, D disturbance
%CALCULATE TFs:
%TRANSFER FUNCTIONS
%c/r=TB/(AS+BR)
%c/D=AS/(AS+BR)
%U/r=TA/(AS+BR)
%U/D=AR/(AS+BR)
track=filt(Bm, Am);
AS=conv(A, S);
BR=conv(B, R);

size_AS=size(AS);
size_BR=size(BR);
if size_AS(2)>size_BR(2)%AS longer than BR
    BR=padarray(BR', size_AS(2)-size_BR(2), 0, 'post')';
else
    if size_AS(2)<size_BR(2)%BR longer than AS
        AS=padarray(AS', size_BR(2)-size_AS(2), 0, 'post')';
    end
end


den=AS+BR;

%'c(z)/r(z):'
c_r=minreal(track*filt(conv(T, B), den));

%'Output sensitivity fn c(z)/D(z):'
c_D=minreal(filt(AS, den));

%'U(z)/r(z):'
U_r=minreal(track*filt(conv(T, A), den));

%'U(z)/D(z):'
U_D=minreal(filt(conv(A, -R), den));
%TRANSFER FUNCTIONS
% %c/r=TB/(AS+BR)
% %c/D=AS/(AS+BR)
% %U/r=TA/(AS+BR)
% %U/D=AR/(AS+BR)
% AS=conv(A, S);
% BR=conv(B, R);
% size_AS=size(AS);
% size_BR=size(BR);
% if size_AS(2)>size_BR(2)%AS longer than BR
%     BR=padarray(BR', size_AS(2)-size_BR(2), 0, 'post')';
% else
%     if size_AS(2)<size_BR(2)%BR longer than AS
%         AS=padarray(AS', size_BR(2)-size_AS(2), 0, 'post')';
%     end
% end
% den=AS+BR;
% 
% %'c(z)/r(z):'
% c_r=minreal(filt(conv(T, B), den));
% 
% %'c(z)/D(z):'
% c_D=minreal(filt(AS, den));
% 
% %'U(z)/r(z):'
% U_r=minreal(filt(conv(T, A), den));
% 
% %'U(z)/D(z):'
% U_D=minreal(filt(conv(A, -R), den));