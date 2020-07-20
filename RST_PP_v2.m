function varargout = RST_PP_v2(varargin)
% RST_PP_V2 MATLAB code for RST_PP_v2.fig
%      RST_PP_V2, by itself, creates a new RST_PP_V2 or raises the existing
%      singleton*.
%
%      H = RST_PP_V2 returns the handle to a new RST_PP_V2 or the handle to
%      the existing singleton*.
%
%      RST_PP_V2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RST_PP_V2.M with the given input arguments.
%
%      RST_PP_V2('Property','Value',...) creates a new RST_PP_V2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before RST_PP_v2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to RST_PP_v2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help RST_PP_v2

% Last Modified by GUIDE v2.5 14-Jun-2020 00:01:16

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @RST_PP_v2_OpeningFcn, ...
                   'gui_OutputFcn',  @RST_PP_v2_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before RST_PP_v2 is made visible.
function RST_PP_v2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to RST_PP_v2 (see VARARGIN)

% Choose default command line output for RST_PP_v2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes RST_PP_v2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);
%handles
%figure1 output
%text1~19   edit1~19
%checkbox1 checkbox2 checkbox3
%pushbutton1 pushbutton2
%axes1 axes2

%Ts             text1/edit1
%Plant	delay: text2/edit2, num: text3/edit3, den: text4/edit4
%               B(z): text5/edit5, A(z): text6/edit6
%Regulation     w0: text7/edit7, zeta: text8/edit8, P(z): text11/edit11
%Tracking       w0: text9/edit9, zeta:text10/edit10
%               Bm(z): text12/edit12, Am(z): text13/edit13
%Hr: text14/edit14, Hs: text15/edit15, dist. freq.: text16/edit16
%R: text17/edit17, S: text18/edit18, T: text19/edit19
%Continuous plant: checkbox1, Cont. criteria: checkbox2
%Rem. zeros: checkbox3
%Update plant: push button1, Solve: pushbutton2

set(handles.edit1, 'string','1');%Ts

        %continuous plant
set(handles.edit2, 'string','0.6');%delay   %3 0.6
set(handles.edit3, 'string','1');%num
set(handles.edit4, 'string','[10 1]');%den

set(handles.checkbox1, 'value',0);%discrete plant

        %discrete plant
set(handles.edit5, 'string','[0 0.1 0.2]');%Bp
set(handles.edit6, 'string','[1 -1.3 0.42]');%Ap

set(handles.checkbox2, 'value',1);%continuous design criteria

        %reguation P(z)
set(handles.edit7, 'string','0.4');%w0
set(handles.edit8, 'string','0.9');%zeta
set(handles.edit11, 'string','[1 -1.3741 0.4867]');%P (just in case)

        %tracking Bm(z)/Am(z)
set(handles.edit9, 'string','0.5');%w0
set(handles.edit10, 'string','0.9');%zeta
set(handles.edit12, 'string','[0.0927 0.0687]');%Bm
set(handles.edit13, 'string','[1 -1.2451 0.4066]');%Am (just in case)

set(handles.edit14, 'string','1');%Hr
set(handles.edit15, 'string','1');%Hs
set(handles.edit16, 'string','0');%disturcance cosine frequency
%set(handles.edit16, 'string','[1 -1]');%disturbance den

set(handles.checkbox3, 'value',0);
%set(handles.checkbox3, 'string','Unused');%cancel zeros
pushbutton2_Callback(0, 0, handles);


% --- Outputs from this function are returned to the command line.
function varargout = RST_PP_v2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)%Ts
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)%Plant cont delay
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)%Plant cont num
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)%Plant cont den
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_Callback(hObject, eventdata, handles)%Bp(z)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit6_Callback(hObject, eventdata, handles)%Ap(z)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit7_Callback(hObject, eventdata, handles)%Reg. w0
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit8_Callback(hObject, eventdata, handles)%Reg. zeta
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit8 as text
%        str2double(get(hObject,'String')) returns contents of edit8 as a double


% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit9_Callback(hObject, eventdata, handles)%Track w0
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit9 as text
%        str2double(get(hObject,'String')) returns contents of edit9 as a double


% --- Executes during object creation, after setting all properties.
function edit9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit10_Callback(hObject, eventdata, handles)%Track zeta
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit10 as text
%        str2double(get(hObject,'String')) returns contents of edit10 as a double


% --- Executes during object creation, after setting all properties.
function edit10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit11_Callback(hObject, eventdata, handles)%P(z)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit11 as text
%        str2double(get(hObject,'String')) returns contents of edit11 as a double


% --- Executes during object creation, after setting all properties.
function edit11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit12_Callback(hObject, eventdata, handles)%Bm(z)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit12 as text
%        str2double(get(hObject,'String')) returns contents of edit12 as a double


% --- Executes during object creation, after setting all properties.
function edit12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit13_Callback(hObject, eventdata, handles)%Am(z)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit13 as text
%        str2double(get(hObject,'String')) returns contents of edit13 as a double


% --- Executes during object creation, after setting all properties.
function edit13_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit14_Callback(hObject, eventdata, handles)%Hr
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit14 as text
%        str2double(get(hObject,'String')) returns contents of edit14 as a double


% --- Executes during object creation, after setting all properties.
function edit14_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit15_Callback(hObject, eventdata, handles)%Hs
% hObject    handle to edit15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit15 as text
%        str2double(get(hObject,'String')) returns contents of edit15 as a double


% --- Executes during object creation, after setting all properties.
function edit15_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit16_Callback(hObject, eventdata, handles)%Disturbance den
% hObject    handle to edit16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit16 as text
%        str2double(get(hObject,'String')) returns contents of edit16 as a double


% --- Executes during object creation, after setting all properties.
function edit16_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit17_Callback(hObject, eventdata, handles)%R
% hObject    handle to edit17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit17 as text
%        str2double(get(hObject,'String')) returns contents of edit17 as a double


% --- Executes during object creation, after setting all properties.
function edit17_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit18_Callback(hObject, eventdata, handles)%S
% hObject    handle to edit18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit18 as text
%        str2double(get(hObject,'String')) returns contents of edit18 as a double


% --- Executes during object creation, after setting all properties.
function edit18_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit19_Callback(hObject, eventdata, handles)%T
% hObject    handle to edit19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit19 as text
%        str2double(get(hObject,'String')) returns contents of edit19 as a double


% --- Executes during object creation, after setting all properties.
function edit19_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)%[ ] cont. plant
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1


% --- Executes on button press in checkbox2.
function checkbox2_Callback(hObject, eventdata, handles)%[ ] cont. criteria
% hObject    handle to checkbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox2


% --- Executes on button press in checkbox3.
function checkbox3_Callback(hObject, eventdata, handles)%[ ] remove zeros
% hObject    handle to checkbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox3


% --- Executes on button press in checkbox4.
function checkbox4_Callback(hObject, eventdata, handles)%continuous curve
% hObject    handle to checkbox4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox4
[Ts Bp Ap Hr Hs dist P Bm Am]=acquire_data(handles);

