---@diagnostic disable: undefined-global
require("TSLib")
Down = 0
Left = 2
Right = 1
-- glSettings({switch = "1101", x1 = 524, y1 = 0, x2 = 1386, y2 = 54,tsp_switch = false})
CONTENTS_CLICK = ""
Exit = 1

function InitDeviceDirection(direction)
    init(direction)
    -- nLog('初始化方向成功')
end

function rnd(n1, n2, switch)
    if switch then
        if switch == 1 then
            return rndP({n1, n2})
        end
    end
    return {n1, n2}
end

function rndP(tab)
    -- body
    math.randomseed(getRndNum())
    return math.random(tab[1], tab[2])
end

function clickP(p)
    -- body
    if #p == 2 then
        randomTap(p[1], p[2])
    elseif #p == 4 then
        local x = math.random(p[1], p[3])
        local y = math.random(p[2], p[4])
        randomTap(x, y)
    end
end

function slidP(p)
    -- body
    -- body
    local p1 = p[1]
    local p2 = p[2]

    local X1, Y1 = p1[1] + rnd(20, 30, 1), p1[2] + rnd(20, 30, 1)
    local X2, Y2 = p2[1] + rnd(20, 30, 1), p2[2] + rnd(20, 30, 1)
    local jD = rnd(20, 40, 1)
    local d = math.floor((((X2 - X1) ^ 2 + (Y2 - Y1) ^ 2) ^ (1 / 2)) / (jD or 20))
    local x, y = (X2 - X1) / d, (Y2 - Y1) / d
    touchDown(1, X1, Y1)
    for i = 1, d do
        touchMove(1, X1 + x * i + rnd(i, i + 5, 1), Y1 + y * i + rnd(i, i + 5, 1))
        mSleep(rnd(10, 15, 1))
    end
    touchUp(1, X2, Y2)
end

function click(x, y)
    -- body
    local x1 = x or 0
    local y1 = y or 0
    return {x1, y1, "默认点击"}
end

function sleep(time1, time2)
    -- body
    if time2 then
        local time = rnd(time1, time2, 1)
        return time
    else
        return time1
    end
end

function Point(x, y, pX, pY)
    local rX = pX or 0
    local rY = pY or 0
    local px = math.random(0, rX)
    local py = math.random(0, rY)
    --    nLog(x+px)
    --    nLog(y+px)
    return {x + px, y + py}
end

function Range(x1, y1, x2, y2)
    return {x1, y1, x2, y2}
end

function slid(p1, p2)
    return {p1, p2}
end

function findmulcolor(tz)
    -- body
    local x, y = -1, -1
    if #tz == 7 then
        -- nLog("识色")
        x, y = findMultiColorInRegionFuzzy(tz[1], tz[2], tz[3], tz[4], tz[5], tz[6], tz[7], tz[8] or {orient = 2})
    elseif #tz == 8 then
        nLog("识字")
        x, y = tsFindText(tz[1], tz[2], tz[3], tz[4], tz[5], tz[6], tz[7], tz[8])
    end
    if x > 0 then
        -- nLog("找到了"..tz.name)
        return x, y
    else
        return -1, -1
    end
end
function findmulcolorsAll(...)
    -- body
    if ... == nil then
        -- nLog("123")
        return -1, -1
    end
    local x, y = -1, -1
    for k, v in pairs(...) do
        x, y = findmulcolor(...)
        if x < 0 then
            return x, y
        end
    end
    return x, y
end
function findmulcolorsOne(...)
    -- body
    if ... == nil then
        -- nLog("123")
        return -1, -1
    end
    local x, y = -1, -1
    for k, v in pairs(...) do
        x, y = findmulcolor(...)
        if x > 0 then
            return x, y
        end
    end
    return x, y
end
-- 结束任务
function TaskOver(...)
    mSleep(10)
    return Exit
