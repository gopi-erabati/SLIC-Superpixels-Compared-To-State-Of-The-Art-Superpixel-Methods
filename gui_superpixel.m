function varargout = gui_superpixel(varargin)
% GUI_SUPERPIXEL MATLAB code for gui_superpixel.fig
%      GUI_SUPERPIXEL, by itself, creates a new GUI_SUPERPIXEL or raises the existing
%      singleton*.
%
%      H = GUI_SUPERPIXEL returns the handle to a new GUI_SUPERPIXEL or the handle to
%      the existing singleton*.
%
%      GUI_SUPERPIXEL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_SUPERPIXEL.M with the given input arguments.
%
%      GUI_SUPERPIXEL('Property','Value',...) creates a new GUI_SUPERPIXEL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_superpixel_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_superpixel_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui_superpixel

% Last Modified by GUIDE v2.5 06-Jan-2017 13:20:10

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @gui_superpixel_OpeningFcn, ...
    'gui_OutputFcn',  @gui_superpixel_OutputFcn, ...
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


% --- Executes just before gui_superpixel is made visible.
function gui_superpixel_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui_superpixel (see VARARGIN)

% Choose default command line output for gui_superpixel
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

set(handles.text18,'Visible','Off');
set(handles.text6,'Visible','Off');
set(handles.edit6,'Visible','Off');

set(handles.text19,'Visible','Off');
set(handles.text7,'Visible','Off');
set(handles.text8,'Visible','Off');
set(handles.text9,'Visible','Off');
set(handles.edit15,'Visible','Off');
set(handles.edit16,'Visible','Off');
set(handles.edit17,'Visible','Off');

set(handles.text20,'Visible','Off');
set(handles.text10,'Visible','Off');
set(handles.text11,'Visible','Off');
set(handles.text12,'Visible','Off');
set(handles.text13,'Visible','Off');
set(handles.edit18,'Visible','Off');
set(handles.edit19,'Visible','Off');
set(handles.edit20,'Visible','Off');
set(handles.edit21,'Visible','Off');

axes(handles.axes1)
cla;
set(gca,'XtickLabel',[],'YtickLabel',[]);

axes(handles.axes2)
cla;
set(gca,'XtickLabel',[],'YtickLabel',[]);



% UIWAIT makes gui_superpixel wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = gui_superpixel_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1
axes(handles.axes1)
cla;
axes(handles.axes2)
cla;


% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

set(handles.edit7,'String','in progress');

index = get(handles.listbox1,'value');
if index == 1
    cd('./SLIC/')
    num_sp = str2double(get(handles.edit1,'String'));
    cmp_fac = str2double(get(handles.edit5,'String'));
    
    img_slic = handles.img_slic;
    img_with_pxl_bound =  superpixel_slic(img_slic,num_sp,cmp_fac);
    axes(handles.axes2);
    imshow(img_with_pxl_bound);
    cd('../../Newfolder_2/');
    set(handles.edit7,'String','done!');
else if index == 2
        cd('./TP09/');
        num_sp = str2double(get(handles.edit6,'String'));
        img_tp = handles.img_tp;
        disp_img = superpixel_tp09(img_tp,num_sp);
        axes(handles.axes2);
        imshow(disp_img);
        cd('../../Newfolder_2/');
        set(handles.edit7,'String','done!');
    else if index == 3
            cd('./GS04/');
            sigma = str2double(get(handles.edit15,'String'));
            k = str2double(get(handles.edit16,'String'));
            size = str2double(get(handles.edit17,'String'));
            img_gs = handles.img_gs;
            img_with_pxl = superpixel_gs04(img_gs, sigma,k ,size);
            axes(handles.axes2);
            imshow(img_with_pxl);
            cd('../../Newfolder_2/');
            set(handles.edit7,'String','done!');
        else if index == 4
                cd('./QS09_vlfeat-0.9.20/');
                run('./toolbox/vl_setup');
                ratio = str2double(get(handles.edit18,'String'));
                ker_size = str2double(get(handles.edit19,'String'));
                maxdist = str2double(get(handles.edit20,'String'));
                n_dist = str2double(get(handles.edit21,'String'));
                img_qs = handles.img_qs;
                img_with_pxl_bound = superpixel_qs09 (img_qs, ratio, ker_size, maxdist,n_dist);
                axes(handles.axes2);
                imshow(img_with_pxl_bound);
                cd('../../Newfolder_2/');
                set(handles.edit7,'String','done!');
            end
        end
    end
end



function edit1_Callback(hObject, eventdata, handles)
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



function edit2_Callback(hObject, eventdata, handles)
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



function edit4_Callback(hObject, eventdata, handles)
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


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

set(handles.edit7,'String','in progress');
axes(handles.axes1)
cla;
axes(handles.axes2)
cla;

index = get(handles.listbox1,'value');
if index == 1
    
    set(handles.text18,'Visible','Off');
    set(handles.text6,'Visible','Off');
    set(handles.edit6,'Visible','Off');
    
    set(handles.text19,'Visible','Off');
    set(handles.text7,'Visible','Off');
    set(handles.text8,'Visible','Off');
    set(handles.text9,'Visible','Off');
    set(handles.edit15,'Visible','Off');
    set(handles.edit16,'Visible','Off');
    set(handles.edit17,'Visible','Off');
    
    set(handles.text20,'Visible','Off');
    set(handles.text10,'Visible','Off');
    set(handles.text11,'Visible','Off');
    set(handles.text12,'Visible','Off');
    set(handles.text13,'Visible','Off');
    set(handles.edit18,'Visible','Off');
    set(handles.edit19,'Visible','Off');
    set(handles.edit20,'Visible','Off');
    set(handles.edit21,'Visible','Off');
    
    cd('./SLIC/');
    [filename,path] = uigetfile('*.jpg');
    filename = strcat(path,filename);
    img_slic = imread(filename);
    axes(handles.axes1);
    imshow(img_slic);
    handles.img_slic = img_slic;
    guidata(hObject, handles)
    cd('../../Newfolder_2/');