R=str2num(get(handles.edit17, 'string'));%full R S T values
S=str2num(get(handles.edit18, 'string'));
T=str2num(get(handles.edit19, 'string'));



simulate_RST(Ts, Bp, Ap, R, S, T, Bm, Am, dist, handles);




function P=z_polynomial(w0, zeta, Ts)
s=w0*(-zeta+1i*sqrt(1-zeta*zeta));
z=exp(s*Ts);
rez=real(z); imz=imag(z);
P=[1, -2*rez, rez*rez+imz*imz];

function lz=count_leading_zeros(v)
size_v=size(v);
if size_v(1)<size_v(2)%horizontal vector
    v=v';
end
size_v=size(v);
lz=0;
for k=1:size_v(1)
    if v(k)==0
        lz=lz+1;
    else
        break;
    end
end

function [Ts B A Hr Hs dist P Bm Am]=acquire_data(handles)
c=clock;
iteration_time=sprintf('%d-%d-%d %d:%d:%f', c(1), c(2), c(3), c(4), c(5), c(6))

Ts=str2double(get(handles.edit1, 'string'));
BW=0;%rad/s
%GET PLANT PTF
if get(handles.checkbox1, 'value')%continuous plant
    num=str2num(get(handles.edit3, 'string'));
    den=str2num(get(handles.edit4, 'string'));
    delay=str2double(get(handles.edit2, 'string'));
    sysc=tf(num, den, 'iodelay', delay);
    sysd=c2d(sysc, Ts, 'zoh');
    [B A]=tfdata(sysd, 'v');
    
    %get bandwidth
    BW=max(abs(roots(den)));
    
    B=padarray(B', sysd.ioDelay, 0, 'pre')';
    %get discretized delay
    %r1=step(sysd, 0:Ts:100);
    %totaldelay=count_leading_zeros(r1);
    %Bdelay=count_leading_zeros(B);
    %B=padarray(B', totaldelay-Bdelay, 0, 'pre')';
    set(handles.edit5, 'string',['[' num2str(B) ']']);
    set(handles.edit6, 'string',['[' num2str(A) ']']);
else                                 %discrete plant
    B=str2num(get(handles.edit5, 'string'));
    A=str2num(get(handles.edit6, 'string'));
end
%GET REGULATION P(z) & TRACKING Bm(z)/Am(z)
if get(handles.checkbox2, 'value')%continuous design criteria
    w0  =str2double(get(handles.edit7, 'string'));
    zeta=str2double(get(handles.edit8, 'string'));
    P=z_polynomial(w0, zeta, Ts);
    set(handles.edit11, 'string',['[' num2str(P) ']']);
    BW=max([BW w0]);
    
    w0  =str2double(get(handles.edit9, 'string'));
    zeta=str2double(get(handles.edit10, 'string'));
    Am=z_polynomial(w0, zeta, Ts);
    set(handles.edit13, 'string',['[' num2str(Am) ']']);
    BW=max([BW w0]);
    
    Bm=sum(Am);%Bm(z)=Am(1)
    set(handles.edit12, 'string',['[' num2str(Bm) ']']);
else                            %discrete design criteria
    P =str2num(get(handles.edit11, 'string'));
    Am=str2num(get(handles.edit13, 'string'));
	Bm=str2num(get(handles.edit12, 'string'));
end
set(handles.figure1, 'NumberTitle','off', 'Name',sprintf('RST Pole Placement v2. Nyquist period=%fs.', pi/BW));%%

Hr=str2num(get(handles.edit14, 'string'));
Hs=str2num(get(handles.edit15, 'string'));
distf=str2double(get(handles.edit16, 'string'));
if distf==0
    dist=[1 -1];
else
    dist=[1, -2*cos(2*pi*distf*Ts), 1];
end

function no_int=has_no_integrator(A)%finds if A has no integrator
r=roots(A);
sr=size(r);
no_int=true;
for k=1:sr(1)
    if r(k)==1
        no_int=false;
    end
end

function [B_stable B_unstable]=separate_B(B)
lz=count_leading_zeros(B);
gain=B(lz+1);%find polynomial gain
r=roots(B);
B_stable=1; B_unstable=1;
sr=size(r);
for k=1:sr(1)
    if abs(r(k))>=1 %unstable & critical zeros
        B_unstable=conv(B_unstable, [1 -r(k)]);
    else            %stable zeros
        B_stable=conv(B_stable, [1 -r(k)]);
    end
end
B_stable=B_stable*gain;%put the gain in the cancelled part
B_unstable=padarray(B_unstable', lz, 0, 'pre')';%put the delays in non-cancelled part

function [t X ref_size]=sim_response(sim_time, t_ref, t_dist, TF_ref, TF_dist, Ts)
res_ref =step(TF_ref, 0:(sim_time-t_ref));
res_dist=impulse(TF_dist, 0:(sim_time-t_dist));
ref_size=size(res_ref);
res_ref=padarray(res_ref,  t_ref,  0, 'pre');
res_dist=padarray(res_dist, t_dist, 0, 'pre');
t=0:Ts:(sim_time*Ts);
%X=res_ref-0.25*res_dist;%disturbance is a negative quarter-step
X=res_ref;
function simulate_RST(Ts, B, A, R, S, T, Bm, Am, dist, handles)
%CALCULATE TFs:
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

D=filt(1, dist);

%RESPONSE PLOTS
sim_time=100; t_ref=5; t_dist=50;


continuous_curve=get(handles.checkbox4, 'value');
[t PlantOutput ref_size]=sim_response(sim_time, t_ref, t_dist, c_r, c_D*D, Ts);
% for k=1:10
%     sprintf('plant output =%f',PlantOutput(k))
% end

reference=ones(ref_size);
reference=padarray(reference, t_ref, 0, 'pre');
%stairs(handles.axes1, t,PlantOutput);
if continuous_curve
    plot(handles.axes1, t,reference,'-', t,PlantOutput,'-');
else
    plot(handles.axes1, t,reference,'.', t,PlantOutput,'o');
end
set(handles.axes1, 'XMinorGrid','on', 'YMinorGrid','on');
title(handles.axes1, sprintf('Plant output, step disturbance at %g s', t_dist*Ts));

[t ControlSignal ref_size]=sim_response(sim_time, t_ref, t_dist, U_r, U_D*D, Ts);
%stairs(handles.axes2, t,ControlSignal);
if continuous_curve
    plot(handles.axes2, t,ControlSignal,'-');
else
    plot(handles.axes2, t,ControlSignal,'o');
end
set(handles.axes2, 'XMinorGrid','on', 'YMinorGrid','on');
title(handles.axes2, sprintf('Control signal, step disturbance at %g s', t_dist*Ts));

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)%update plant only
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%%headerfile
[Ts Bp Ap Hr Hs dist P Bm Am]=acquire_data(handles);
fileID = fopen('input.h','w');
fprintf(fileID,'#ifndef input_H_   \n');
fclose(fileID);
fileID = fopen('input.h','a');
fprintf(fileID,'#define input_H_    \n');
size_c=size(Bp);
fprintf(fileID,'extern const float  Bp[%i',size_c(2));
fprintf(fileID,'], ');
size_b=size(Ap);
fprintf(fileID,'Ap[%i',size_b(2));
fprintf(fileID,'], ');
size_d=size(P);
fprintf(fileID,'P[%i',size_d(2));
fprintf(fileID,']; \n');
fprintf(fileID,'#endif    \n');
fclose(fileID);
%cpp file
fileID = fopen('input.c','w');
fprintf(fileID,'#include "input.h"\n');
fclose(fileID);
fileID = fopen('input.c','a');
size_c=size(Bp);
fprintf(fileID,'const float Bp[]={%s',num2str(Bp(1)));
for i=2:size_c(2)
fprintf(fileID,',');
fprintf(fileID,' %s',num2str(Bp(i)));
end
fprintf(fileID,'};\n');
%%%%%%%
size_a=size(Ap);
fprintf(fileID,'const float Ap[]={%s',num2str(Ap(1)));
for i=2:size_a(2)
fprintf(fileID,',');
fprintf(fileID,' %s',num2str(Ap(i)));
end
fprintf(fileID,'};\n');
%%%%%%%%%
size_p=size(P);
fprintf(fileID,'const float P[]={%s',num2str(P(1)));
for i=2:size_p(2)
fprintf(fileID,',');
fprintf(fileID,' %s',num2str(P(i)));
end
fprintf(fileID,'};\n');
fclose(fileID);

R=str2num(get(handles.edit17, 'string'));%full R S T values
S=str2num(get(handles.edit18, 'string'));
T=str2num(get(handles.edit19, 'string'));


simulate_RST(Ts, Bp, Ap, R, S, T, Bm, Am, dist, handles);


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)%solve
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[Ts Bp Ap Hr Hs dist P Bm Am]=acquire_data(handles);
%%%%header file 
fileID = fopen('input.h','w');
fprintf(fileID,'#ifndef input_H_   \n');
fclose(fileID);
fileID = fopen('input.h','a');
fprintf(fileID,'#define input_H_    \n');
size_c=size(Bp);
fprintf(fileID,'extern const float  Bp[%i',size_c(2));
fprintf(fileID,'], ');
size_b=size(Ap);
fprintf(fileID,'Ap[%i',size_b(2));
fprintf(fileID,'], ');
size_d=size(P);
fprintf(fileID,'P[%i',size_d(2));
fprintf(fileID,']; \n');
fprintf(fileID,'#endif    \n');
fclose(fileID);
%cpp file
fileID = fopen('input.c','w');
fprintf(fileID,'#include "input.h"\n');
fclose(fileID);
fileID = fopen('input.c','a');
size_c=size(Bp);
fprintf(fileID,'const float Bp[]={%s',num2str(Bp(1)));
for i=2:size_c(2)
fprintf(fileID,',');
fprintf(fileID,' %s',num2str(Bp(i)));
end
fprintf(fileID,'};\n');
%%%%%%%
size_a=size(Ap);
fprintf(fileID,'const float Ap[]={%s',num2str(Ap(1)));
for i=2:size_a(2)
fprintf(fileID,',');
fprintf(fileID,' %s',num2str(Ap(i)));
end
fprintf(fileID,'};\n');
%%%%%%%%%
size_p=size(P);
fprintf(fileID,'const float P[]={%s',num2str(P(1)));
for i=2:size_p(2)
fprintf(fileID,',');
fprintf(fileID,' %s',num2str(P(i)));
end
fprintf(fileID,'};\n');
fclose(fileID);
Bps=[]; Bpu=[];
if get(handles.checkbox3, 'value')  %cancel stable zeros
    [Bps Bpu]=separate_B(Bp);
else                                %don't cancel
    Bps=1; Bpu=Bp;
end

%SOLUTION
%Ap Hs S + Bp Hr R = P      (no zeros cancelled)
S_has_integrator=has_no_integrator(Ap);
Hs_full=[];
if S_has_integrator
    Hs_full=conv(Hs, [1 -1]);
else
    Hs_full=Hs;
end
A=conv(Ap, Hs_full)';
B=conv(Bpu, Hr)';
nA=size(A); nA=nA(1)-1;%vertical vector size, power of z = size-1
nB=size(B); nB=nB(1)-1;
A=padarray(A, nB-1, 0, 'post');
B=padarray(B, nA-1, 0, 'post');
M=[];
for k=1:nB
    M=[M A];
    A=circshift(A, 1);
end
for k=(nB+1):(nB+nA)
    M=[M B];
    B=circshift(B, 1);
end
%M
n=size(M);  n=n(1);%M is a square matrix
nP=size(P); nP=nP(2);
P_full=padarray(P', n-nP, 0, 'post');
SR=M\P_full;

%Extract R, S, T
R=SR((nB+1):(nB+nA))';
S=SR(1:nB)';
if S_has_integrator
    S=conv(S, [1, -1]);
end
S=conv(S, Bps);
T=P/sum(Bpu);%(no zeros cancelled)

R=conv(R, Hr);
S=conv(S, Hs);
set(handles.edit17, 'string',['[' num2str(R) ']']);
set(handles.edit18, 'string',['[' num2str(S) ']']);
set(handles.edit19, 'string',['[' num2str(T) ']']);

simulate_RST(Ts, Bp, Ap, R, S, T, Bm, Am, dist, handles);
%%%%%headerfile
fileID = fopen('output.h','w');
fprintf(fileID,'#ifndef output_H_   \n');
fclose(fileID);
fileID = fopen('output.h','a');
fprintf(fileID,'#define output_H_    \n');
size_r=size(R);
fprintf(fileID,'extern const float  R[%i',size_r(2));
fprintf(fileID,'], ');
size_s=size(S);
fprintf(fileID,'S[%i',size_s(2));
fprintf(fileID,'], ');
size_t=size(T);
fprintf(fileID,'T[%i',size_t(2));
fprintf(fileID,']; \n');
fprintf(fileID,'#endif    \n');
fclose(fileID);
%%%%%%%cpp file
fileID = fopen('output.c','w');
fprintf(fileID,'#include "output.h"\n');
fclose(fileID);
fileID = fopen('output.c','a');
size_R=size(R);
fprintf(fileID,'const float R[]={%s',num2str(R(1)));
for i=2:size_R(2)
fprintf(fileID,',');
fprintf(fileID,' %s',num2str(R(i)));
end
fprintf(fileID,'};\n');
%%%%%%%
size_S=size(S);
fprintf(fileID,'const float S[]={%s',num2str(S(1)));
for i=2:size_S(2)
fprintf(fileID,',');
fprintf(fileID,' %s',num2str(S(i)));
end
fprintf(fileID,'};\n');
%%%%%%%%%
size_T=size(T);
fprintf(fileID,'const float T[]={%s',num2str(T(1)));
for i=2:size_T(2)
fprintf(fileID,',');
fprintf(fileID,' %s',num2str(T(i)));
end
fprintf(fileID,'};\n');
fclose(fileID);


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)%generate Simulink model
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[Ts Bp Ap Hr Hs dist P Bm Am]=acquire_data(handles);

R=str2num(get(handles.edit17, 'string'));%full R S T values
S=str2num(get(handles.edit18, 'string'));
T=str2num(get(handles.edit19, 'string'));

%global it_counter;
%it_counter=it_counter+1;
c=clock;
name=sprintf('System_%d%02d%02d_%02d%02d_%02d', c(1), c(2), c(3), c(4), c(5), round(c(6)));
sim_time=100; t_ref=5; t_dist=50;
str_Ts=num2str(Ts);
x=0; y=0;
sys=new_system(name);
set_param(name, 'stoptime',num2str(sim_time));
x=x+0; y=y+100;%step position
add_block('simulink/Sources/Step', [name '/Reference'], 'position',[x, y, x+30, y+30],...
    'time',num2str(t_ref*Ts), 'sampletime',str_Ts);
x=x+30;%step width

x=x+35;%spacing
add_block('simulink/Discrete/Discrete Filter', [name '/Bm(z)//Am(z)'], 'position',[x, y, x+195, y+30],...
    'numerator',['[' num2str(Bm) ']'], 'denominator',['[' num2str(Am) ']'], 'sampletime',str_Ts);

x=x+195;%tracking width
add_line(name, 'Reference/1', 'Bm(z)//Am(z)/1');

x=x+35;%spacing
add_block('simulink/Discrete/Discrete Filter', [name '/T(z)'], 'position',[x, y, x+195, y+30],...
    'numerator',['[' num2str(T) ']'], 'denominator','[1]', 'sampletime',str_Ts);

x=x+195;%T width
add_line(name, 'Bm(z)//Am(z)/1', 'T(z)/1');
x=x+25;%spacing
add_block('simulink/Math Operations/Sum', [name '/Sum1'], 'position',[x, y+5, x+20, y+5+20],...
    'inputs','|+-');
x=x+20;%sum width
add_line(name, 'T(z)/1', 'Sum1/1');

x=x+35;%spacing
add_block('simulink/Discrete/Discrete Filter', [name '/1//S(z)'], 'position',[x, y, x+195, y+30],...
    'numerator','[1]', 'denominator',['[' num2str(S) ']'], 'sampletime',str_Ts);

x=x+195;%S width

add_line(name, 'Sum1/1', '1//S(z)/1');

x=x+330;%make space for possible continuous plant
add_block('simulink/Math Operations/Sum', [name '/Sum2'], 'position',[x, y+5, x+20, y+5+20],...
    'inputs','++|');

x=x+20;%sum width

x=x-285;%return till after S
if get(handles.checkbox1, 'value')%continuous plant
    add_block('simulink/Discrete/Zero-Order Hold', [name '/Zero-Order Hold'], 'position',[x, y, x+35, y+30]);
    x=x+35;%ZOH width
    add_line(name, '1//S(z)/1', 'Zero-Order Hold/1');
    
    x=x+35;%spacing
    add_block('simulink/Continuous/Transport Delay', [name '/Plant Delay'], 'position',[x, y, x+30, y+30],...
        'delaytime',get(handles.edit2, 'string'));
    x=x+30;%delay width
    add_line(name, 'Zero-Order Hold/1', 'Plant Delay/1');
    
    x=x+35;%spacing
    add_block('simulink/Continuous/Transfer Fcn', [name '/Gp(s)'], 'position',[x, y, x+120, y+30],...
        'numerator',get(handles.edit3,'string'), 'denominator',get(handles.edit4,'string'));
    x=x+120;%Gp width
    add_line(name, 'Plant Delay/1', 'Gp(s)/1');
    add_line(name, 'Gp(s)/1', 'Sum2/2');
else%discrete plant
    add_block('simulink/Discrete/Discrete Filter', [name '/Bp(z)//Ap(z)'], 'position',[x, y, x+195, y+30],...
        'numerator',['[' num2str(Bp) ']'], 'denominator',['[' num2str(Ap) ']'], 'sampletime',str_Ts);
    
    x=x+195;%plant width
    add_line(name, '1//S(z)/1', 'Bp(z)//Ap(z)/1');
    add_line(name, 'Bp(z)//Ap(z)/1', 'Sum2/2');
end

x=x+35;%spacing till sum2
x=x-135;%new branch
add_block('simulink/Sources/Sine Wave', [name '/Disturbance'], 'position',[x, 0, x+30, 0+30],...
    'amplitude','-0.25', 'frequency',get(handles.edit16,'string'), 'phase','pi/2', 'sampletime',str_Ts);

x=x+30;%disturbance width

x=x+40;%spacing
add_block('simulink/Continuous/Transport Delay', [name '/Disturbance Delay'], 'position',[x, 0, x+30, 0+30],...
    'delaytime',num2str(t_dist*Ts));

x=x+30;%delay width
add_line(name, 'Disturbance/1', 'Disturbance Delay/1');
add_line(name, 'Disturbance Delay/1', 'Sum2/1');


x=x+125;%spacing from dist. delay till mux
add_block('simulink/Signal Routing/Mux', [name '/Mux'], 'position',[x, y-15, x+5, y-15+38]);
x=x+5;%mux width

x=x+35;%spacing
add_block('simulink/Sinks/Scope', [name '/Scope'], 'position',[x, y, x+30, y+32]);
add_line(name, '1//S(z)/1', 'Mux/1');
add_line(name, 'Sum2/1', 'Mux/2');
add_line(name, 'Mux/1', 'Scope/1');
%add_line(name, 'Sum2/1', 'Scope/1');

%feedback blocks
x=x-465; y=y+110;%from scope left edge to R
block_R=add_block('simulink/Discrete/Discrete Filter', [name '/R(z)'], 'position',[x, y, x+195, y+30],...
    'numerator',['[' num2str(R) ']'], 'denominator','[1]', 'sampletime',str_Ts, 'orientation','left');


%all=get(get_param(block_R, 'handle'))
x=x-195;%R width
add_line(name, 'Sum2/1', 'R(z)/1');

x=x-195;
add_line(name, 'R(z)/1)', 'Sum1/2');

open_system(sys);
%clear;


% --- Executes on button press in pushbutton4.

function pushbutton4_Callback(hObject, eventdata, handles)%code generation
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[Ts Bp Ap Hr Hs dist P Bm Am]=acquire_data(handles);
R=str2num(get(handles.edit17, 'string'));%full R S T values
S=str2num(get(handles.edit18, 'string'));
T=str2num(get(handles.edit19, 'string'));
[c_r c_D U_r U_D]=calculate_CLTFs(Bp, Ap, R, S, T,Bm,Am);

[numcr,denmcr]=tfdata(c_r);
[numcd,denmcd]=tfdata(c_D);
[numur,denmur]=tfdata(U_r);
[numud,denmud]=tfdata(U_D);

%plant 
num_plant=numcr{1,1};
denm_plant=denmcr{1,1};
[A_p,B_p,C_p,D_p]=tf2ss(num_plant,denm_plant);
[row_Ap col_Ap]=size(A_p);
sprintf('%i %i',row_Ap,col_Ap);
[row_Bp col_Bp]=size(B_p);
[row_Cp col_Cp]=size(C_p);
[row_Dp col_Dp]=size(D_p);

%plant + disturbance
num_plant_dist=numcd{1,1};
denm_plant_dist=denmcd{1,1};
[A_pd,B_pd,C_pd,D_pd]=tf2ss(num_plant_dist,denm_plant_dist);
[row_Apd col_Apd]=size(A_pd);
[row_Bpd col_Bpd]=size(B_pd);
[row_Cpd col_Cpd]=size(C_pd);
[row_Dpd col_Dpd]=size(D_pd);

%controller
num_controller=numur{1,1};
denm_controller=denmur{1,1};
[A_c,B_c,C_c,D_c]=tf2ss(num_controller,denm_controller);
[row_Ac col_Ac]=size(A_c);
[row_Bc col_Bc]=size(B_c);
[row_Cc col_Cc]=size(C_c);
[row_Dc col_Dc]=size(D_c);

%controller + disturbance
num_controller_dist=numud{1,1};
denm_controller_dist=denmud{1,1};
[A_cd,B_cd,C_cd,D_cd]=tf2ss(num_controller_dist,denm_controller_dist);
[row_Acd col_Acd]=size(A_cd);
[row_Bcd col_Bcd]=size(B_cd);
[row_Ccd col_Ccd]=size(C_cd);
[row_Dcd col_Dcd]=size(D_cd);
%zeros(row_Ap,col_Ap)
cfg=coder.config('lib','ecoder',false);
cfg.GenCodeOnly= true;
cfg.HardwareImplementation.TargetHWDeviceType='ARM Compatible->ARM Cortex';
codegen -config cfg sys_output -args {zeros(row_Bp,col_Bp),zeros(row_Bpd,col_Bpd),zeros(row_Ap,col_Ap),zeros(row_Bp,col_Bp),zeros(row_Cp,col_Cp),zeros(row_Dp,col_Dp),zeros(row_Apd,col_Apd),zeros(row_Bpd,col_Bpd), zeros(row_Cpd,col_Cpd),zeros(row_Dpd,col_Dpd),zeros(1,1)}
%%%%%%%%%%%%
% Full path of the sample text file
filePath = 'codegen\lib\sys_output\sys_output.c';
% Read the file
str=fileread(filePath);
new_str=replace(str,'#include "rt_nonfinite.h"','');
new_str=replace(new_str,'const double xp','double xp');
new_str=replace(new_str,'const double xd','double xd');
% Save as a text file
fid2 = fopen('sys_output.c','w');
fprintf(fid2,'%s\n', new_str);
fclose(fid2);

%%%%%%%%%%%%
% Full path of the sample text file
filePath = 'codegen\lib\sys_output\sys_output.h';
% Read the file
str=fileread(filePath);
new_str=replace(str,'#include "rtwtypes.h"','');
new_str=replace(new_str,'#include "sys_output_types.h"','');
new_str=replace(new_str,'const double xp','double xp');
new_str=replace(new_str,'const double xd','double xd');
% Save as a text file
fid2 = fopen('sys_output.h','w');
fprintf(fid2,'%s\n', new_str);
fclose(fid2);

% header file 
fileID = fopen('coeff.h','w');
fprintf(fileID,'#ifndef coeff_H_   \n');
fclose(fileID);
fileID = fopen('coeff.h','a');
fprintf(fileID,'#define coeff_H_    \n');
size_c=size(A_p);
fprintf(fileID,'extern const double  A_p[%i',size_c(1)*size_c(2));
fprintf(fileID,'], ');
 size_b=size(B_p);
 fprintf(fileID,'B_p[%i',size_b(2)*size_b(1));
 fprintf(fileID,'], ');
 size_d=size(C_p);
 fprintf(fileID,'C_p[%i',size_d(2)*size_d(1));
 fprintf(fileID,'], ');

  size_b=size(A_pd);
 fprintf(fileID,'A_pd[%i',size_b(2)*size_b(1));
 fprintf(fileID,'], ');
  size_b=size(B_pd);
 fprintf(fileID,'B_pd[%i',size_b(2)*size_b(1));
 fprintf(fileID,'], ');
  size_b=size(C_pd);
 fprintf(fileID,'C_pd[%i',size_b(2)*size_b(1));
 fprintf(fileID,'], ');

  size_b=size(A_c);
 fprintf(fileID,'A_c[%i',size_b(2)*size_b(1));
 fprintf(fileID,'], ');
  size_b=size(B_c);
 fprintf(fileID,'B_c[%i',size_b(2)*size_b(1));
 fprintf(fileID,'], ');
  size_b=size(C_c);
 fprintf(fileID,'C_c[%i',size_b(2)*size_b(1));
 fprintf(fileID,'], ');

 %%%
   size_b=size(A_cd);
 fprintf(fileID,'A_cd[%i',size_b(2)*size_b(1));
 fprintf(fileID,'], ');
  size_b=size(B_cd);
 fprintf(fileID,'B_cd[%i',size_b(2)*size_b(1));
 fprintf(fileID,'], ');
 size_b=size(C_cd);
fprintf(fileID,'C_cd[%i',size_b(2)*size_b(1));
fprintf(fileID,'];\n');
fprintf(fileID,'extern double  ');
fprintf(fileID,'D_p, ');
fprintf(fileID,'D_pd, ');
fprintf(fileID,'D_c, '); 
fprintf(fileID,'D_cd, ');
fprintf(fileID,'xd[%i',row_Bpd*col_Bpd);
fprintf(fileID,'], ');
fprintf(fileID,'xp[%i',row_Bp*col_Bp);
fprintf(fileID,'], ');
fprintf(fileID,'xc[%i',row_Bc*col_Bc);
fprintf(fileID,'], ');
fprintf(fileID,'xcd[%i',row_Ccd*col_Ccd);
fprintf(fileID,'], ');
fprintf(fileID,'u;\n');
fprintf(fileID,'#endif    \n');
fclose(fileID);
path=pwd;
%%%source file
fileID = fopen('coeff.c','w');
fprintf(fileID,'#include "coeff.h"\n');
fclose(fileID);
fileID = fopen('coeff.c','a');
size_c=size(A_p);
fprintf(fileID,'extern const double A_p[]={%s',num2str(A_p(1)));
for i=2:size_c(2)*size_c(1)
fprintf(fileID,',');
fprintf(fileID,' %s',num2str(A_p(i)));
end
fprintf(fileID,'};\n');
%%%%%%%
size_a=size(B_p);
fprintf(fileID,'extern const double B_p[]={%s',num2str(B_p(1)));
for i=2:size_a(2)*size_a(1)
fprintf(fileID,',');
fprintf(fileID,' %s',num2str(B_p(i)));
end
fprintf(fileID,'};\n');
%%%%%%%%%
size_p=size(C_p);
fprintf(fileID,'extern const double C_p[]={%s',num2str(C_p(1)));
for i=2:size_p(2)*size_p(1)
fprintf(fileID,',');
fprintf(fileID,' %s',num2str(C_p(i)));
end
fprintf(fileID,'};\n');
%%%%%%%%%%%%%%
size_p=size(D_p);
fprintf(fileID,'extern double D_p=%s;\n',num2str(D_p(1)));
%%%%%%%%%%%%%%%%%
%%hna%%
size_c=size(A_pd);
fprintf(fileID,'extern const double A_pd[]={%s',num2str(A_pd(1)));
for i=2:size_c(2)*size_c(1)
fprintf(fileID,',');
fprintf(fileID,' %s',num2str(A_pd(i)));
end
fprintf(fileID,'};\n');
%%%%%%%
size_a=size(B_pd);
fprintf(fileID,'extern const double B_pd[]={%s',num2str(B_pd(1)));
for i=2:size_a(2)*size_a(1)
fprintf(fileID,',');
fprintf(fileID,' %s',num2str(B_pd(i)));
end
fprintf(fileID,'};\n');
%%%%%%%%%
size_p=size(C_pd);
fprintf(fileID,'extern const double C_pd[]={%s',num2str(C_pd(1)));
for i=2:size_p(2)*size_p(1)
fprintf(fileID,',');
fprintf(fileID,' %s',num2str(C_pd(i)));
end
fprintf(fileID,'};\n');
%%%%%%%%%%%%%%
size_p=size(D_pd);
fprintf(fileID,'extern double D_pd=%s;\n',num2str(D_pd(1)));
%%%%%%%%%%%%%%%%%%
%%%%%%%%hnaaaaaaaa%%%%%%%%%%%%%
 size_c=size(A_c);
fprintf(fileID,'extern const double A_c[]={%s',num2str(A_c(1)));
for i=2:size_c(2)*size_c(1)
fprintf(fileID,',');
fprintf(fileID,' %s',num2str(A_c(i)));
end
fprintf(fileID,'};\n');
%%%%%%%
size_a=size(B_c);
fprintf(fileID,'extern const double B_c[]={%s',num2str(B_c(1)));
for i=2:size_a(2)*size_a(1)
fprintf(fileID,',');
fprintf(fileID,' %s',num2str(B_c(i)));
end
fprintf(fileID,'};\n');
%%%%%%%%%
size_p=size(C_c);
fprintf(fileID,'extern const double C_c[]={%s',num2str(C_c(1)));
for i=2:size_p(2)*size_p(1)
fprintf(fileID,',');
fprintf(fileID,' %s',num2str(C_c(i)));
end
fprintf(fileID,'};\n');
%%%%%%%%%%%%%%
size_p=size(D_c);
fprintf(fileID,'extern double D_c=%s;\n',num2str(D_c(1)));
%%%%%%%%%%%%%%%%%
%%hna%%
size_c=size(A_cd);
fprintf(fileID,'extern const double A_cd[]={%s',num2str(A_cd(1)));
for i=2:size_c(2)*size_c(1)
fprintf(fileID,',');
fprintf(fileID,' %s',num2str(A_cd(i)));
end
fprintf(fileID,'};\n');
%%%%%%%
size_a=size(B_cd);
fprintf(fileID,'extern const double B_cd[]={%s',num2str(B_cd(1)));
for i=2:size_a(2)*size_a(1)
fprintf(fileID,',');
fprintf(fileID,' %s',num2str(B_cd(i)));
end
fprintf(fileID,'};\n');
%%%%%%%%%
size_p=size(C_cd);
fprintf(fileID,'extern const double C_cd[]={%s',num2str(C_cd(1)));
for i=2:size_p(2)*size_p(1)
fprintf(fileID,',');
fprintf(fileID,' %s',num2str(C_cd(i)));
end
fprintf(fileID,'};\n');
%%%%%%%%%%%%%%
size_p=size(D_cd);
fprintf(fileID,'extern double D_cd=%s;\n',num2str(D_cd(1)));
%%%%%%%%%%%%%%%%%%
fprintf(fileID,'extern double u=%s;\n',num2str(1));
%%%%%%%%%%%%%%%%%%%%
fprintf(fileID,'extern double xd[]={%s',num2str(0));
for i=2:row_Bpd*col_Bpd
fprintf(fileID,',');
fprintf(fileID,' %s',num2str(0));
end
fprintf(fileID,'};\n');
%%%%%%%%%%%%%%%%%%%%%%%
fprintf(fileID,'extern double xp[]={%s',num2str(0));
for i=2:row_Bp*col_Bp
fprintf(fileID,',');
fprintf(fileID,' %s',num2str(0));
end
fprintf(fileID,'};\n');
%%%%%%%%%%%%%%%%%%%%%%%%
fprintf(fileID,'extern double xc[]={%s',num2str(0));
for i=2:row_Bc*col_Bc
fprintf(fileID,',');
fprintf(fileID,' %s',num2str(0));
end
fprintf(fileID,'};\n');
%%%%%%%%%%%%%%%%%%%%%%%%%
fprintf(fileID,'extern double xcd[]={%s',num2str(0));
for i=2:row_Ccd*col_Ccd
fprintf(fileID,',');
fprintf(fileID,' %s',num2str(0));
end
fprintf(fileID,'};\n');
fclose(fileID);
%%%for excel%%%%
filename = 'testdata.xlsx';
A = {'Time','Plant Output';};
xlswrite(filename,A,1,'A1');

C = {'Time','Control Signal';};
xlswrite(filename,C,1,'E1');
u=1;
Ts=0.1;
xp=zeros(row_Bp,col_Bp);
xd=zeros(row_Bpd,col_Bpd);
xc=zeros(row_Bc,col_Bc);
xcd=zeros(row_Bcd,col_Bcd);
for i=0:100
    [Yp Xp Xd]=sys_output(xp,xd,A_p,B_p,C_p,D_p,A_pd,B_pd,C_pd,D_pd,u);
    [Yc Xc Xcd]=sys_output(xc,xcd,A_c, B_c, C_c, D_c, A_cd, B_cd, C_cd, D_cd,u);
    xp=Xp;
    xd=Xd;
    xc=Xc;
    xcd=Xcd;
    B={Ts*i,Yp};
    Xlrange=strcat('A',num2str(i+2));
    xlswrite(filename,B,1,Xlrange);
    D={Ts*i,Yc};
    Xlrange2=strcat('E',num2str(i+2));
    xlswrite(filename,D,1,Xlrange2);
end

%%%%%%%%%%%%%%main.c%%%%%%%%%%%%%%%%%%%
fileID = fopen('main.c','w');
fprintf(fileID,'#include "coeff.h"\n');
fclose(fileID);
fileID = fopen('main.c','a');
fprintf(fileID,'#include "sys_output.h"\n');
fprintf(fileID,'#include "uart.h"\n');
fprintf(fileID,'#define spaces 10\n');
fprintf(fileID,'int main()\n {');
fprintf(fileID,'   UART0_INIT();\n');
fprintf(fileID,'     int leng=0,isfloating=0,loop_space=0;\n');
fprintf(fileID,'     double Xp[%i]={0},Xd[%i]={0},y=0,yc=0;\n',row_Bp*col_Bp,row_Bpd*col_Bpd);
fprintf(fileID,'     double Xc[%i]={0},Xcd[%i]={0},Ts=0.1;\n',row_Bc*col_Bc,row_Bcd*col_Bcd);
fprintf(fileID,'     int i=1,j=0;\n');
fprintf(fileID,'     for(;i<20;i++)\n');
fprintf(fileID,'     {\n');
fprintf(fileID,'         sys_output(xp,xd,A_p, B_p, C_p, D_p, A_pd, B_pd, C_pd, D_pd,u,&y,Xp,Xd);\n');
fprintf(fileID,'         sys_output(xc,xcd,A_c, B_c, C_c, D_c, A_cd, B_cd, C_cd, D_cd,u,&yc,Xc,Xcd);\n');
fprintf(fileID,'         UART0Tx_str("K= ");\n');
fprintf(fileID,'         UART0Tx_num(i);\n');
fprintf(fileID,'         if(i<10){UART0TX_space();}\n');
fprintf(fileID,'         UART0TX_space();\n');
fprintf(fileID,'         UART0TX_space();\n');
fprintf(fileID,'         UART0Tx_str("t= ");\n');
fprintf(fileID,'         UART_sendFloatNumber(i*Ts,&leng,&isfloating);\n');
fprintf(fileID,'         if(isfloating){loop_space=leng+4;}\n');
fprintf(fileID,'         else{loop_space=leng;}\n');
fprintf(fileID,'         for(j=0;j<spaces-loop_space;j++){UART0TX_space();}\n');
fprintf(fileID,'         UART0Tx_str("plant output = ");\n');
fprintf(fileID,'         UART_sendFloatNumber(y,&leng,&isfloating);\n');
fprintf(fileID,'         if(isfloating){loop_space=leng+4;}\n');
fprintf(fileID,'         else{loop_space=leng;}\n');
fprintf(fileID,'         for(j=0;j<spaces-loop_space;j++){UART0TX_space();}\n');
fprintf(fileID,'         UART0Tx_str("control signal = ");\n');
fprintf(fileID,'         UART_sendFloatNumber(yc,&leng,&isfloating);\n');
fprintf(fileID,'         UART0TX_newLine();\n');
fprintf(fileID,'         for(j=0;j<%i;j++){xp[j]=Xp[j];}\n',row_Bp*col_Bp);
fprintf(fileID,'         for(j=0;j<%i;j++){xd[j]=Xd[j];}\n',row_Bpd*col_Bpd);
fprintf(fileID,'         for(j=0;j<%i;j++){xc[j]=Xc[j];}\n',row_Bc*col_Bc);
fprintf(fileID,'         for(j=0;j<%i;j++){xcd[j]=Xcd[j];}\n',row_Bcd*col_Bcd);
fprintf(fileID,'     }\n');
fprintf(fileID,'         return 0;\n');
fprintf(fileID,' }\n');
fclose(fileID);







% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)%simulink code generation
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[Ts Bp Ap Hr Hs dist P Bm Am]=acquire_data(handles);

