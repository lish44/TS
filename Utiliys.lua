require("TSLib")
--工具类
Utiliy = {}

-- 单击
function Utiliy.click(x, y)
    touchDown(x, y)
    mSleep(50)
    touchUp(x, y)
    mSleep(100)
end

--双击
function Utiliy.clickDouble(x, y)
    tap(x, y)
    mSleep(50)
    tap(x, y)
    mSleep(100)
end

function Utiliy.findColor(data, selfx, selfy)
    x, y = findMultiColorInRegionFuzzy(data[1], data[2], data[3], data[4], data[5], data[6], data[7], {orient = 2})
    mSleep(100)
    if x ~= -1 and y ~= -1 then
        if (selfx ~= nil and selfy ~= nil) then
            Utiliy.click(selfx, selfy)
        else
            Utiliy.click(x, y)
        end
        return true
    else
        nLog("未找到点")
        return nil
    end
end
