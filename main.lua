require("Lib")
require("huahua")
function ce(tb)
   return {{tb[1],tb[2]},{tb[3],tb[4]}} 
end

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
        Find = t.sytle.ceshi;
        DoOpt = {ce(t.point.ceshi),1000,{23,45}};
        Sleep = 2000;
    };
};
-- runApp("com.redgame.guesssong.ios");
InitDeviceDirection(Down);
Engine(主界面,nil,nil,10);


