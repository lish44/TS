local Action = class("Action");

Enum = {}
Enum.FMCIRF = 1 -- 区域多点找色
Enum.MC = 2 -- 多组颜色比色
Enum.FCIRF = 3 -- 区域单点找色

function Action:ctor()
    self.base_x = 0
    self.base_y = 0
end

function Action:MulitOpt(opt)
    local t = type(opt);
    if t == "function" then opt() end

end

function Action:FindColorOpt(data, enum)
    local x = -1
    local y = -1
    if (enum == Enum.FMCIRF) then
        x, y = findMultiColorInRegionFuzzy(data[1], data[2], data[3], data[4],
                                           data[5], data[6], data[7],
                                           data[8] or {orient = 2});
    elseif (enum == Enum.MC) then
        local isfind = muColors(data.tb1, data.tb2, data.option)
        if isfind then
            x = data.tb1[1]
            y = data.tb1[2]
        end
    elseif (enum == Enum.MC) then
        x, y = findColorInRegionFuzzy(data[1], data[2], data[3], data[4],
                                      data[5], data[6])
    end

    return x, y

end

ac = Action.new();
