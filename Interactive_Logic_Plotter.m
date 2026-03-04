x=0:5:360;
y=sind(x);
color=menu('Choose a plot color', 'Red','Magenta','Cyan','Yellow','Black');
marker=menu('Choose a plot marker','*','-.');
switch color
   case 1
        if marker ==1
             plot(x,y,'r*')
        else
             plot(x,y,'r-.')
        end
   case 2
        if marker ==1
           plot(x,y,'m*')
        else 
           plot(x,y,'m-.')
        end
   case 3
        if marker ==1
           plot(x,y,'c*')
        else
           plot(x,y,'c-.')
        end
   case 4
        if marker ==1
           plot(x,y,'y*')
        else plot(x,y,'y-.')
        end
   case 5
        if marker ==1
           plot(x,y,'k*')
        else plot(x,y,'k-.')
        end
    otherwise plot(x,y)
end

%% 1. Define your "look-up tables" (Cell Arrays)
colors = {'r', 'm', 'c', 'y', 'k'}; 
markers = {'*', '-.'};

x=0:5:360;
y=sind(x);
color=menu('Choose a plot color', 'Red','Magenta','Cyan','Yellow','Black');
marker=menu('Choose a plot marker','*','-.');

% 2. Map the menu index directly to the string
% If color=1 and marker=2, style becomes 'r-.'
style = [colors{color}, markers{marker}];

% 3. One single plot command to rule them all
plot(x, y, style)