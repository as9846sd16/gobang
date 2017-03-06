function varargout = gobang(varargin)
% GOBANG MATLAB code for gobang.fig
%      GOBANG, by itself, creates a new GOBANG or raises the existing
%      singleton*.
%
%      H = GOBANG returns the handle to a new GOBANG or the handle to
%      the existing singleton*.
%
%      GOBANG('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GOBANG.M with the given input arguments.
%
%      GOBANG('Property','Value',...) creates a new GOBANG or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gobang_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gobang_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gobang

% Last Modified by GUIDE v2.5 08-Jun-2014 02:50:46

% Begin initialization code - DO NOT EDIT

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @gobang_OpeningFcn, ...
    'gui_OutputFcn',  @gobang_OutputFcn, ...
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
end

% --- Executes just before gobang is made visible.
function gobang_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gobang (see VARARGIN)

% Choose default command line output for gobang
handles.output = hObject;
startImg = imread('image\startBt.png');
startImg = imresize(startImg, [55 120]);
set(handles.startBt, 'cdata', startImg);

restartImg = imread('image\restartBt.png');
restartImg = imresize(restartImg, [55 120]);
set(handles.restartBt, 'cdata', restartImg);

retractImg = imread('image\retractBt.png');
retractImg = imresize(retractImg, [55 120]);
set(handles.retractBt, 'cdata', retractImg);

giveupImg = imread('image\giveupBt.png');
giveupImg = imresize(giveupImg, [55 120]);
set(handles.giveupBt, 'cdata', giveupImg);

kifuImg = imread('image\kifuBt.png');
kifuImg = imresize(kifuImg, [55 120]);
set(handles.kifuBt, 'cdata', kifuImg);

AiImg = imread('image\AiBt.jpg');
AiImg = imresize(AiImg, [100 150]);
set(handles.AiBt, 'cdata', AiImg);

peopleImg = imread('image\peopleBt.png');
peopleImg = imresize(peopleImg, [100 150]);
set(handles.peopleBt, 'cdata', peopleImg);

firstImg = imread('image\firstBt.png');
firstImg = imresize(firstImg, [100 150]);
set(handles.firstBt, 'cdata', firstImg);

secondImg = imread('image\secondBt.png');
secondImg = imresize(secondImg, [100 150]);
set(handles.secondBt, 'cdata', secondImg);

set(handles.welcomeAxes, 'xtick', [], 'ytick', []);
welcomeBg = imread('image\welcomeBg.jpg');
welcomeBg = imresize(welcomeBg, [600 800]);
imshow(welcomeBg, 'Parent', handles.welcomeAxes);
imshow(welcomeBg, 'Parent', handles.isAiAxes);
imshow(welcomeBg, 'Parent', handles.isFirstAxes);
%table, bwtable, chesses, counter setting
storetable();
%isb setting
imHandle_ButtonDownFcn();

%面板
set(handles.gamePanel, 'Visible', 'off');
set(handles.isAiPanel, 'Visible', 'off');
set(handles.isFirstPanel, 'Visible', 'off');
set(handles.welcomePanel, 'Visible', 'on');

%table設置
%filepath = ['D:\學區\matlab\image\table'];
filepath = ['image\table'];
tableImg = imread(filepath, 'jpg');
tableImg = imresize(tableImg, [500, 500]);
handles.tableImg = tableImg;
handles.imHandle = imshow(handles.tableImg, 'Parent', handles.table);
set(handles.imHandle, 'ButtonDownFcn' , @imHandle_ButtonDownFcn);
set(handles.imHandle, 'Tag', 'imHandle');
hold on;
% Update handles structure
guidata(hObject, handles);
% UIWAIT makes gobang wait for user response (see UIRESUME)
% uiwait(handles.figure1);
end

% --- Outputs from this function are returned to the command line.
function varargout = gobang_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --------------------------------------------------------------------
% hObject    handle to gamePanel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
end

function startBt_Callback(hObject, eventdata, handles)
% hObject    handle to startBt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

set(handles.welcomePanel, 'Visible', 'off');
 set(handles.isAiPanel, 'Visible', 'on');
guidata(gcf, handles);
end

% --- Executes on button press in peopleBt.
function peopleBt_Callback(hObject, eventdata, handles)
% hObject    handle to peopleBt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.isAiPanel, 'Visible', 'off');
set(handles.gamePanel, 'Visible', 'on');
setAi(false);
end