R=str2num(get(handles.edit17, 'string'));%full R S T values
S=str2num(get(handles.edit18, 'string'));
T=str2num(get(handles.edit19, 'string'));

%global it_counter;
%it_counter=it_counter+1;
c=clock;
name=sprintf('System_%d%02d%02d_%02d%02d_%02d', c(1), c(2), c(3), c(4), c(5), round(c(6)));
model1=sprintf('plant_%d%02d%02d_%02d%02d_%02d', c(1), c(2), c(3), c(4), c(5), round(c(6))); %plant subsystem
model2=sprintf('Controller_%d%02d%02d_%02d%02d_%02d', c(1), c(2), c(3), c(4), c(5), round(c(6)));%controller subsystem
sim_time=100; t_ref=5; t_dist=50;
str_Ts=num2str(Ts);
x=0; y=0;
sys=new_system(name);
sys_plant=new_system(model1);
sys_controller=new_system(model2);
set_param(name, 'stoptime',num2str(sim_time));
set_param(model1, 'stoptime',num2str(sim_time));
set_param(model2, 'stoptime',num2str(sim_time));
x=x+0; y=y+100;%step position
add_block('simulink/Sources/Step', [name '/Reference'], 'position',[x, y, x+30, y+30],...
    'time',num2str(t_ref*Ts), 'sampletime',str_Ts);
