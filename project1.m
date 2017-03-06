function varargout = project1(varargin)
% PROJECT1 MATLAB code for project1.fig
%      PROJECT1, by itself, creates a new PROJECT1 or raises the existing
%      singleton*.
%
%      H = PROJECT1 returns the handle to a new PROJECT1 or the handle to
%      the existing singleton*.
%
%      PROJECT1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROJECT1.M with the given input arguments.
%
%      PROJECT1('Property','Value',...) creates a new PROJECT1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before project1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to project1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help project1

% Last Modified by GUIDE v2.5 21-Jan-2017 15:34:33

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @project1_OpeningFcn, ...
                   'gui_OutputFcn',  @project1_OutputFcn, ...
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


% --- Executes just before project1 is made visible.
function project1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to project1 (see VARARGIN)

% Choose default command line output for project1
handles.output = hObject;
global C pos pos2 
pos =1 
pos2 = 1
C = {'x','20','12222'} ;
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes project1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = project1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

function pushbutton1_Callback(hObject, eventdata, handles)
% --- Executes on button press in pushbutton1.Ofunction pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global cam;
cam=webcam;
preview(cam);
pause(5);
closePreview(cam);
set(hObject,'enable','off');


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



function edit3_Callback(hObject, eventdata, handles)
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


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global name;
global id;
global age ;
global cam;
global pos C ;

img=snapshot(cam);
figure,imshow(img);
face = vision.CascadeObjectDetector;
bbox=step(face,img);
if isempty(bbox)
    msgbox('FACE NOT RECOGNISED!');
    
else
    hold on;
    rectangle('position',bbox);
    img1=rgb2gray(img);
    face_crop=imcrop(img1,bbox(1,:));
    figure,imshow(face_crop);
    name=get(handles.edit1,'string');
    id=get(handles.edit2,'string');                  %%%%%%%%%%%%%%%%%%%              %
    age=get(handles.edit3,'string');          %%%%%%%%%%%%%%%%%%%%%%%%%%%
    C{pos,1} =name ;
    %name = char(name) ;       %<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
     C{pos,2} =  id ;          %<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
      %id = double(id) ;     %<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
      C{pos,3} =   age ;
      %age = double(age) ;      %<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
        file_name=[name,'.png'];
        imwrite(face_crop,file_name) ;
       xlswrite('data.xlsx',C) ;
      %thingSpeakWrite(217144,id,'WriteKey','UZOM17JDPYOJMG8O')  %<<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
      thingSpeakWrite(217144,{name,id,age},'WriteKey','UZOM17JDPYOJMG8O')  %<<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
      pos =pos+1 ;
      
        
    %file_id=[id,'.txt'];                       %%%%%%%%%%%%%%%%%%%
    %file_age=[age,'.txt'];                       %%%%%%%%%%%%%%%%%%%
    %imwrite(face_crop,file_name);
    %imwrite(face_id,file_id); %%%%%%%%%%%%%%%%%%%
    %imwrite(face_age,file_age);   %%%%%%%%%%%%%%%%%%%
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


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global cam;
global img ;

face=vision.CascadeObjectDetector
img=snapshot(cam);
bbox=step(face,img);

if isempty(bbox)
    msgbox('sorry face not recognised')
else
    
    %d=dir(pwd);
 img1=rgb2gray(img);
img2=imcrop(img1,bbox);
img3=imcrop(img,bbox);
axes(handles.axes2);
 imshow(img3);  %IMG2
 
 %to be copied to match
 %d=dir(pwd);
 
    
end

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%c=[1,2,3,4,5,6,7,8,9,12,23,34,45,56,7,89,,11,22,33,44,55,66,77,88,9,99] ;   
c=1;%++++++++++++++++++++++++++++++++
global img ;
global pos pos2 C ;
global mx ;
d=dir(pwd);
face = vision.CascadeObjectDetector;
bbox=step(face,img);
img1=rgb2gray(img);
img2=imcrop(img1,bbox);
img2=imresize(img2,[80,65]);
 img2=im2double(img2)

j=1;
    for i=3:length(d)
        file_name=d(i).name;
        last=file_name(end-2:end);
        
        if(strcmp(last,'png')==1)
            a=imread(file_name);
            axes(handles.axes1);
            imshow(a);
            pause(1);
            a1=imresize(a,[80 65]);
            a2=im2double(a1);
            %val(j)=corr2(img2,a2);%value match karadena 
               %???????????????????????????????????????????????????????????????????              
              
            val1(j)=corr2(img2,a2);
            set(handles.text,'string',val1*100);  %age matcing wale box me %age matching print karaden 
%             C{pos2,4} =val1(i)*100 ;
%              xlswrite('data.xlsx',C) ;
             pos2 =pos2+1 ;        
            set(handles.text12,'string',c) ;
            c=c+1;
             file_name=d(i).name;
             j=j+1;
             set(handles.edit4, 'string', file_name );
            % file_name_test=d(c(i)).name;
          %  for(
        end
%         big = max(val1);
        %file_name_biggest = d
%         [M,I] = max(val1) ; 
    end
     [mx,pos] = max(val1) ;
   % set(handles.text12,'string',big*100);   % print the name of the max. matching image on text12
%     set(handles.edit4, 'string', M*100);
    %????????????????????????????????????NOW READING
    %STARTS?????????????????????????????????????????
    if mx > 0.6
   
     [A,B,C] =xlsread('data.xlsx') ;
     name1 = C{pos,1}
     age1 = C{pos,2}
     id1 = C{pos,3} 
     set(handles.edit4, 'string', name1);
      set(handles.edit5, 'string', age1);
       set(handles.edit6, 'string', id1);
    else 
        msgbox('NO MATCH FOUND') ;
    end
     
    % Create and display the text label
url = 'UndocumentedMatlab.com';
labelStr = ['<html>More info: <a href="">' url '</a></html>'];
jLabel = javaObjectEDT('javax.swing.JLabel', labelStr);
[hjLabel,hContainer] = javacomponent(jLabel, [10,10,250,20], gcf);
 
% Modify the mouse cursor when hovering on the label
hjLabel.setCursor(java.awt.Cursor.getPredefinedCursor(java.awt.Cursor.HAND_CURSOR));
 
% Set the label's tooltip
hjLabel.setToolTipText(['Visit the ' url ' website']);
 
% Set the mouse-click callback
set(hjLabel, 'MouseClickedCallback', @(h,e)web(['http://' url], '-browser'))
    
     



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double
% Create and display the text label
url = 'UndocumentedMatlab.com';
labelStr = ['<html>More info: <a href="">' url '</a></html>'];
jLabel = javaObjectEDT('javax.swing.JLabel', labelStr);
[hjLabel,hContainer] = javacomponent(jLabel, [10,10,250,20], gcf);
 
% Modify the mouse cursor when hovering on the label
hjLabel.setCursor(java.awt.Cursor.getPredefinedCursor(java.awt.Cursor.HAND_CURSOR));
 
% Set the label's tooltip
hjLabel.setToolTipText(['Visit the ' url ' website']);
 
% Set the mouse-click callback
set(hjLabel, 'MouseClickedCallback', @(h,e)web(['http://' url], '-browser'))


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
