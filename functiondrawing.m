function varargout = Guistart(varargin)


gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @functiondrawing_OpeningFcn, ...
                   'gui_OutputFcn',  @functiondrawing_OutputFcn, ...
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


% --- Executes just before functiondrawing is made visible.
function functiondrawing_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to functiondrawing (see VARARGIN)
% Choose default command line output for functiondrawing
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes functiondrawing wait for user response (see UIRESUME)
% uiwait(handles.figure1);
line([0,100],[0,0]);
set(handles.edit1,'String',num2str(1));
set(handles.slider1,'Value',1.0);
set(handles.edit2,'String',num2str(1));
set(handles.slider2,'Value',1.0);
set(handles.edit3,'String',num2str(4.2));
set(handles.slider3,'Value',4.2);
uicontrol(handles.pushbutton1);
x=[1]
pie(handles.axes4,x);
pie(handles.axes5,x);
pie(handles.axes6,x);
pie(handles.axes8,x);
% --- Outputs from this function are returned to the command line.
function varargout = functiondrawing_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
E=str2double(get(handles.edit1,'String'));
B=str2double(get(handles.edit2,'string')); 
v=str2double(get(handles.edit3,'string')); 
Bswitch=get(handles.checkbox3,'Value');
Eswitch=get(handles.checkbox2,'Value');
labels1={'电场','磁场','速度'};
labels2={'偏转率',' '};
type='螺旋线';
if(Bswitch==false)
    B=0;
end
if(Eswitch==false)
    type='圆';
    E=0;
end
q=1.6.*10^-19,m=1.6.*10^-19;
x0=0;y0=0;
t=0:pi/100:10*pi;
r=m*v/(B*q);
x=x0+r.*sin(t);
y=y0+r.*cos(t);
z=E.*q/(2.*m).*t.^2;
plot3(handles.axes1,x,y,z);
set(handles.edit5,'string',type);
set(handles.edit8,'string',type);
if(B==0)
    t=0:100;
    x=0;
    y=v.*t;
    z=E.*q/(2.*m).*t.^2;
   % plot3(handles.axes1,x,y,z);
   if(E==0)
       set(handles.edit5,'string','直线');
       set(handles.edit8,'string','直线');
   else
       set(handles.edit5,'string','抛物线');
       set(handles.edit8,'string','抛物线');
   end
   plot(y,z);
end
tox=[E,B,v];toy=[B+E+v,2];
if(E==0&&B==0)
    toy=[B+E+v,0];
end
pie(handles.axes4,tox,labels1),
pie(handles.axes5,toy,labels2),
pie(handles.axes6,toy,labels2);
pie(handles.axes8,toy,labels2);


function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double

%sliderValue=get(handles.slider1,'Value');
%sliderValue=str2double(sliderValue);
sliderValue= get(handles.edit1,'String');
set(handles.slider1,'Value',str2double(sliderValue));


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



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double
sliderValue= get(handles.edit2,'String');
set(handles.slider2,'Value',str2double(sliderValue));


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


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkbox2.
function checkbox2_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox2


% --- Executes on button press in checkbox3.
function checkbox3_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox3



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double
sliderValue= get(handles.edit3,'String');
set(handles.slider3,'Value',str2double(sliderValue));


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


% --- Executes during object creation, after setting all properties.
function checkbox2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to checkbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

%sliderValue= get(handles.edit1,'String');
%set(handles.slider1,'Value',str2double(sliderValue));
sliderValue= get(handles.slider1,'Value');
set(handles.edit1,'String',num2str(sliderValue));
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

sliderValue= get(handles.slider2,'Value');
set(handles.edit2,'String',num2str(sliderValue));
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider3_Callback(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
sliderValue= get(handles.slider3,'Value');
set(handles.edit3,'String',num2str(sliderValue));
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function slider3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.edit1,'String',num2str(1));
set(handles.slider1,'Value',1.0);
set(handles.edit2,'String',num2str(1));
set(handles.slider2,'Value',1.0);
set(handles.edit3,'String',num2str(4.2));
set(handles.slider3,'Value',4.2);


% --- Executes on key press with focus on pushbutton1 and none of its controls.
function pushbutton1_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
function figure1_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  structure with the following fields (see FIGURE)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
cha=eventdata.charactor;
pushbutton1_callback();


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
E=4.1;
B=1.0;
v=4.2;
Bswitch=get(handles.checkbox3,'Value');
Eswitch=get(handles.checkbox2,'Value');
if(Bswitch==false)
    B=0;