x=x+30;%step width

x=x+35;%spacing
add_block('simulink/Discrete/Discrete Filter', [name '/Bm(z)//Am(z)'], 'position',[x, y, x+195, y+30],...
    'numerator',['[' num2str(Bm) ']'], 'denominator',['[' num2str(Am) ']'], 'sampletime',str_Ts);

add_block('simulink/Discrete/Discrete Filter', [model2 '/Bm(z)//Am(z)'], 'position',[x, y, x+195, y+30],...
    'numerator',['[' num2str(Bm) ']'], 'denominator',['[' num2str(Am) ']'], 'sampletime',str_Ts);
x=x+195;%tracking width
add_line(name, 'Reference/1', 'Bm(z)//Am(z)/1');

x=x+35;%spacing
add_block('simulink/Discrete/Discrete Filter', [name '/T(z)'], 'position',[x, y, x+195, y+30],...
    'numerator',['[' num2str(T) ']'], 'denominator','[1]', 'sampletime',str_Ts);

add_block('simulink/Discrete/Discrete Filter', [model2 '/T(z)'], 'position',[x, y, x+195, y+30],...
    'numerator',['[' num2str(T) ']'], 'denominator','[1]', 'sampletime',str_Ts);
x=x+195;%T width
add_line(name, 'Bm(z)//Am(z)/1', 'T(z)/1');
add_line(model2, 'Bm(z)//Am(z)/1', 'T(z)/1');
x=x+25;%spacing
add_block('simulink/Math Operations/Sum', [name '/Sum1'], 'position',[x, y+5, x+20, y+5+20],...
    'inputs','|+-');
