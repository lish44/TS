require("Lib")

function ce(tb)
    return {{tb[1], tb[2]}, {tb[3], tb[4]}}
end

-- MainPage = {
--     SubPage = {
--         Find = {t.s.Name, Enum.FMCIRF}, -- 找特征
--         DoOpt = {ac:AreaHit(t.p.Name)},
--          -- 操作
--         Sleep = 1000,
--          -- 睡眠
--         State = 0,
--          --当前mainpage的状态
--         ChangeState = 0,
--         Frequency = {1000, 3000}, -- 随机睡眠
--         FeatureExclude = nil, -- 排除特征
--         Exit
--     }
-- }

t = {
    s = {},
    p = {}
}

t.s.离线收益 = {0xfbda5b,"0|16|0xf8dd58,0|33|0xfad94f,98|31|0x9f9169,117|28|0xfac950",90,274,330,492,424}
t.p.离线收益 ={218,744,532,819}
t.s.红包群 = {0xf0f0f0,"2|20|0xe2e2e2,9|43|0xcccccc,13|43|0xf0f0f0,19|27|0xffffff",90,46,1258,95,1322}
t.p.红包群 = {42,1252,99,1316}
t.s.世界红包群 = {0xeeeeee,"153|30|0xdfdfdf,44|11|0x333333,84|15|0x333333,111|17|0xdddddd",90,155,443,324,480}
t.p.世界红包群 = {161,446,314,476}
t.s.广告1 = {0xffffff,"-3|-4|0xffffff,9|-9|0xffffff,-5|5|0xffffff,7|6|0xffffff",90,667,91,688,112}
t.p.广告1 = {659,84,696,121}
t.s.广告2 = {0xfcfcfc,"-6|-5|0xebebeb,9|-9|0xebebeb,9|10|0xebebeb,-9|9|0xeaeaea",90,670,90,689,109}
t.p.广告1 = {666,86,696,113}
t.s.世界红包群上滑 = {0xffffff,"6|1|0x333333,12|1|0xa9a9a9,22|5|0xd3d3d3,129|14|0xa8a8a8",90,283,61,464,102}
t.p.世界红包群上滑 = {489,1134,479,773}

-- runApp("com.redgame.guesssong.ios");

-- 
一起来养猪 = {
    主界面离线收益点击  = {
        Find = {t.s.离线收益,Enum.FMCIRF};
        DoOpt = {ac:AreaHit(t.p.离线收益)};
        Sleep = 1000;
        Exit = true;
    };
    红包群  = {
        Find = {t.s.红包群,Enum.FMCIRF};
        DoOpt = {ac:AreaHit(t.p.红包群)};
        Sleep = 1000;
    };
    世界红包群  = {
        Find = {t.s.世界红包群,Enum.FMCIRF};
        DoOpt = {ac:AreaHit(t.p.世界红包群)};
        Sleep = 1000;
    };
    -- Engine(滑动找红包,nil,nil,60)
    
};
滑动找红包 = {
    上滑动  = {
        Find = {t.s.世界红包群上滑,Enum.FMCIRF};
        DoOpt = {ac:Slider(t.p.世界红包群上滑)};
        Sleep = 1000;
    };
};


 广告 = {
    广告1  = {
        Find = {t.s.广告1,Enum.FMCIRF};
        DoOpt = {ac:AreaHit(t.p.广告1)};
        Sleep = 1000;
        Exit = true
    };
    广告2  = {
        Find = {t.s.广告2,Enum.FMCIRF};
        DoOpt = {ac:AreaHit(t.p.广告2)};
        Sleep = 1000;
        Exit = true
    };
};

runApp("com.yiqunkeji.yqlyz");
InitDeviceDirection(Down)

-- c1 = "一起来养猪" 
-- c2 = "广告" 
-- c3 = "滑动找红包"
-- local list = {
--     [1] = c1,
--     [2] = c2,
--     [3] = c3,
-- }
-- local logic = {
--     {id = 1, link = {3, 2}},
--     {id = 2, link = 1},
--     {id = 3}
-- }
-- ale:Go(list,logic)



-- while true do
--     Engine(一起来养猪,nil,nil,3);
--     Engine(广告,nil,nil,60);
-- end
