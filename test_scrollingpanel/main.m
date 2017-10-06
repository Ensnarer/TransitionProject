% test for scrolling panel
% source: https://www.mathworks.com/matlabcentral/answers/78854-how-do-you-enable-a-slider-to-scroll-an-entire-panel
%
% note: some modifications were made to original code: replaced
% g.InnerPosition with g.Position
%
% note: uses Yair's findjobj
% download at:
% https://www.mathworks.com/matlabcentral/fileexchange/14317-findjobj-find-java-handles-of-matlab-graphic-objects
%

addpath('findjobj');

g=figure('units','pixels','position',[100 60 500 700]);
u=uipanel(g,...
    'backgroundcolor',[1 0 1],...
    'units','pixels','position',[1000 1000 g.Position(3)-19 500]); % left bottom width height
% temporarily place the uipanel really far away (at 1000,1000)
% somehow the above height has to be at least g.Position(4)-20-1, else throws an error



uu=findjobj(u); % returns a handle to the java element
j=javax.swing.JScrollPane(uu);
j.setHorizontalScrollBarPolicy(j.HORIZONTAL_SCROLLBAR_NEVER);
% j.setVerticalScrollBarPolicy(j.VERTICAL_SCROLLBAR_ALWAYS);

[jj hh]=javacomponent(j,[10 10 g.Position(3)-20 g.Position(4)-20],g); % component position[pixels] parent


%components to add to panel
button=uicontrol(u,'style','pushbutton','units','pixels',...
    'position',[0.1 0.1 100 100],'string','blah');