add_block('simulink/Math Operations/Sum', [model2 '/Sum1'], 'position',[x, y+5, x+20, y+5+20],...
    'inputs','|+-');
x=x+20;%sum width
add_line(name, 'T(z)/1', 'Sum1/1');
add_line(model2, 'T(z)/1', 'Sum1/1');

x=x+35;%spacing
add_block('simulink/Discrete/Discrete Filter', [name '/1//S(z)'], 'position',[x, y, x+195, y+30],...
    'numerator','[1]', 'denominator',['[' num2str(S) ']'], 'sampletime',str_Ts);

add_block('simulink/Discrete/Discrete Filter', [model2 '/1//S(z)'], 'position',[x, y, x+195, y+30],...
    'numerator','[1]', 'denominator',['[' num2str(S) ']'], 'sampletime',str_Ts);
x=x+195;%S width

add_line(name, 'Sum1/1', '1//S(z)/1');
add_line(model2, 'Sum1/1', '1//S(z)/1');

x=x+330;%make space for possible continuous plant
add_block('simulink/Math Operations/Sum', [name '/Sum2'], 'position',[x, y+5, x+20, y+5+20],...
    'inputs','++|');

add_block('simulink/Math Operations/Sum', [model1 '/Sum2'], 'position',[x, y+5, x+20, y+5+20],...
    'inputs','++|');