end
if(Eswitch==false)
    E=0;
end
for i=0:0.15:9
    q=1.6.*10^-19,m=1.6.*10^-19;
    x0=0;y0=0;
    t=0:pi/100:10*pi;
    r=m*v/(B*q);
    x=x0+r.*sin(t);
    y=y0+r.*cos(t);
    z=E.*q/(2.*m).*t.^2;
    plot3(handles.axes1,x,y,z);
    if(B==0)
        t=0:100;
        x=0;
        y=v.*t;
        z=E.*q/(2.*m).*t.^2;
       % plot3(handles.axes1,x,y,z);
       plot(y,z);
       if(E==0)
           set(handles.edit5,'string','直线');
           set(handles.edit8,'string','直线');
       else
           set(handles.edit5,'string','抛物线');
           set(handles.edit8,'string','抛物线');
       end
    end
    if(E==0)
        if(B==0)
             set(handles.edit5,'string','直线');
             set(handles.edit8,'string','直线');
        else
             set(handles.edit5,'string','圆');
             set(handles.edit8,'string','圆');
        end
        break;
    end
    E=E+0.01;
    if(B~=0&&E~=0)
        set(handles.edit5,'string','螺旋线');
        set(handles.edit8,'string','螺旋线');
    end
    set(handles.edit1,'string',num2str(E));
    pause(0.05);
end

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
E=1.0;
B=2.2;
v=4.2;
Bswitch=get(handles.checkbox3,'Value');
Eswitch=get(handles.checkbox2,'Value');
if(Bswitch==false)
    B=0;
end
if(Eswitch==false)
    E=0;
    set(handles.edit5,'string','圆');
    set(handles.edit8,'string','圆');
end
labels1={'电场','磁场','速度'};
labels2={'偏转率',' '};
for i=0:0.1:6
    q=1.6.*10^-19,m=1.6.*10^-19;
    x0=0;y0=0;
    t=0:pi/100:10*pi;
    r=m*v/(B*q);
    x=x0+r.*sin(t);
    y=y0+r.*cos(t);
    z=E.*q/(2.*m).*t.^2;
    plot3(handles.axes1,x,y,z);
    if(B==0)
        t=0:100;
        x=0;
        y=v.*t;
        z=E.*q/(2.*m).*t.^2;
       % plot3(handles.axes1,x,y,z);
       if(E==0)
           set(handles.edit5,'string','直线');
           set(handles.edit8,'string','直线');
       else
           set(handles.edit5,'string','抛物线');
           set(handles.edit8,'string','抛物线');
       end
       plot(y,z);break;
    end
   
    B=B+0.01;
    if(E~=0&&B~=0)
       set(handles.edit5,'string','螺旋线');
       set(handles.edit8,'string','螺旋线');
    end
    set(handles.edit2,'string',num2str(B));
    tox=[E,B,v];
    toy=[B,5];
    
   % pie(handles.axes4,tox,labels1),
   % pie(handles.axes5,toy,labels2),
    %pie(handles.axes6,toy,labels2);
    pause(0.05);
end
pie(handles.axes4,tox,labels1),
pie(handles.axes5,toy,labels2),
pie(handles.axes6,toy,labels2);
pie(handles.axes8,toy,labels2);

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
E=1.0;
B=1.0;
v=4.05;
Bswitch=get(handles.checkbox3,'Value');
Eswitch=get(handles.checkbox2,'Value');
if(Bswitch==false)
    B=0;
end
if(Eswitch==false)
    E=0;
    set(handles.edit5,'string','圆');
    set(handles.edit8,'string','圆');
end
for i=0:0.1:8
    q=1.6.*10^-19,m=1.6.*10^-19;
    x0=0;y0=0;
    t=0:pi/100:10*pi;
    r=m*v/(B*q);
    x=x0+r.*sin(t);
    y=y0+r.*cos(t);
    z=E.*q/(2.*m).*t.^2;
    plot3(handles.axes1,x,y,z);
    if(E==0)set(handles.edit5,'string','直线');set(handles.edit8,'string','直线');else
       set(handles.edit5,'string','抛物线');set(handles.edit8,'string','抛物线');end
    if(B==0)
        t=0:100;
        x=0;
        y=v.*t;
        z=E.*q/(2.*m).*t.^2;
       % plot3(handles.axes1,x,y,z);
       plot(y,z);
    end
   if(E~=0&&B~=0)
       set(handles.edit5,'string','螺旋线');
       set(handles.edit8,'string','螺旋线');
   end
    v=v+0.01;
    set(handles.edit3,'string',num2str(v));
    pause(0.05);