end
-- 执行操作 p：任意类型 pointFound：点
function DoOptFc(p, pointFound)
    -- body
    local str = type(p)
    -- nLog(str)
    if str == "number" then
        local rs = math.random(p * 0.9, p * 1.1)
        CONTENTS_CLICK = "「睡眠」" .. p .. "ms" .. "「实际睡眠」" .. rs .. "ms"
        nLog(CONTENTS_CLICK)
        mSleep(rs)
    elseif str == "table" then
        if #p == 3 then
            if type(p[1]) == "number" then
                CONTENTS_CLICK = "「默认点击坐标1」" .. pointFound[1] .. "+" .. p[1] .. "," .. pointFound[2] .. "+" .. p[2]
                nLog(CONTENTS_CLICK)
                randomTap(pointFound[1] + p[1], pointFound[2] + p[2])
            else
                local rx = rndP(p[1])
                local ry = rndP(p[2])
                CONTENTS_CLICK = "「默认点击坐标2」" .. pointFound[1] .. "+" .. rx .. "," .. pointFound[2] .. "+" .. ry
                nLog(CONTENTS_CLICK)
                randomTap(pointFound[1] + rx, pointFound[2] + ry)
            end
        elseif #p == 2 then
            if type(p[1]) == "table" then
                CONTENTS_CLICK = "「滑动」" .. p[1][1] .. "," .. p[1][2] .. "--->" .. p[2][1] .. "," .. p[2][2]
                nLog(CONTENTS_CLICK)
                slidP(p)
            else
                CONTENTS_CLICK = "「点击坐标」" .. p[1] .. "," .. p[2]
                nLog(CONTENTS_CLICK)
                clickP(p)
            end
        elseif #p == 4 then
            CONTENTS_CLICK = "「范围点击坐标」" .. p[1] .. "," .. p[2] .. "," .. p[3] .. "," .. p[4]
            nLog(CONTENTS_CLICK)
            clickP(p)
        end
    elseif str == "string" then
        CONTENTS_CLICK = "「输入文字」" .. p
        nLog(CONTENTS_CLICK)
        inputText(p)
    elseif str == "function" then
        CONTENTS_CLICK = "「执行函数」"
        nLog(CONTENTS_CLICK)
        if p() == Exit then
            return Exit
        end
    end
end
-- 执行多个操作
function MulitOptfFc(tab, pointFound)
    -- body
    for k, v in pairs(tab) do
        if DoOptFc(v, pointFound) == Exit then
            return Exit
        end
        mSleep(100)
    end
end

function Engine(jobs, fcNotFound, second, time)
    -- body
    local featureNotFound = true -- 所有特征找不到
    local NntryTime = os.time() -- 动作进入的时间
    local runTimes = 0 -- 动作运行的时间
    local curState = 0 -- 当前状态
    while (true) do
        -- curState = 0;
        featureNotFound = true
        for k, v in pairs(jobs) do
            local jobState = 0
            if v.State then
                jobState = v.State
            else
                jobState = 0
            end
            if findmulcolorsOne(v.FeatureExclude) > 0 then
                nLog("「排除特征-跳过动作」" .. "-- " .. k)
            else
                local x, y = findmulcolorsAll(v.Find)
                if (jobState == 0 or jobState == curState) and x > 0 then
                    nLog("「当前状态」" .. "-- " .. curState)
                    featureNotFound = false
                    NntryTime = os.time()
                    nLog("「找到动作」" .. "-- " .. k)
                    if v.Frequency then
                        if v.DoOpt then
                            if os.time() - v.Frequency[1] > v.Frequency[2] / 1000 then
                                v.Frequency[1] = os.time()
                                if MulitOptfFc(v.DoOpt, {x, y}) == Exit then
                                    nLog("「退出」" .. "-- " .. k)
                                    return
                                end
                            else
                                nLog(
                                    "「跳过动作」" ..
                                        k .. "「倒计时 " .. v.Frequency[2] - (os.time() - v.Frequency[1]) * 1000 .. "ms 」"
                                )
                            end
                        end
                    elseif v.DoOpt then
                        if MulitOptfFc(v.DoOpt, {x, y}) == Exit then
                            nLog("「退出」" .. "-- " .. k)
                            return
                        end
                    end
                    if v.Sleep then
                        nLog("「睡眠 " .. v.Sleep .. "ms 后执行」" .. " -- " .. k)
                        mSleep(v.Sleep)
                    end
                    if v.ChangeState then
                        nLog("「改变状态」" .. "-- " .. k)
                        curState = v.ChangeState
                        mSleep(100)
                    end
                    if v.Exit then
                        nLog("「结束任务」" .. "-- " .. k)
                        mSleep(10)
                        return
                    end
                end
            end
        end

        if featureNotFound then
            local timeDif = os.time() - NntryTime
            nLog("「所有特征找不到」" .. "-- " .. timeDif .. "s")
            if fcNotFound then
                if fcNotFound(timeDif) == Exit then
                    nLog("「退出-所有特征找不到」")
                    return
                end
            end
            if timeDif > 5 then
                curState = 0
            end
        end

        mSleep(1000)

        runTimes = runTimes + 1

        if second then
            if runTimes >= second then
                break
            end
        end

        if time then
            if os.time() - NntryTime > time then
                break
            end
        end
    end
end
function f(time1, time2)
    -- body
    local time = 100
    if time2 then
        time = math.random(time1, time2)
    elseif time1 then
        time = time1
    end
    return {-1, time}
end