x=x+20;%sum width

x=x-285;%return till after S
if get(handles.checkbox1, 'value')%continuous plant
    add_block('simulink/Discrete/Zero-Order Hold', [name '/Zero-Order Hold'], 'position',[x, y, x+35, y+30]);
    x=x+35;%ZOH width
    add_line(name, '1//S(z)/1', 'Zero-Order Hold/1');
    
    x=x+35;%spacing
    add_block('simulink/Continuous/Transport Delay', [name '/Plant Delay'], 'position',[x, y, x+30, y+30],...
        'delaytime',get(handles.edit2, 'string'));
    x=x+30;%delay width
    add_line(name, 'Zero-Order Hold/1', 'Plant Delay/1');
    
    x=x+35;%spacing
    add_block('simulink/Continuous/Transfer Fcn', [name '/Gp(s)'], 'position',[x, y, x+120, y+30],...
        'numerator',get(handles.edit3,'string'), 'denominator',get(handles.edit4,'string'));
    x=x+120;%Gp width
    add_line(name, 'Plant Delay/1', 'Gp(s)/1');
    add_line(name, 'Gp(s)/1', 'Sum2/2');
else%discrete plant
    add_block('simulink/Discrete/Discrete Filter', [name '/Bp(z)//Ap(z)'], 'position',[x, y, x+195, y+30],...
        'numerator',['[' num2str(Bp) ']'], 'denominator',['[' num2str(Ap) ']'], 'sampletime',str_Ts);
    
    add_block('simulink/Discrete/Discrete Filter', [model1 '/Bp(z)//Ap(z)'], 'position',[x, y, x+195, y+30],...
        'numerator',['[' num2str(Bp) ']'], 'denominator',['[' num2str(Ap) ']'], 'sampletime',str_Ts);
    
    x=x+195;%plant width
    add_line(name, '1//S(z)/1', 'Bp(z)//Ap(z)/1');
    add_line(name, 'Bp(z)//Ap(z)/1', 'Sum2/2');
    
   % add_line(model1, '1//S(z)/1', 'Bp(z)//Ap(z)/1');
    add_line(model1, 'Bp(z)//Ap(z)/1', 'Sum2/2');
