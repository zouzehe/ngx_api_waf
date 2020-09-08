-- stardust gateway
-- core log 日志

local utils = require("core.utils")
local conf  = require("config")
local _M = {}
local ngx = ngx

local log_switch= conf.LogSwitch
local log_path  = conf.LogPath

--[[
    @comment 写文件操作
    @param
    @return
]]
local function write(logfile, msg)
    local fd = io.open(logfile, "ab")
    if fd == nil then
        return
    end
    fd:write(msg)
    fd:flush()
    fd:close()
end

--[[
    @comment 写日志操作
    @param
    @return
]]
function _M.log(data, ruletag)
    local request_method = ngx.req.get_method()
    local url = ngx.var.request_uri
    if utils.optionIsOn(log_switch) then
        local realIp = utils.getClientIp()
        local ua = ngx.var.http_user_agent
        local servername = ngx.var.server_name
        local time = ngx.localtime()
        local line = ''
        if ua then
            line = realIp .. " [" .. time .. "] " .. request_method .. " \"" .. servername .. url .. "\" \"" .. data .. "\"  \"" .. ua .. "\" \"" .. ruletag .. "\"\n"
        else
            line = realIp .. " [" .. time .. "] " .. request_method .. " \"" .. servername .. url .. "\" \"" .. data .. "\" - \"" .. ruletag .. "\"\n"
        end

        write(log_path .. "/api.log", line)
    end
end

return _M