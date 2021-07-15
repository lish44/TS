require("Lib")

function ce(tb)
   return {{tb[1],tb[2]},{tb[3],tb[4]}} 
end

MainPage = {
    SubPage = {
        Find = {t.s.Name,Enum.FMCIRF}, -- 找特征
        DoOpt = {ac:AreaHit(t.p.Name)},-- 操作
        Sleep = 1000,-- 睡眠
        State = 0,--当前mainpage的状态
        ChangeState = 0,
        Frequency = {1000,3000}, -- 随机睡眠
        FeatureExclude = nil, -- 排除特征
        Exit
    }
}

t = {
    sytle = {
       
    },
    point = {
     
    }
}

t.sytle.ceshi = {0xe3e3e7, "34|34|0xcbcbd0,33|74|0xa8a8ad,88|79|0x2e2e2f", 90, 0, 0, 750, 1334}
t.point.ceshi = {70,591,23,45}

主界面 = {

    测试 = {
        Find = {t.sytle.ceshi,Enum.FMCIRF};
        DoOpt = {ce(t.point.ceshi),1000,{23,45}};
        Sleep = 2000;
    };
};
-- runApp("com.redgame.guesssong.ios");
InitDeviceDirection(Down);
Engine(主界面,nil,nil,10);


-- 1768 136.3 
-- 1056 181
