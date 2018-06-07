function varargout = Select(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Select_OpeningFcn, ...
                   'gui_OutputFcn',  @Select_OutputFcn, ...
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

function Select_OpeningFcn(hObject, eventdata, handles, varargin)
% set(handles.popmenuRange, 'Value', 3);
set(hObject, 'WindowStyle', 'modal');
guidata(hObject, handles);
uiwait(handles.figure1);

function varargout = Select_OutputFcn(hObject, eventdata, handles)
try
    state.InputVoltage = get(handles.checkboxUE, 'Value');
    state.InputCurrent = get(handles.checkboxIE, 'Value');
    state.ResistanceVoltage = get(handles.checkboxUR, 'Value');
    state.InductorVoltage = get(handles.checkboxUL, 'Value');
    state.CapacitorVoltage = get(handles.checkboxUC, 'Value');
    state.Range = get(handles.popupmenuRange, 'Value');
    varargout{1} = state;
    delete(hObject);
catch
    state.InputVoltage = 0;
    state.InputCurrent = 0;
    state.ResistanceVoltage = 0;
    state.InductorVoltage = 0;
    state.CapacitorVoltage = 0;
    state.Range = 0;
    varargout{1} = state;
    delete(hObject);
end

function pushbuttonPlot_Callback(hObject, eventdata, handles)
uiresume(handles.figure1);

function uipanel1_DeleteFcn(hObject, eventdata, handles)

function checkboxUE_Callback(hObject, eventdata, handles)

function checkboxIE_Callback(hObject, eventdata, handles)

function checkboxUR_Callback(hObject, eventdata, handles)

function checkboxUL_Callback(hObject, eventdata, handles)

function checkboxUC_Callback(hObject, eventdata, handles)

function figure1_CloseRequestFcn(hObject, eventdata, handles)
uiresume(handles.figure1);
delete(hObject);

function pushbuttonHelp_Callback(hObject, eventdata, handles)
helpdlg('Im "Select Plot" können die individuellen Plots ausgewählt werden. Der User kann die Range von der unabhängen Variablen t selber anpassen, falls der Plot unübersichtlich skalliert ist.');

function popupmenuRange_Callback(hObject, eventdata, handles)

function popupmenuRange_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
