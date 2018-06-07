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
set(handles.buttonPlot, 'Enable', 'off');
set(hObject, 'WindowStyle', 'modal');
guidata(hObject, handles);
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
syms s t ue(t) ie(t)
stateChoice = Select();
try
    range = rangeChoice(stateChoice.Range);
catch
    % do nothing
end
ue(t) = handles.InputVoltage;
ie(t) = simplify(calculate('current',handles.InputVoltage, handles.Resistance, handles.Inductor, handles.Capacitor));
if stateChoice.InputVoltage == 1
    fplotValues('inputVoltage', ue, range, handles.Resistance, handles.Inductor, handles.Capacitor);
end
if stateChoice.InputCurrent == 1
    fplotValues('inputCurrent', ie, range, handles.Resistance, handles.Inductor, handles.Capacitor);
end
if stateChoice.ResistanceVoltage == 1
    uR(t) = calculate('resistance', ie, handles.Resistance);
    fplotValues('resistanceVoltage', uR, range, handles.Resistance, handles.Inductor, handles.Capacitor);
end
if stateChoice.InductorVoltage == 1
    uL(t) = calculate('inductor', ie, handles.Inductor);
    fplotValues('inductanceVoltage', uL, range, handles.Resistance, handles.Inductor, handles.Capacitor);
end
if stateChoice.CapacitorVoltage == 1
    uC(t) = calculate('capacitor', ie, handles.Capacitor);
    fplotValues('capacitanceVoltage', uC, range, handles.Resistance, handles.Inductor, handles.Capacitor);
end

function buttonPlot_CreateFcn(hObject, eventdata, handles)

function figure1_SizeChangedFcn(hObject, eventdata, handles)

function buttonReset_Callback(hObject, eventdata, handles)
set(handles.editUE, 'String', '');
set(handles.editR, 'String', '');
set(handles.editL, 'String', '');
set(handles.editC, 'String', '');
set(handles.editUE, 'BackgroundColor', 'white');
set(handles.editR, 'BackgroundColor', 'white');
set(handles.editL, 'BackgroundColor', 'white');
set(handles.editC, 'BackgroundColor', 'white');
