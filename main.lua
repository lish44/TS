require("TSLib")
-- require("Utiliys")
-- require("Page")
-- require("lib")
require("flyFish")
require("huahua")

local ts = require("ts")
主界面 = {
    点击红包存钱罐 = {
        ['寻找特征'] = t.红包存钱罐;
        -- ['执行操作'] = {click(),sleep(1000)};
        ['执行操作'] = {Point(670,117)};
        ['频率'] = f(1000,3000);
    };

    点击每日红包 = {
        ['寻找特征'] = t.每日红包;
        ['执行操作'] = {Point(670,118)};
        ['频率'] = f(1000,3000);
    };
    点击主界面红包 = {
        ['寻找特征'] = t.主界面红包;
        ['执行操作'] = {click(),sleep(1000)};
        ['频率'] = f(1000,3000);
    };
    点击主界面过关红包 = {
        ['寻找特征'] = t.主界面过关红包;
        ['执行操作'] = {Point(375,402)};
        ['频率'] = f(1000,3000);
    };

    等待播放广告完成点击关闭 = {
        ['寻找特征'] = t.等待播放广告;
        ['执行操作'] = {click(),sleep(600)};
        ['频率'] = f(1000,3000);
    };
    点击圆圈x = {
        ['频率'] = f(1000,3000);
        ['寻找特征'] = t.圆圈x;
        ['执行操作'] = {Point(678,98)};
    };
    点击广告1 = {
        ['寻找特征'] = t.广告1;
        ['执行操作'] = {click(),sleep(800)};
        ['频率'] = f(1000,3000);
    };
    点击广告2 = {
        ['寻找特征'] = t.广告2;
        ['执行操作'] = {Point(687,62)};
        ['频率'] = f(1000,3000);
    };
    点击广告3 = {
        ['寻找特征'] = t.广告3;
        ['执行操作'] = {Point(687,101)};
        ['频率'] = f(1000,3000);
    };
    点击广告4 = {
        ['寻找特征'] = t.广告4;
        ['执行操作'] = {Point(129,84)};
        ['频率'] = f(1000,3000);
    };
    点击开心收下 = {
        ['寻找特征'] = t.开心收下;
        ['执行操作'] = {click(),sleep(1000)};
        ['频率'] = f(1000,3000);
    };

    -- 结束主界面 = {
    --     ['寻找特征'] = t.退出;
    --     ['执行操作'] = {结束任务};
    -- }
};
while (true) do
    runApp("com.redgame.guesssong.ios");
    InitDeviceDirection(0);
    动作引擎(主界面,nil,nil,60);
    mSleep(1000);
    closeApp("com.redgame.guesssong.ios");
    mSleep(3000);
end




-- x,y = findMultiColorInRegionFuzzy(0xff6209, "-1|36|0xf47760,26|36|0xe3381c,26|11|0xf1d735,26|1|0xff541c,13|9|0xfdd939,13|19|0xee470f,13|22|0xcb1403", 90, 141, 780, 600, 1138, { orient = 2 })

-- if x ~= -1 then
--     nLog(1)
-- else
--     nLog(2)
-- end

-- runApp("com.redgame.guesssong.ios")
-- while (true) do
--     page = GetPage(Pages)
--     nLog(page)
--     if (page == "主界面") then
--         -- 找红包 点击
--         local data = {0xed370b, "10|5|0xed370b,3|-17|0xfed93a", 90, 141, 780, 600, 1138}
--         Utiliy.findColor(data)
--         mSleep(1000)
--         data = {0xfeaa64, "42|1|0xfdf360,106|3|0xfdf360,116|10|0xfdea60", 90, 228, 172, 523, 252}
--         Utiliy.findColor(data, 370, 390)

--         data = {0xe69990, "21|0|0xe38a80,41|-4|0xde796d,80|6|0xdb6a5c", 90, 199, 939, 554, 1026}
--         Utiliy.findColor(data)
--     end

--     if (page == "广告界面") then

--         while (isColor(159, 92, 0xffffff, 90) and isColor(158, 114, 0xffffff, 90)) do
--             nLog("等待广告播放完")
--             mSleep(1000)
--             -- local data = {0xffffff, "21|0|0xffffff,21|21|0xffffff,0|21|0xffffff", 90, 43, 75, 103, 129}
--             -- isfind = Utiliy.findColor(data, 70, 100)
--             -- nLog(isfind)
--             -- if isfind == true then
--             --     break
--             -- end
--         end
--         mSleep(1000)
--         Utiliy.click(70, 100)
--         mSleep(3000)
--         data = {0x101010, "-64|59|0xffffff,-64|84|0xffffff", 90, 11, 6, 172, 141}
--         Utiliy.findColor(data, 370, 390)
--         mSleep(2000)
--     end

--     if (page == "红包界面") then
--         local data = {0xe69990, "21|0|0xe38a80,41|-4|0xde796d,80|6|0xdb6a5c", 90, 199, 939, 554, 1026}
--         Utiliy.findColor(data)
--     end
--     mSleep(1000)
-- end
-- nLog("结束")

-- x, y = tsFindText(index, "猜对", 554, 135, 609, 163, "0x204d6f,0x768e99", 90)
-- nLog(x .. " " .. y)
-- -- -- 如果需要联网
-- data = {0x7bafeb, "-2|28|0x92bae8,337|1|0x6ca6e6,336|28|0x007aff", 90, 0, 0, 750, 1334, { orient = 2 }}
-- Utiliy.findColor(data)
-- -- 如果网络异常
-- data = {0xdb6647, "124|1|0xdd6e45,-2|28|0xd65a4b,122|31|0xe6863e", 90, 0, 0, 750, 1334, { orient = 2 }}
-- Utiliy.findColor(data)

-- mSleep(1000)

-- data = {0xfad585, "102|-1|0xf2b55d,175|1|0xe78625,242|4|0xe88928", 90, 0, 0, 750, 1334, { orient = 2 }}
-- Utiliy.findColor(data,375,377)