% --- Executes on button press in AiBt.
function AiBt_Callback(hObject, eventdata, handles)
% hObject    handle to AiBt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.isAiPanel, 'Visible', 'off');
set(handles.isFirstPanel, 'Visible', 'on');
setAi(true);
end

% --- Executes on button press in firstBt.
function firstBt_Callback(hObject, eventdata, handles)
% hObject    handle to firstBt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
setFirst(true);
set(handles.gamePanel, 'Visible', 'on');
set(handles.isFirstPanel, 'Visible', 'off');
end

% --- Executes on button press in secondBt.
function secondBt_Callback(hObject, eventdata, handles)
% hObject    handle to secondBt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
setFirst(false);
set(handles.gamePanel, 'Visible', 'on');
set(handles.isFirstPanel, 'Visible', 'off');
axes(handles.table);
place(8,8,true, true, false);
imHandle_ButtonDownFcn(1);
end

% --- Executes on button press in restartBt.
function restartBt_Callback(hObject, eventdata, handles)
% hObject    handle to restartBt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
q = questdlg('Are you sure to restart?', 'Restart', 'Yes', 'No', 'No');
switch q
    case 'Yes'
        counter = storetable(3);
        for i = 1:counter
        retractBt_Callback(hObject, eventdata, handles);
        end
end
end

% --- Executes on button press in retractBt.
function retractBt_Callback(hObject, eventdata, handles)
% hObject    handle to retractBt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.giveupBt, 'Enable', 'on');
set(handles.imHandle, 'ButtonDownFcn' , @imHandle_ButtonDownFcn);
times = 1;
isAiAndSecond = false;
if setAi()
    times = 2;
    oldtable = storetable(1);
        bwtable = storetable(2);
        last = storetable(3);
        [x y] = find(oldtable == last);
    if setFirst()
        lastnum = 0;
        if(bwtable(x,y) == 1)
            times = 1;
        end
    else
        lastnum = 1;
        if(bwtable(x,y) == 2)
            isAiAndSecond = true;
        end
    end
else
    times = 1;
    lastnum = 0;
end

for i = 1:times
oldtable = storetable(1);
last = storetable(3);
chesses = storetable(4);
    if last ~= lastnum
    [x y] = find(oldtable == last);
    set(chesses{x,y}, 'visible', 'off');
    storetable(x,y,1);
    imHandle_ButtonDownFcn(1);
    end
end
if isAiAndSecond
    [aix aiy] = choose(1);
    place(aix, aiy, true, true, false);
    imHandle_ButtonDownFcn(1);
end
end

% --- Executes on button press in giveupBt.
function giveupBt_Callback(hObject, eventdata, handles)
% hObject    handle to giveupBt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
counter = storetable(3);
q = questdlg('Are you sure to give up?', 'give up', 'Yes', 'No', 'No');
switch q
    case 'Yes'
        if mod(counter,2) == 0
            winner = 'White';
        else
            winner = 'Black';
        end
        questdlg(['The winner is ' winner '!'], 'GameOver', 'continue', 'continue');
        set(handles.giveupBt, 'Enable', 'off');
        set(handles.retractBt, 'Enable', 'off');
        set(handles.imHandle, 'ButtonDownFcn' , []);
end
end
% --- Executes on mouse press over axes background.

