% *************************************************************************
% Projekt      : Serienschwingkreis
% Autor        : Nando Spiegel, Andres Minder
% Dateiname    : hauptmenue.m
% Beginndatum  : 15.04.2018
% Enddatum     : -
% Version      : 1.0
% *************************************************************************
% Innerhalb dieser Funktion, welche mittels der Matlab-Funktion "guide"
% erstellt wurde, ist das Hauptfenster für die Werteingabe implementiert.
% 
% - Allenfalls das Bild noch ersetzen.
% *************************************************************************
% 
% global variables: -
% 
% *************************************************************************
% 
% used functions:   -
% 
% input files:      RLC_Netzwerk.png
% 
% output files:     -
% 
% *************************************************************************

function varargout = hauptmenue(varargin)
% HAUPTMENUE MATLAB code for hauptmenue.fig
%      HAUPTMENUE, by itself, creates a new HAUPTMENUE or raises the existing
%      singleton*.
%
%      H = HAUPTMENUE returns the handle to a new HAUPTMENUE or the handle to
%      the existing singleton*.
%
%      HAUPTMENUE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in HAUPTMENUE.M with the given input arguments.
%
%      HAUPTMENUE('Property','Value',...) creates a new HAUPTMENUE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before hauptmenue_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to hauptmenue_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help hauptmenue

% Last Modified by GUIDE v2.5 17-Apr-2018 16:45:58

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @hauptmenue_OpeningFcn, ...
                   'gui_OutputFcn',  @hauptmenue_OutputFcn, ...
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


% --- Executes just before hauptmenue is made visible.
function hauptmenue_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to hauptmenue (see VARARGIN)

% Choose default command line output for hauptmenue
handles.output = hObject;
axes(handles.axes1);
imshow('RLC_Netzwerk.png');
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes hauptmenue wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = hauptmenue_OutputFcn(hObject, eventdata, handles) 
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


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes when figure1 is resized.
function figure1_SizeChangedFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function uipanel1_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to uipanel1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function uipanel1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uipanel1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes when uipanel1 is resized.
function uipanel1_SizeChangedFcn(hObject, eventdata, handles)
% hObject    handle to uipanel1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
