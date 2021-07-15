require("TSLib")

下 = 0;
左 = 2;
右 = 1;
--glSettings({switch = "1101", x1 = 524, y1 = 0, x2 = 1386, y2 = 54,tsp_switch = false})
CONTENTS_CLICK = "";
退出 = 1;

function InitDeviceDirection(direction)
    init(direction)
    -- nLog('初始化方向成功')
end




function rnd(n1,n2,switch)
    if switch then
        if switch==1 then
            return rndP({n1,n2})
        end
    end
    return {n1,n2};
end

function rndP(tab)
    -- body
    math.randomseed(getRndNum())
    return math.random(tab[1],tab[2])
end

function clickP(p)
    -- body
    if #p == 2 then
        randomTap(p[1],p[2]);
    elseif #p==4 then
        local x = math.random(p[1],p[3]);
        local y = math.random(p[2],p[4]);
        randomTap(x,y);
    end
end

function slidP(p)
    -- body
    local p1 = p[1];
    local p2 = p[2];

    local X1,Y1 = p1[1]+rnd(20,30,1),p1[2]+rnd(20,30,1);
    local X2,Y2 = p2[1]+rnd(20,30,1),p2[2]+rnd(20,30,1);
    local jD = rnd(20,40,1)
    local d = math.floor((((X2-X1)^2+(Y2-Y1)^2)^(1/2))/(jD or 20))
    local x,y= (X2-X1)/d,(Y2-Y1)/d
    touchDown(1, X1, Y1)
    for i = 1 ,d do
        touchMove(1, X1+x*i+rnd(i,i+5,1), Y1+y*i+rnd(i,i+5,1))
        mSleep(rnd(10,15,1));
    end
    touchUp(1,X2, Y2)
end

function click(x,y)
    -- body
    local x1 = x or 0;
    local y1 = y or 0;
    return {x1,y1,"默认点击"};
end

function sleep(time1,time2)
    -- body
    if time2 then
        local time = rnd(time1,time2,1)
        return time;
    else
        return time1;
    end


end

function Point(x,y,pX,pY)
    -- body
    local px,py = 0,0;
    local rX = pX or 0;
    local rY = pY or 0;
    local px = math.random(0,rX);
    local pY = math.random(0,rY);
    --	nLog(x+px)
    --	nLog(y+px)
    return {x+px,y+py};
end

function Range(x1,y1,x2,y2)
    -- body
    return {x1,y1,x2,y2};
end

function slid(p1,p2)
    -- body
    return {p1,p2};
end

function findmulcolor(tz)
    -- body	
    local x,y = -1,-1
    if #tz==7 then
        -- nLog("识色")
        x,y = findMultiColorInRegionFuzzy(tz[1],tz[2],tz[3],tz[4],tz[5],tz[6],tz[7],tz[8] or {orient = 2});
    elseif #tz==8 then
        nLog("识字")
        x,y = tsFindText(tz[1],tz[2],tz[3],tz[4],tz[5],tz[6],tz[7],tz[8]);
    end
    if x>0 then
        --nLog("找到了"..tz.name)
        return x,y
    else
        return -1,-1
    end
end

function findmulcolorsAll(...)
    -- body
    if ... == nil then
        -- nLog("123")
        return -1,-1
    end
    local x,y = -1,-1;
    for k,v in pairs(...) do
        x,y = findmulcolor(...);
        if x<0 then
            return x,y;
        end
    end
    return x,y;
end

function findmulcolorsOne(...)
    -- body
    if ... == nil then
        -- nLog("123")
        return -1,-1
    end
    local x,y = -1,-1;
    for k,v in pairs(...) do
        x,y = findmulcolor(...);
        if x>0 then
            return x,y;
        end
    end
    return x,y;
end

function 结束任务(...)
    -- body
    mSleep(10)
    return 退出;
end

