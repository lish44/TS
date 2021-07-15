require("TSLib")
require("Page")

function GetPage(_pageList)
    for k, v in pairs(_pageList) do
        x, y =
            findMultiColorInRegionFuzzy(
            v.style[2],
            v.style[3],
            v.style[4],
            v.style[5],
            v.style[6],
            v.style[7],
            v.style[8]
        )
        if (x > -1 or y > -1) then
            return v.style[1]
        end
    end
    return nil
end
