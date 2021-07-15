require("ClassBase")
AppLogicEngine = class("Engine")
ale = AppLogicEngine.new()

c1 = "c1"
c2 = "c2"
c3 = false
c5 = "c5"
c6 = "c6"

local list = {
    [1] = c1,
    [2] = c2,
    [3] = c3,
    [5] = c5,
    [6] = c6
}
link = {}
PageLogic = {
    {id = 1, link = {5, 2, 6}},
    {id = 2, link = 5},
    {id = 3, link = 2},
    {id = 5, link = {3, 6}},
    {id = 6}
}

function ale:ctor()
end

function ale:Go(list, page)
    if not type(page) == "table" then
        return
    end

    local pre_item = nil
    local item = page[1]
    local feature_name = nil -- 找到的特征
    local id = item.id
    local idx = 1
    local content = false
    while item do
        feature_name = ale:FindFeature(list, id)

        if feature_name then
            pre_item = item
            print("DO " .. feature_name)
            idx = 1
        end

        if item.link == nil then
            return
        end

        if feature_name == false then
            if type(pre_item.link) == "number" then
                id = pre_item.link
            else
                id = pre_item.link[idx]
            end
            idx = idx + 1
            item = ale:FindTab(page, id)
            content = true
        end
        if not content then
            -- 找link的id
            if (type(item.link) == "number") then
                id = item.link
                item = ale:FindTab(page, id)
            else
                -- if (type(item.link) == "table") then
                id = item.link[idx]
                item = ale:FindTab(page, id)
                idx = idx + 1
            end
        end
        content = false
    end
end

function ale:FindFeature(list, _id)
    for _k, _v in pairs(list) do
        if _k == _id then
            return _v
        end
    end
    return nil
end

function ale:FindTab(list, _id)
    for _, _v in pairs(list) do
        if _v.id == _id then
            return _v
        end
    end
    return nil
end

ale:Go(list, PageLogic)