end


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
E=5;
B=1.0;
v=4.2;
Bswitch=get(handles.checkbox3,'Value');
Eswitch=get(handles.checkbox2,'Value');
if(Bswitch==false)
    B=0;
end
if(Eswitch==false)
    E=0;
end
for i=0:0.1:6
    q=1.6.*10^-19,m=1.6.*10^-19;
    x0=0;y0=0;
    t=0:pi/100:10*pi;
    r=m*v/(B*q);
    x=x0+r.*sin(t);
    y=y0+r.*cos(t);
    z=E.*q/(2.*m).*t.^2;
    plot3(handles.axes1,x,y,z);
    if(B==0)
        t=0:100;
        x=0;
        y=v.*t;
        z=E.*q/(2.*m).*t.^2;
       % plot3(handles.axes1,x,y,z);
       if(E==0)
           set(handles.edit5,'string','直线');
           set(handles.edit8,'string','直线');
       else
           set(handles.edit5,'string','抛物线');
           set(handles.edit8,'string','抛物线');
       end
       plot(y,z);
    end
    if(E==0)
        break;
    end
    E=E-0.01;
    set(handles.edit1,'string',num2str(E));
    pause(0.05);
end

% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
E=1.0;
B=4.0;
v=4.2;
Bswitch=get(handles.checkbox3,'Value');
Eswitch=get(handles.checkbox2,'Value');
if(Bswitch==false)
    B=0;
end
if(Eswitch==false)
    E=0;
    set(handles.edit5,'string','圆');
    set(handles.edit8,'string','圆');
end
for i=0:0.1:9.0
    q=1.6.*10^-19,m=1.6.*10^-19;
    x0=0;y0=0;
    t=0:pi/100:10*pi;
    r=m*v/(B*q);
    x=x0+r.*sin(t);
    y=y0+r.*cos(t);
    z=E.*q/(2.*m).*t.^2;
    plot3(handles.axes1,x,y,z);
    if(B==0)
        t=0:100;
        x=0;
        y=v.*t;
        z=E.*q/(2.*m).*t.^2;
       % plot3(handles.axes1,x,y,z);
       if(E==0)set(handles.edit5,'string','直线');set(handles.edit8,'string','直线');else
       set(handles.edit5,'string','抛物线');set(handles.edit8,'string','抛物线');end
       plot(y,z);break;
    end
   
    B=B-0.01;
    if(E~=0&&B~=0)
       set(handles.edit5,'string','螺旋线');
       set(handles.edit8,'string','螺旋线');
    end
    set(handles.edit2,'string',num2str(B));
    pause(0.05);
end


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
E=1.0;
B=1.0;
v=5.0;
Bswitch=get(handles.checkbox3,'Value');
Eswitch=get(handles.checkbox2,'Value');
if(Bswitch==false)
    B=0;
end
if(Eswitch==false)
    E=0;
    set(handles.edit5,'string','圆');
    set(handles.edit8,'string','圆');
end
for i=0:0.1:10
    q=1.6.*10^-19,m=1.6.*10^-19;
    x0=0;y0=0;
    t=0:pi/100:10*pi;
    r=m*v/(B*q);
    x=x0+r.*sin(t);
    y=y0+r.*cos(t);
    z=E.*q/(2.*m).*t.^2;
    plot3(handles.axes1,x,y,z);
    if(E==0)set(handles.edit5,'string','直线');set(handles.edit8,'string','直线');else
       set(handles.edit5,'string','抛物线');set(handles.edit8,'string','抛物线');end
    if(B==0)
        t=0:100;
        x=0;
        y=v.*t;
        z=E.*q/(2.*m).*t.^2;
       % plot3(handles.axes1,x,y,z);
       plot(y,z);
    end
   
    v=v-0.01;
    if(E~=0&&B~=0)
       set(handles.edit5,'string','螺旋线');
       set(handles.edit8,'string','螺旋线');
    end
    set(handles.edit3,'string',num2str(v));
    pause(0.05);
end


% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_2_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in togglebutton2.
function togglebutton2_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton2


% --- Executes during object creation, after setting all properties.
function axes8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes8



function edit5_Callback(hObject, eventdata, handles)
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


% --- Executes during object creation, after setting all properties.
function pushbutton7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



function edit6_Callback(hObject, eventdata, handles)
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



function edit7_Callback(hObject, eventdata, handles)
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



function edit8_Callback(hObject, eventdata, handles)
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
