function expgui_simple
x = [0];
y = [0];
axis([0 1 0 1]);
hp1=plot(x, y, 'b*');
title('画图','fontweight','bold');
set(gcf,'WindowButtonDownFcn',@f1)
set(gcf,'WindowButtonUpFcn',@f3);
    function f1(hobject,eventdata)
        set(gcf,'WindowButtonMotionFcn',@f2);
    end
    function f2(hobject,eventdata)
        point = get(gca,'currentpoint');
        x = [x point(1, 1)];
        y = [y point(1, 2)];
        set(hp1, 'Xdata', x, 'Ydata', y);
        drawnow;
    end
    function f3(hobject,eventdata)
            set(gcf,'WindowButtonMotionFcn','');
    end
end