end

x=x+35;%spacing till sum2
x=x-135;%new branch
add_block('simulink/Sources/Sine Wave', [name '/Disturbance'], 'position',[x, 0, x+30, 0+30],...
    'amplitude','-0.25', 'frequency',get(handles.edit16,'string'), 'phase','pi/2', 'sampletime',str_Ts);

add_block('simulink/Sources/Sine Wave', [model1 '/Disturbance'], 'position',[x, 0, x+30, 0+30],...
    'amplitude','-0.25', 'frequency',get(handles.edit16,'string'), 'phase','pi/2', 'sampletime',str_Ts);
x=x+30;%disturbance width

x=x+40;%spacing
add_block('simulink/Continuous/Transport Delay', [name '/Disturbance Delay'], 'position',[x, 0, x+30, 0+30],...
    'delaytime',num2str(t_dist*Ts));

add_block('simulink/Continuous/Transport Delay', [model1 '/Disturbance Delay'], 'position',[x, 0, x+30, 0+30],...
    'delaytime',num2str(t_dist*Ts));

x=x+30;%delay width
add_line(name, 'Disturbance/1', 'Disturbance Delay/1');
add_line(name, 'Disturbance Delay/1', 'Sum2/1');

add_line(model1, 'Disturbance/1', 'Disturbance Delay/1');
add_line(model1, 'Disturbance Delay/1', 'Sum2/1');

