function sierpinskiPlot
shg;
ha=axes('units','normalized','position',[0.15 0.2 0.7 0.7]);
axis([0 1 0 1]);
box on
ht=uicontrol('style','togglebutton','string','Plot');
ht.Callback=@plotsierpinski;

    function plotsierpinski(hObject,~)
        set(hObject,'string','Pause');
        A = [0.5 0;0 0.5];
        b1 = [0; 0];
        b2 = [0.5; 0];
        b3 = [1/4; sqrt(3)/4];
        x=[0;0];
        plot(ha,x(1),x(2),'.','markersize',6,'color',[0 2/3 0]);
        axis([0 1 0 1]);
        hold on
        while get(hObject,'value')==1
            r=rand * 3;
            if r < 1
                x=A*x+b1;
            elseif r < 2 && r >= 1
                x=A*x+b2;
            else
                x=A*x+b3;
            end
            plot(ha,x(1),x(2),'.','markersize',6,'color',[0 2/3 0]);
            hold on
            drawnow;
        end
        set(hObject,'string','Close','Callback','close(gcf)');
    end
end