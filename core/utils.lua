-- stardust gateway
-- core utils 工具

local _M = {}
local ngx = ngx

--[[
    @comment 判断开关是否开启
    @param
    @return
]]
function _M.optionIsOn(options)
    if options:lower() == "on" then
        return true
    else
        return false
    end
end

--[[
    @comment 获取客户端IP
    @param
    @return
]]
function _M.getClientIp()
    local IP = ngx.var.remote_addr
    if IP == nil then
        IP = "unknown"
    end

    return IP
end

--[[
    @comment 获取过滤规则
    @param
    @return
]]

function _M.readRule(path,var)
    local file = io.open(path .. "/" .. var, "r")
    if file == nil then
        return
    end
    local ret = {}
    for line in file:lines() do
        table.insert(ret, line)
    end
    file:close()

    return ret
end

return _M