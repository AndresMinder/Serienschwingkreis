function varargout = Hauptmenu(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Hauptmenu_OpeningFcn, ...
                   'gui_OutputFcn',  @Hauptmenu_OutputFcn, ...
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


function Hauptmenu_OpeningFcn(hObject, eventdata, handles, varargin)

axes(handles.axes1);
imshow('RLC_Netzwerk.png');

set(handles.textUE, 'String', 'Eingangsspannung Ue(t):');
set(handles.textR, 'String', 'Widerstand R [Ohm]:');
set(handles.textL, 'String', 'Induktivität L [H]:');
set(handles.textC, 'String', 'Kapazität C [F]:');

set(handles.editUE, 'String', '');
set(handles.editR, 'String', '');
set(handles.editL, 'String', '');
set(handles.editC, 'String', '');

set(handles.buttonPlot, 'String', 'Plot');
set(handles.buttonPlot, 'Enable', 'off');

set(hObject, 'WindowStyle', 'modal');

uiwait(handles.figure1);


function varargout = Hauptmenu_OutputFcn(hObject, eventdata, handles) 

try
    inputData.InputVoltage = handles.InputVoltage;
    inputData.Resistance = handles.Resistance;
    inputData.Inductor = handles.Inductor;
    inputData.Capacitor = handles.Capacitor;
    varargout{1} = inputData;
catch
    varargout{1} = 0;
    delete(hObject);
end


function figure1_CloseRequestFcn(hObject, eventdata, handles)

answer = questdlg('Möchten Sie wirklich beenden?', 'Close Request', 'Ja', 'Nein', 'Nein');
switch answer
    case 'Ja'
        delete(hObject);
    case 'Nein'
        % do nothing;
end



function editUE_Callback(hObject, eventdata, handles)

syms t inVolt(t)

try
    inVolt(t) = eval(get(handles.editUE, 'String'));
    set(handles.editUE, 'BackgroundColor', 'white');
    handles.InputVoltage = inVolt;
    guidata(hObject, handles);
    try
        if ~isnan(str2double(get(handles.editL, 'String'))) && ~isnan(str2double(get(handles.editC, 'String'))) && ~isnan(str2double(get(handles.editR, 'String'))) && isa(handles.InputVoltage, 'symfun')
            set(handles.buttonPlot, 'Enable', 'on');
        end
    catch
    end
catch
    uiwait(errordlg('Fehlerhafte Eingabe! Die Eingangsspannung ue(t) muss konstant sein oder darf nur "t" als unabhängige Variable enthalten.'));
    set(handles.editUE, 'BackgroundColor', [1 0.3 0.3]);
    set(handles.buttonPlot, 'Enable', 'off');
end


function editUE_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editR_Callback(hObject, eventdata, handles)

if isnan(str2double(get(handles.editR, 'String')))
    uiwait(errordlg('Fehlerhafte Eingabe! Es wurde kein nummerischer Wert für den Widerstand R angegeben.'));
    set(handles.editR, 'BackgroundColor', [1 0.3 0.3]);
    set(handles.buttonPlot, 'Enable', 'off');
else
    try
        if ~isnan(str2double(get(handles.editL, 'String'))) && ~isnan(str2double(get(handles.editC, 'String'))) && ~isnan(str2double(get(handles.editR, 'String'))) && isa(handles.InputVoltage, 'symfun')
            set(handles.buttonPlot, 'Enable', 'on');
        end
    catch
    end
    set(handles.editR, 'BackgroundColor', 'white');
    handles.Resistance = str2double(get(handles.editR, 'String'));
    guidata(hObject, handles);
end


function editR_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editL_Callback(hObject, eventdata, handles)

if isnan(str2double(get(handles.editL, 'String')))
    uiwait(errordlg('Fehlerhafte Eingabe! Es wurde kein nummerischer Wert für die Induktivität L angegeben.'));
    set(handles.editL, 'BackgroundColor', [1 0.3 0.3]);
    set(handles.buttonPlot, 'Enable', 'off');
else
    try
        if ~isnan(str2double(get(handles.editL, 'String'))) && ~isnan(str2double(get(handles.editC, 'String'))) && ~isnan(str2double(get(handles.editR, 'String'))) && isa(handles.InputVoltage, 'symfun')
            set(handles.buttonPlot, 'Enable', 'on');
        end
    catch
    end
    set(handles.editL, 'BackgroundColor', 'white');
    handles.Inductor = str2double(get(handles.editL, 'String'));
    guidata(hObject, handles);
end


function editL_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editC_Callback(hObject, eventdata, handles)

if isnan(str2double(get(handles.editC, 'String')))
    uiwait(errordlg('Fehlerhafte Eingabe! Es wurde kein nummerischer Wert für die Kapazität C angegeben.'));
    set(handles.editC, 'BackgroundColor', [1 0.3 0.3]);
    set(handles.buttonPlot, 'Enable', 'off');
else
    try
        if ~isnan(str2double(get(handles.editL, 'String'))) && ~isnan(str2double(get(handles.editC, 'String'))) && ~isnan(str2double(get(handles.editR, 'String'))) && isa(handles.InputVoltage, 'symfun')
            set(handles.buttonPlot, 'Enable', 'on');
        end
    catch
    end
    set(handles.editC, 'BackgroundColor', 'white');
    handles.Capacitor = str2double(get(handles.editC, 'String'));
    guidata(hObject, handles);
end


function editC_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function buttonPlot_Callback(hObject, eventdata, handles)

uiresume(handles.figure1);


function buttonPlot_CreateFcn(hObject, eventdata, handles)