x=x+125;%spacing from dist. delay till mux
add_block('simulink/Signal Routing/Mux', [name '/Mux'], 'position',[x, y-15, x+5, y-15+38]);
x=x+5;%mux width

x=x+35;%spacing
add_block('simulink/Sinks/Scope', [name '/Scope'], 'position',[x, y, x+30, y+32]);
add_line(name, '1//S(z)/1', 'Mux/1');
add_line(name, 'Sum2/1', 'Mux/2');
add_line(name, 'Mux/1', 'Scope/1');
%add_line(name, 'Sum2/1', 'Scope/1');

%feedback blocks
x=x-465; y=y+110;%from scope left edge to R
block_R=add_block('simulink/Discrete/Discrete Filter', [name '/R(z)'], 'position',[x, y, x+195, y+30],...
    'numerator',['[' num2str(R) ']'], 'denominator','[1]', 'sampletime',str_Ts, 'orientation','left');

add_block('simulink/Discrete/Discrete Filter', [model2 '/R(z)'], 'position',[x, y, x+195, y+30],...
    'numerator',['[' num2str(R) ']'], 'denominator','[1]', 'sampletime',str_Ts, 'orientation','left');
%all=get(get_param(block_R, 'handle'))
x=x-195;%R width
add_line(name, 'Sum2/1', 'R(z)/1');

x=x-195;
add_line(name, 'R(z)/1)', 'Sum1/2');
add_line(model2, 'R(z)/1)', 'Sum1/2');
% open_system(sys);
% open_system(sys_plant);
% open_system(sys_controller);

%load_system(model)
%configurations for automatic c code generation for the plant and
%controller subsystems
cs1 = getActiveConfigSet(model1);
cs2 = getActiveConfigSet(model2);
switchTarget(cs1,'ert.tlc',[]);
switchTarget(cs2,'ert.tlc',[]);
% isERT1 = strcmp(get_param(cs1,'IsERTTarget'),'on');
% isERT2 = strcmp(get_param(cs2,'IsERTTarget'),'on');
deftParamBehvr1 = get_param(model1,'DefaultParameterBehavior');  % Get
set_param(model1,'DefaultParameterBehavior',deftParamBehvr1) ;    % Set
deftParamBehvr2 = get_param(model2,'DefaultParameterBehavior');  % Get
set_param(model2,'DefaultParameterBehavior',deftParamBehvr2)  ;   % Set
cs1.set_param('SolverType', 'Fixed-step');   % Type
cs2.set_param('SolverType', 'Fixed-step');   % Type
cs1.set_param('HardwareBoard', 'Tiva TM4C123G LaunchPad');   % Hardware board
cs2.set_param('HardwareBoard','Tiva TM4C123G LaunchPad');   % Hardware board
cs1.set_param('SupportContinuousTime','on');
cs1.set_param('StopTime', '48');   % Stop time
cs2.set_param('SupportContinuousTime','on');
cs2.set_param('StopTime', '48');   % Stop time
currentDir = pwd;
rtwdemodir();
% %save our configurations into 2 seperate files 
saveAs(cs1,'MyConfig_plant');  %
% saveAs(cs2,'MyConfig_controller'); 
% %generating the c code for the plant and the controller
rtwbuild(model1);
%rtwbuild(model1,'generateCodeOnly',false);  %build model
% rtwbuild(model2,'generateCodeOnly',false);  %build model

cd(currentDir);
%clear;