else if index == 2
        set(handles.text17,'Visible','Off');
        set(handles.text2,'Visible','Off');
        set(handles.text4,'Visible','Off');
        set(handles.edit1,'Visible','Off');
        set(handles.edit5,'Visible','Off');
        
        set(handles.text18,'Visible','On');
        set(handles.text6,'Visible','On');
        set(handles.edit6,'Visible','On');
        
        set(handles.text19,'Visible','Off');
        set(handles.text7,'Visible','Off');
        set(handles.text8,'Visible','Off');
        set(handles.text9,'Visible','Off');
        set(handles.edit15,'Visible','Off');
        set(handles.edit16,'Visible','Off');
        set(handles.edit17,'Visible','Off');
        
        
        
        cd('./TP09/');
        [filename,path] = uigetfile('*.jpg');
        filename = strcat(path,filename);
        img_tp = imread(filename);
        axes(handles.axes1);
        imshow(img_tp);
        
        handles.img_tp = img_tp;
        guidata(hObject, handles)
        cd('../../Newfolder_2/');
    else if index == 3
            set(handles.text17,'Visible','Off');
            set(handles.text2,'Visible','Off');
            set(handles.text4,'Visible','Off');
            set(handles.edit1,'Visible','Off');
            set(handles.edit5,'Visible','Off');
            
            set(handles.text19,'Visible','On');
            set(handles.text7,'Visible','On');
            set(handles.text8,'Visible','On');
            set(handles.text9,'Visible','On');
            set(handles.edit15,'Visible','On');
            set(handles.edit16,'Visible','On');
            set(handles.edit17,'Visible','On');
            
            set(handles.text18,'Visible','Off');
            set(handles.text6,'Visible','Off');
            set(handles.edit6,'Visible','Off');
            
            set(handles.text20,'Visible','Off');
            set(handles.text10,'Visible','Off');
            set(handles.text11,'Visible','Off');
            set(handles.text12,'Visible','Off');
            set(handles.text13,'Visible','Off');
            set(handles.edit18,'Visible','Off');
            set(handles.edit19,'Visible','Off');
            set(handles.edit20,'Visible','Off');
            set(handles.edit21,'Visible','Off');
            
            cd('./GS04/');
            [filename,path] = uigetfile('*.jpg');
            filename = strcat(path,filename);
            img_gs = imread(filename);
            axes(handles.axes1);
            imshow(img_gs);
            
            handles.img_gs = img_gs;
            guidata(hObject, handles);
            cd('../../Newfolder_2/');
        else index == 4
            set(handles.text17,'Visible','Off');
            set(handles.text2,'Visible','Off');
            set(handles.text4,'Visible','Off');
            set(handles.edit1,'Visible','Off');
            set(handles.edit5,'Visible','Off');
            
            set(handles.text18,'Visible','Off');
            set(handles.text6,'Visible','Off');
            set(handles.edit6,'Visible','Off');
            
            set(handles.text19,'Visible','Off');
            set(handles.text7,'Visible','Off');
            set(handles.text8,'Visible','Off');
            set(handles.text9,'Visible','Off');
            set(handles.edit15,'Visible','Off');
            set(handles.edit16,'Visible','Off');
            set(handles.edit17,'Visible','Off');
            
            set(handles.text20,'Visible','On');
            set(handles.text10,'Visible','On');
            set(handles.text11,'Visible','On');
            set(handles.text12,'Visible','On');
            set(handles.text13,'Visible','On');
            set(handles.edit18,'Visible','On');
            set(handles.edit19,'Visible','On');
            set(handles.edit20,'Visible','On');
            set(handles.edit21,'Visible','On');
            
            cd('./QS09_vlfeat-0.9.20/');
            [filename,path] = uigetfile('*.jpg');
            filename = strcat(path,filename);
            img_qs = imread(filename);
            axes(handles.axes1);
            imshow(img_qs);
            
            handles.img_qs = img_qs;
            guidata(hObject, handles);
            cd('../../Newfolder_2/');
        end
    end
end



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



function edit9_Callback(hObject, eventdata, handles)
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



function edit10_Callback(hObject, eventdata, handles)
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



function edit11_Callback(hObject, eventdata, handles)
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



function edit12_Callback(hObject, eventdata, handles)
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



function edit13_Callback(hObject, eventdata, handles)
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



function edit14_Callback(hObject, eventdata, handles)
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



function edit15_Callback(hObject, eventdata, handles)
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



function edit16_Callback(hObject, eventdata, handles)
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



function edit17_Callback(hObject, eventdata, handles)
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



function edit18_Callback(hObject, eventdata, handles)
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



function edit19_Callback(hObject, eventdata, handles)
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



function edit20_Callback(hObject, eventdata, handles)
% hObject    handle to edit20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit20 as text
%        str2double(get(hObject,'String')) returns contents of edit20 as a double


% --- Executes during object creation, after setting all properties.
function edit20_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit21_Callback(hObject, eventdata, handles)
% hObject    handle to edit21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit21 as text
%        str2double(get(hObject,'String')) returns contents of edit21 as a double


% --- Executes during object creation, after setting all properties.
function edit21_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
