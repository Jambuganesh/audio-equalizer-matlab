function varargout = equalizer(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @equalizer_OpeningFcn, ...
                   'gui_OutputFcn',  @equalizer_OutputFcn, ...
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
function equalizer_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
guidata(hObject, handles);
function varargout = equalizer_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;

function Browse_Callback(hObject, eventdata, handles)
[filename pathname] =uigetfile({'*.wav'}, 'File Selector');
handles.fullpathname = strcat(pathname ,filename);
set(handles.address, 'String', handles.fullpathname)
guidata(hObject, handles)

function play_equalizer(hObject, handles)
global player;
[handles.y,handles.Fs] = audioread(handles.fullpathname);
handles.Volume=get(handles.volume,'value');
handles.g1=get(handles.slider3,'value');
handles.g2=get(handles.slider4,'value');
handles.g3=get(handles.slider5,'value');
handles.g4=get(handles.slider7,'value');
handles.g5=get(handles.slider8,'value');
 handles.g6=get(handles.slider9,'value');
 handles.g7=get(handles.slider10,'value');
 handles.g8=get(handles.slider5,'value');
 handles.g9=get(handles.slider6,'value');
handles.g10=get(handles.slider7,'value');
set(handles.text16, 'String',handles.g1);
set(handles.text19, 'String',handles.g2);
set(handles.text20, 'String',handles.g3);
set(handles.text21, 'String',handles.g4);
set(handles.text22, 'String',handles.g5);
set(handles.text23, 'String',handles.g6);
set(handles.text24, 'String',handles.g7);
set(handles.text25, 'String',handles.g8);
set(handles.text26, 'String',handles.g9);
set(handles.text27, 'String',handles.g10);

cut_off=200; %cut off low pass dalama Hz
orde=16;
a=fir1(orde,cut_off/(handles.Fs),'low');
y1=handles.g1*filter(a,1,handles.y);

% %bandpass1
f1=201;
f2=400;
b1=fir1(orde,[f1/(handles.Fs) f2/(handles.Fs)],'bandpass');
y2=handles.g2*filter(b1,1,handles.y);
% 
% %bandpass2
f3=401;
f4=800;
b2=fir1(orde,[f3/(handles.Fs) f4/(handles.Fs)],'bandpass');
y3=handles.g3*filter(b2,1,handles.y);
% 
% %bandpass3
f4=801;
f5=1500;
b3=fir1(orde,[f4/(handles.Fs) f5/(handles.Fs)],'bandpass');
y4=handles.g4*filter(b3,1,handles.y);
% 
% %bandpass4
f5=1501;
f6=3000;
b4=fir1(orde,[f5/(handles.Fs) f6/(handles.Fs)],'bandpass');
y5=handles.g5*filter(b4,1,handles.y);
% 
% %bandpass5
f7=3001;
f8=5000;
b5=fir1(orde,[f7/(handles.Fs) f8/(handles.Fs)],'bandpass');
y6=handles.g6*filter(b5,1,handles.y);
% 
% %bandpass6
f9=5001;
f10=7000;
b6=fir1(orde,[f9/(handles.Fs) f10/(handles.Fs)],'bandpass');
y7=handles.g7*filter(b6,1,handles.y);
% 
% %bandpass7
f11=7001;
f12=10000;
b7=fir1(orde,[f11/(handles.Fs) f12/(handles.Fs)],'bandpass');
y8=handles.g8*filter(b7,1,handles.y);
% 
 % %bandpass8
f13=10001;
f14=15000;
b8=fir1(orde,[f13/(handles.Fs) f14/(handles.Fs)],'bandpass');
y9=handles.g9*filter(b8,1,handles.y);
% 
 %highpass
cut_off2=15000;
c=fir1(orde,cut_off2/(handles.Fs),'high');
y10=handles.g10*filter(c,1,handles.y);
%handles.yT=y1+y2+y3+y4+y5+y6+y7;
 handles.yT=y1+y2+y3+y4+y5+y6+y7+y8+y9+y10;
player = audioplayer(handles.Volume*handles.yT, handles.Fs);
 subplot(2,1,1);
 plot(handles.y);
 subplot(2,1,2);
 plot(handles.yT);

guidata(hObject,handles)
function party_Callback(hObject, eventdata, handles)
g1 = 5.4;
g2 = 0;
g3 = 0;
g4 = 0;
g5 =  0;
g6 = 0;
g7 = 0;
g8= 0;
g9 = 0;
g10 = 5.4;
set(handles.slider3,'value',g1);
set(handles.slider4,'value',g2);
set(handles.slider5,'value',g3);
set(handles.slider7,'value',g4);
set(handles.slider8,'value',g5);
set(handles.slider9,'value',g6);
set(handles.slider10,'value',g7);
set(handles.slider5,'value',g8);
set(handles.slider6,'value',g9);
set(handles.slider7,'value',g10);

set(handles.text16, 'String',g1);
set(handles.text19, 'String',g2);
set(handles.text20, 'String',g3);
set(handles.text21, 'String',g4);
set(handles.text22, 'String',g5);
set(handles.text23, 'String',g6);
set(handles.text24, 'String',g7);
set(handles.text25, 'String',g8);
set(handles.text26, 'String',g9);
set(handles.text27, 'String',g10);
function pop_Callback(hObject, eventdata, handles)
g1 = -1.5;
g2 = 3.9;
g3 = 5.4;
g4 = 4.5;
g5 =  0.9;
g6 = -1.5;
g7 = -1.8;
g8= -2.1;
g9 = -2.1;
g10 = -0.3;
set(handles.slider3,'value',g1);
set(handles.slider4,'value',g2);
set(handles.slider5,'value',g3);
set(handles.slider7,'value',g4);
set(handles.slider8,'value',g5);
set(handles.slider9,'value',g6);
set(handles.slider10,'value',g7);
set(handles.slider5,'value',g8);
set(handles.slider6,'value',g9);
set(handles.slider7,'value',g10);

set(handles.text16, 'String',g1);
set(handles.text19, 'String',g2);
set(handles.text20, 'String',g3);
set(handles.text21, 'String',g4);
set(handles.text22, 'String',g5);
set(handles.text23, 'String',g6);
set(handles.text24, 'String',g7);
set(handles.text25, 'String',g8);
set(handles.text26, 'String',g9);
set(handles.text27, 'String',g10);
function reggae_Callback(hObject, eventdata, handles)
g1 = 0;
g2 = 0;
g3 = -0.3;
g4 = -2.7;
g5 =  0;
g6 = 2.1;
g7 = 4.5;
g8= 3;
g9 = 0.6;
g10 = 0;
set(handles.slider3,'value',g1);
set(handles.slider4,'value',g2);
set(handles.slider5,'value',g3);
set(handles.slider7,'value',g4);
set(handles.slider8,'value',g5);
set(handles.slider9,'value',g6);
set(handles.slider10,'value',g7);
set(handles.slider5,'value',g8);
set(handles.slider6,'value',g9);
set(handles.slider7,'value',g10);

set(handles.text16, 'String',g1);
set(handles.text19, 'String',g2);
set(handles.text20, 'String',g3);
set(handles.text21, 'String',g4);
set(handles.text22, 'String',g5);
set(handles.text23, 'String',g6);
set(handles.text24, 'String',g7);
set(handles.text25, 'String',g8);
set(handles.text26, 'String',g9);
set(handles.text27, 'String',g10);
function rock_Callback(hObject, eventdata, handles)
g1 = 4.5;
g2 = -3.6;
g3 = -6.6;
g4 = -2.7;
g5 =  2.1;
g6 = 6;
g7 = 7.5;
g8= 7.8;
g9 =7.8;
g10 = 8.1;
set(handles.slider3,'value',g1);
set(handles.slider4,'value',g2);
set(handles.slider5,'value',g3);
set(handles.slider7,'value',g4);
set(handles.slider8,'value',g5);
set(handles.slider9,'value',g6);
set(handles.slider10,'value',g7);
set(handles.slider5,'value',g8);
set(handles.slider6,'value',g9);
set(handles.slider7,'value',g10);

set(handles.text16, 'String',g1);
set(handles.text19, 'String',g2);
set(handles.text20, 'String',g3);
set(handles.text21, 'String',g4);
set(handles.text22, 'String',g5);
set(handles.text23, 'String',g6);
set(handles.text24, 'String',g7);
set(handles.text25, 'String',g8);
set(handles.text26, 'String',g9);
set(handles.text27, 'String',g10);
function techno_Callback(hObject, eventdata, handles)
g1 = 4.8;
g2 = 4.2;
g3 = 1.5;
g4 = -2.4;
g5 =  -3.3;
g6 = -1.5;
g7 = 1.5;
g8= 5.1;
g9 = 5.7;
g10 = 5.4;
set(handles.slider3,'value',g1);
set(handles.slider4,'value',g2);
set(handles.slider5,'value',g3);
set(handles.slider7,'value',g4);
set(handles.slider8,'value',g5);
set(handles.slider9,'value',g6);
set(handles.slider10,'value',g7);
set(handles.slider5,'value',g8);
set(handles.slider6,'value',g9);
set(handles.slider7,'value',g10);

set(handles.text16, 'String',g1);
set(handles.text19, 'String',g2);
set(handles.text20, 'String',g3);
set(handles.text21, 'String',g4);
set(handles.text22, 'String',g5);
set(handles.text23, 'String',g6);
set(handles.text24, 'String',g7);
set(handles.text25, 'String',g8);
set(handles.text26, 'String',g9);
set(handles.text27, 'String',g10);
function classical_Callback(hObject, eventdata, handles)

g1 = 0;
g2 = 0;
g3 = 0;
g4 = 0;
g5 =  0;
g6 = 0;
g7 = -0.3;
g8= -5.7;
g9 = -6;
g10 = -8.1;
set(handles.slider3,'value',g1);
set(handles.slider4,'value',g2);
set(handles.slider5,'value',g3);
set(handles.slider7,'value',g4);
set(handles.slider8,'value',g5);
set(handles.slider9,'value',g6);
set(handles.slider10,'value',g7);
set(handles.slider5,'value',g8);
set(handles.slider6,'value',g9);
set(handles.slider7,'value',g10);

set(handles.text16, 'String',g1);
set(handles.text19, 'String',g2);
set(handles.text20, 'String',g3);
set(handles.text21, 'String',g4);
set(handles.text22, 'String',g5);
set(handles.text23, 'String',g6);
set(handles.text24, 'String',g7);
set(handles.text25, 'String',g8);
set(handles.text26, 'String',g9);
set(handles.text27, 'String',g10);

function slider3_Callback(hObject, eventdata, handles)
function slider3_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
function slider4_Callback(hObject, eventdata, handles)
function slider4_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
function slider5_Callback(hObject, eventdata, handles)
function slider5_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
function slider7_Callback(hObject, eventdata, handles)
function slider7_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
function slider8_Callback(hObject, eventdata, handles)
function slider8_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
function slider9_Callback(hObject, eventdata, handles)
function slider9_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
function slider10_Callback(hObject, eventdata, handles)
function slider10_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
function slider11_Callback(hObject, eventdata, handles)
function slider11_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
function slider6_Callback(hObject, eventdata, handles)
function slider6_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
function slider12_Callback(hObject, eventdata, handles)
function slider12_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

function play_Callback(hObject, eventdata, handles)
global player;
play_equalizer(hObject, handles);
play(player);
guidata(hObject, handles)
function pause_Callback(hObject, eventdata, handles)
global player;
play_equalizer(hObject, handles);
pause(player);
guidata(hObject, handles)
function resume_Callback(hObject, eventdata, handles)
global player;
play_equalizer(hObject, handles);
resume(player);
guidata(hObject, handles)
function stop_Callback(hObject, eventdata, handles)
global player;
play_equalizer(hObject, handles);
stop(player);
guidata(hObject, handles)
function volume_Callback(hObject, eventdata, handles)
function volume_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
