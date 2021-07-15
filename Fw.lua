local Action = class("Action")

ac = Action.new()

Enum = {}
Enum.FMCIRF = 1 -- 区域多点找色
Enum.MC = 2 -- 多组颜色比色
Enum.FCIRF = 3 -- 区域单点找色

function ac:ctor()
    self.base_x = 0
    self.base_y = 0
end

function ac:MulitOpt(opt)
    local t = type(opt)
    if t == "function" then
        opt()
    end
end

function ac:FindColorOpt(data, enum)
    local x = -1
    local y = -1
    if (enum == Enum.FMCIRF) then
        x, y =
            findMultiColorInRegionFuzzy(
            data[1],
            data[2],
            data[3],
            data[4],
            data[5],
            data[6],
            data[7],
            data[8] or {orient = 2}
        )
    elseif (enum == Enum.MC) then
        -- local isfind = muColors(data.tb1, data.tb2, data.option)
        local tb1, tb2 = ac:MuColorConver(data)
        local isfind = muColors(tb1, tb2)
        if isfind then
            x = tb1[1][1]
            y = tb1[1][2]
            nLog(x)
        end
    elseif (enum == Enum.MC) then
        x, y = findColorInRegionFuzzy(data[1], data[2], data[3], data[4], data[5], data[6])
    end

    return x, y
end

-- ...格式必须是{x1,y1,x2,y2}
function ac:AreaHit(...)
    return ...
end

-- 格式必须是{x1,y1,x2,y2}
function ac:Slider(p)
    return {{p[1], p[2]}, {p[3], p[4]}}
end
function ac:MuColorConver(data)
    local color_table1 = {
        data[1],
        data[2],
        data[3],
        data[4],
        data[5]
    }
    local color_table2 = {
        data[6],
        data[7],
        data[8],
        data[9]
    }
    return color_table1, color_table2
    -- return {{data[1], data[2], data[3], data[4], data[5]}, {data[6], data[7], data[8], data[9]}}
end