function 执行操作(p,pointFound)
    -- body
    local str = type(p)
    --nLog(str)
    if str=="number" then
        local rs = math.random(p*0.9,p*1.1)
        CONTENTS_CLICK = "【睡眠】"..p.."ms".."实际睡眠"..rs.."ms";
        nLog(CONTENTS_CLICK)
        mSleep(rs)
    elseif str == "table" then
        if #p == 3 then
            if type(p[1])=="number" then
                CONTENTS_CLICK = "【默认点击坐标1】"..pointFound[1].."+"..p[1]..","..pointFound[2].."+"..p[2];	
                nLog(CONTENTS_CLICK)
                randomTap(pointFound[1]+p[1],pointFound[2]+p[2])
            else
                local rx = rndP(p[1]);
                local ry = rndP(p[2]);
                CONTENTS_CLICK = "【默认点击坐标2】"..pointFound[1].."+"..rx..","..pointFound[2].."+"..ry;	
                nLog(CONTENTS_CLICK)
                randomTap(pointFound[1]+rx,pointFound[2]+ry)
            end
        elseif #p == 2 then
            if type(p[1])=="table"then
                CONTENTS_CLICK = "【滑动】"..p[1][1]..","..p[1][2].."--->"..p[2][1]..","..p[2][2];
                nLog(CONTENTS_CLICK)
                slidP(p)
            else
                CONTENTS_CLICK = "【点击坐标】"..p[1]..","..p[2];
                nLog(CONTENTS_CLICK)
                clickP(p);
            end
        elseif #p == 4 then
            CONTENTS_CLICK = "【范围点击坐标】"..p[1]..","..p[2]..","..p[3]..","..p[4];
            nLog(CONTENTS_CLICK)
            clickP(p);
        end
    elseif str == "string" then
        CONTENTS_CLICK = "【输入文字】"..p;
        nLog(CONTENTS_CLICK)
        inputText(p)
    elseif str == "function" then	
        if p()==退出 then		
            return 退出;
        else
            CONTENTS_CLICK = "【运行函数】";
            nLog(CONTENTS_CLICK)
        end
    end

end

function 执行多个操作(tab,pointFound)
    -- body
    for k,v in pairs(tab) do
        if 执行操作(v,pointFound)==退出 then
            return 退出;
        end
        mSleep(100)
    end
end

function 动作引擎(jobs,fcNotFound,second,time)
    -- body
    local 所有特征找不到 = true;
    local 运行时间 = os.time();
    local runTimes = 0;
    当前状态 = 0;
    while (true) do
        -- body	
        --当前状态 = 0;
        所有特征找不到 = true;	
        for k,v in pairs(jobs) do
            local jobs状态 = 0;
            if v['状态'] then
                jobs状态 = v['状态'];
            else
                jobs状态 = 0;
            end
            if findmulcolorsOne(v['排除特征'])>0 then
                nLog("【排除特征】-跳过动作："..k);
            else
                local x,y = findmulcolorsAll(v['寻找特征'])
                if (jobs状态 == 0 or jobs状态==当前状态) and x >0 then
                    nLog("【当前状态】"..当前状态)
                    所有特征找不到 = false;
                    运行时间 = os.time();
                    nLog("《找到".."-动作》:【"..k.."】的所有特征");
                    if v['频率'] then
                        if v['执行操作'] then
                            if os.time()-v['频率'][1] > v['频率'][2]/1000 then
                                v['频率'][1] = os.time();						
                                if 执行多个操作(v['执行操作'],{x,y})==退出 then
                                    nLog("【退出】"..k)
                                    return;
                                end
                            else
                                nLog("【跳过动作】"..k.."-倒计时"..v['频率'][2]-( (os.time()-v['频率'][1]))*1000 .. "ms")
                            end
                        end
                    elseif v['执行操作'] then				
                        if 执行多个操作(v['执行操作'],{x,y})==退出 then
                            nLog("【退出】"..k)
                            return;
                        end
                    end
                    if v['睡眠'] then
                        nLog("【睡眠】"..v['睡眠'].."-"..k)
                        mSleep(v['睡眠'])
                    end
                    if v['改变状态'] then
                        nLog("【改变状态】"..k)
                        当前状态 = v['改变状态'];
                        mSleep(100)
                    end
                    if v['退出'] then
                        nLog("【结束任务】"..k)
                        mSleep(10)
                        return;
                    end
                end
            end
        end
        if 所有特征找不到 then
            local timeDif = os.time()-运行时间;
            nLog("所有特征找不到"..timeDif.."s");
            if fcNotFound then
                if fcNotFound(timeDif)==退出 then
                    nLog("【退出】-所有特征找不到")
                    return;
                end
            end
            if timeDif > 5 then
                当前状态 = 0;
            end
        end
        mSleep(1000)
        runTimes = runTimes + 1;
        if second then
            if runTimes >= second then
                break;
            end
        end
        if time then
            if os.time() - 运行时间 > time then
                break;
            end
        end
    end
end

function f(time1,time2)
    -- body
    local time = 100;
    if time2 then
        time = math.random(time1,time2)
    elseif time1 then
        time = time1;
    end
    return {-1,time}
end