function imHandle_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to table (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
persistent isb;% check whether it is the white term
if nargin == 0
    isb = true;
elseif nargin == 1
    isb = ~isb;
else
    %placing chesses
    coordinates = get(gca,'CurrentPoint');
    mx = coordinates(1,1);
    my = coordinates(1,2);
    isAi = setAi();

    if isAi
        if(place(mx, my, isb, false, false))
            isb = ~isb;
            if (~isb)
                [aix aiy] = choose(2);
            else
                [aix aiy] = choose(1);
            end
                who_win = check_win();
    h = guihandles(gcf);
    if who_win ~= 0
        if who_win == -1
            msgbox('The winner is Black!', 'modal');
        else
            msgbox('The winner is White!', 'modal');
        end
        set(h.giveupBt, 'Enable', 'off');
        set(h.imHandle, 'ButtonDownFcn' , []);
        
        return;
    end
            place(aix, aiy, isb, true, false);
            isb = ~isb;
        end
    else
        if(place(mx, my, isb, false, false))
            isb = ~isb;
        end
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%
    who_win = check_win();
    h = guihandles(gcf);
    if who_win ~= 0
        if who_win == -1
            msgbox('The winner is Black!', 'modal');
        else
            msgbox('The winner is White!', 'modal');
        end
        set(h.giveupBt, 'Enable', 'off');
        set(h.imHandle, 'ButtonDownFcn' , []);
        
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%
end
end

function islegal = place(xin, yin, isb, isAi, isKifu)
if ~isAi
    islegal = true;
    %check the curser is in the table
    if(xin >490 || xin<10 || yin>490 || yin<10)
        islegal = false;
        disp('illegal place');
        return;
    end
    %calculate the point
    x = floor((xin-20)/33);
    y = floor((yin-20)/33);
    xcheck = xin-x*33-20;
    ycheck = yin-y*33-20;
    if(xcheck>17)
        x=x+1;
    end
    if(ycheck>17)
        y=y+1;
    end
    %check if the point is filled
    oldtable = storetable(2);
    if (oldtable(x+1,y+1) ~= 0)
        islegal = false;
        disp('illegal place');
        return;
    end
else
    x = xin - 1;
    y = yin - 1;
end
%print the point
a = 0:0.1:2*pi;
r=10;
xx = r*cos(a);
yy = r*sin(a);
xo = x*33;
yo = y*33;
hold on;
if(isb)
    h = fill(xx + xo + 20,yy + yo + 20, 'k');
else
    h = fill(xx + xo + 20,yy + yo + 20, 'w');
end
if(~isKifu)
    storetable(x + 1,y + 1, h);
end
end

function newtable = storetable(x, y, h)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
persistent table;% table for 1~225
persistent chesses;% chesses to hold the chesses' handle
persistent bwtable;% table for 1(white) , 2(black) and 0(none)
persistent counter;% counter to count the number of the chesses have been placed (plus 1)
if(nargin == 0)
    for i = 1:15
        for j = 1:15
            chesses{i, j} = [];
        end
    end
    table = zeros(15,15);
    bwtable = zeros(15,15);
    counter=1;
elseif nargin == 1
    if x == 1
        newtable = table;
    elseif x == 2
        newtable = bwtable;
    elseif x == 3
        newtable = counter-1;
    elseif x == 4
        newtable = chesses;
    end
else
    switch h
        case 1
            counter = counter - 1;
            table(x,y) = 0;
            bwtable(x,y) = 0;
            chesses{x,y} = [];
        otherwise
            chesses{x,y} = h;
            
            table(x,y) = counter;
            if mod(counter, 2) == 1
                bwtable(x,y) = 1;
            else
                bwtable(x,y) = 2;
            end
            counter = counter+1;
            
            newtable = table;
    end
end
end

function who_win = check_win()
% if black win return 1
% else if white win return -1
% else return 0

    function flag = check(x, y, table)
        flag = false;
        tmp = table(x, y);
        if x >= 5
            flag = true;
            for i = 1:4
                if table(x-i, y) ~= tmp
                    flag = false;
                    break;
                end
            end
            if flag == true
                return;
            end
        end
        
        if x <= 10
            flag = true;
            for i = 1:4
                if table(x+i, y) ~= tmp
                    flag = false;
                    break;
                end
            end
            if flag == true
                return;
            end
        end
        
        if y >= 5
            flag = true;
            for i = 1:4
                if table(x, y-i) ~= tmp
                    flag = false;
                    break;
                end
            end
            if flag == true
                return;
            end
        end
        
        if y <= 10
            flag = true;
            for i = 1:4
                if table(x, y+i) ~= tmp
                    flag = false;
                    break;
                end
            end
            if flag == true
                return;
            end
        end
        
        if x >= 5 && y >= 5
            flag = true;
            for i = 1:4
                if table(x-i, y-i) ~= tmp
                    flag = false;
                    break;
                end
            end
            if flag == true
                return;
            end
        end
        
        if x >= 5 && y <= 10
            flag = true;
            for i = 1:4
                if table(x-i, y+i) ~= tmp
                    flag = false;
                    break;
                end
            end
            if flag == true
                return;
            end
        end
        
        if x <= 10 && y >= 5
            flag = true;
            for i = 1:4
                if table(x+i, y-i) ~= tmp
                    flag = false;
                    break;
                end
            end
            if flag == true
                return;
            end
        end
        if x <= 10 && y <= 10
            flag = true;
            for i = 1:4
                if table(x+i, y+i) ~= tmp
                    flag = false;
                    break;
                end
            end         
            if flag == true
                return;
            end
        end
    end

tt = storetable(2);
for k = 1:15
    for j = 1:15
        if tt(k, j) ~= 0
            if check(k, j, tt)
                if tt(k, j) == 1
                    who_win = -1;
                else
                    who_win = 1;
                end
                return;
            end
        end
    end
end  
who_win = 0;
end

% --- Executes on button press in kifuBt.
function kifuBt_Callback(hObject, eventdata, handles)
% hObject    handle to kifuBt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img = handles.tableImg;
kifu = figure('numbertitle', 'off','name', 'Kifu','position', [5 100 500 500]);
kifuPanel = uipanel('Position', [0 0 500 500]);
ax = axes('Parent', kifuPanel,'units', 'pixels', 'position', [0 0 500 500]);
imshow(img, 'parent', ax);
hold on;
table = storetable(1);
counter = storetable(3);
isb = true;
for i = 1:counter
    [x y] = find(table == i);
    place(x,y,isb,true, true);
    if isb
        color = 'w';
    else
        color = 'k';
    end
    x = x - 1;
    y = y - 1;
    text(x*33 + 20,y*33 + 20,num2str(i),'HorizontalAlignment','Center','FontSize',12, 'color', color);
    isb = ~isb;
end
end

function [x, y] = choose(player) 
%player represents you are white or black

 function flag = check(x, y, table)
        flag = false;
        tmp = table(x, y);
        if x >= 5
            flag = true;
            for i = 1:4
                if table(x-i, y) ~= tmp
                    flag = false;
                    break;
                end
            end
            if flag == true
                return;
            end
        end
        
        if x <= 10
            flag = true;
            for i = 1:4
                if table(x+i, y) ~= tmp
                    flag = false;
                    break;
                end
            end
            if flag == true
                return;
            end
        end
        
        if y >= 5
            flag = true;
            for i = 1:4
                if table(x, y-i) ~= tmp
                    flag = false;
                    break;
                end
            end
            if flag == true
                return;
            end
        end
        
        if y <= 10
            flag = true;
            for i = 1:4
                if table(x, y+i) ~= tmp
                    flag = false;
                    break;
                end
            end
            if flag == true
                return;
            end
        end
        
        if x >= 5 && y >= 5
            flag = true;
            for i = 1:4
                if table(x-i, y-i) ~= tmp
                    flag = false;
                    break;
                end
            end
            if flag == true
                return;
            end
        end
        
        if x >= 5 && y <= 10
            flag = true;
            for i = 1:4
                if table(x-i, y+i) ~= tmp
                    flag = false;
                    break;
                end
            end
            if flag == true
                return;
            end
        end
        
        if x <= 10 && y >= 5
            flag = true;
            for i = 1:4
                if table(x+i, y-i) ~= tmp
                    flag = false;
                    break;
                end
            end
            if flag == true
                return;
            end
        end
        if x <= 10 && y <= 10
            flag = true;
            for i = 1:4
                if table(x+i, y+i) ~= tmp
                    flag = false;
                    break;
                end
            end         
            if flag == true
                return;
            end
        end
    end

ttt = storetable(2);

[rr,cc] = find(ttt == 0);

zzz = zeros(15);
zzz(find(ttt ~= 0)) = -10;

kkk = ttt;
[e_lx e_ly] = find(ttt == (3-player));

for icc = 1:size(rr)
    ccount = 0;
    for jcc = -1:1;
        for kcc = -1:1;
            if ~out_range(jcc+rr(icc),  kcc+cc(icc))
                if ttt(jcc+rr(icc), kcc+cc(icc)) ~= 0
                     ttmp = getweight(ttt, rr(icc), cc(icc), jcc, kcc, player);
                     ccount = ccount + ttmp;
                end
            end
        end
    end    
    zzz(rr(icc), cc(icc)) = ccount;
end

qaq_flag = false;
[b_x b_y] = find(zzz > 0.001);
for b_i = 1:size(b_x)
    kkk(b_x(b_i),b_y(b_i)) = player;
    if check(b_x(b_i), b_y(b_i), kkk)
        zzz(b_x(b_i), b_y(b_i)) = zzz(b_x(b_i), b_y(b_i)) + 7;
        kkk(b_x(b_i), b_y(b_i)) = 0;
        continue;
    end
    
    for b_j = 1:size(rr)
        if b_x(b_i) ~= rr(b_j) && b_y(b_i) ~= cc(b_j)
            qaq_flag = false;
            kkk(rr(b_j),cc(b_j)) = 3 - player;
            
            if check(rr(b_j), cc(b_j), kkk)
                 kkk
                 zzz(find(zzz > 0)) = -1;
                 zzz(rr(b_j), cc(b_j)) = 1;
                 qaq_flag = true;
                 kkk(rr(b_j),cc(b_j)) = 0;
                break;
            end

            for a_1 = 1:size(e_lx)
               if check(e_lx(a_1), e_ly(a_1), kkk)
                  zzz(find(zzz > 0)) = -1;
                  zzz(rr(b_j), cc(b_j)) = 1;
                  qaq_flag = true;
                  break;
               end
            end
            kkk(rr(b_j),cc(b_j)) = 0;
            if qaq_flag
                break;
            end
        end
    end
    
    kkk(b_x(b_i),b_y(b_i)) = 0;
    if qaq_flag
        break;
    end
end

maxi = max(zzz(1:end));

iind = find(zzz == maxi);
[xxx, yyy] = find(zzz == maxi);

isz = size(iind);
pick = randperm(isz(1), 1);

x = xxx(pick);
y = yyy(pick);
end

function ans = getweight(tt, x, y, dx, dy, p)
     sl = [ 0.19 0.235 1.3 2.2 ];
     dl = [ 0.18 0.25 1.37 1.95 ];
     sd = [ 0.07 0.15 0.5 2.2 ];
     dd = [ 0.06 0.17 0.20 1.95 ];
    
    if dx == 0 && dy == 0
        ans = 0;
        return;
    end
    
    tp = tt(x +dx, y+dy);
    
    flag = 0;
    
    for igg = 2:5
        if out_range(x+dx.*igg, y+dy.*igg)
            flag = 1;
            break;
        end
        
        if tt(x+dx.*igg, y+dy.*igg) ~= tp
            break;
        end
    end
    
    if flag == 1
        if tp == p
            ans = sd(igg-1);
        else
            ans = dl(igg-1);
        end
    else
        if tt(x+dx.*igg, y+dy.*igg) == 0
            if p == tp
                ans = sl(igg-1);
            else
                ans = dl(igg-1);
            end
        else
            if p == tp
                ans = sd(igg-1);
            else
                ans = dd(igg-1);
            end
        end
    end
    
end
function bb = out_range(x, y)
    if (x >0 && x < 16) && (y > 0 && y < 16)
        bb = false;
    else
        bb = true;
    end
end
function getAi = setAi(in)
persistent isAi;
if nargin == 0
    getAi = isAi;
    return
elseif nargin ==1
    if in
        isAi = true;
    else
        isAi = false;
    end
    getAi = isAi;
end
end

function getFirst = setFirst(in)
persistent isFirst;
if nargin == 0
    getFirst = isFirst;
    return;
elseif nargin == 1
    if in
        isFirst = true;
    else
        isFirst = false;
    end
    getFirst = isFirst;
end
end

% --------------------------------------------------------------------
function gamePanel_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to gamePanel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
end
