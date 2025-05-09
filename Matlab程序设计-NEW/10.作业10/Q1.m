function Q1

btn = uicontrol('style','togglebutton','string','提交','fontsize',18,'units','normalized','position',[0.40,0.2,0.2,0.1]);
btn.Callback = @submit;
input = uicontrol('style','edit','fontsize',18,'units','normalized','position',[0.3,0.5,0.4,0.1]);
text = uicontrol('style','text','string','猜数字（0-100）','fontsize',18,'units','normalized','position',[0.3,0.70,0.4,0.1]);
reminder = uicontrol('style','text','string','你只有 10 次机会，目前只剩下 10 次机会','fontsize',12,'units','normalized','position',[0.1,0.6,0.8,0.1]);
result = uicontrol('style','text','string','','fontsize',12,'units','normalized','position',[0.1,0.35,0.8,0.1]);

chance = 10;
answer = 0;

function submit(hObject, hevent)
    if chance == 10
        answer = round(rand() * 100);
    end
    correct = 0;
    
    guess = str2num(get(input, 'string'));
    if guess == answer
        correct = 1;
        set(result, 'string', '你猜对了');
    elseif guess > answer
        set(result, 'string', '你猜错了！你的猜测比答案要大！');
    else
        set(result, 'string', '你猜错了！你的猜测比答案要小！');
    end

    if correct == 1
        chance = 10;
    elseif correct == 0 && chance - 1 == 0
        set(result, 'string', '游戏结束，你没有猜对哦！');
        chance = 10;
    else
        chance = chance - 1;
    end
    set(reminder, 'string', "你只有 10 次机会，目前只剩下" + num2str(chance) + "次机会");
end
end