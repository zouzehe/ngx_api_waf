-- stardust gateway
-- core say 输出

local json = require("cjson.safe")
local ngx = ngx
local content_type = "application/json"

local _M = {}

local function jsonFormat(statsCode, msg, data)

    data = data or {}
    return json.encode({
            code = statsCode,
            message = msg,
            timestamp = ngx.time(),
            data = data
    })
end

--[[
    @comment success
    @param
    @return
]]
function _M.success(code,msg,content)

    msg = msg or "Success"
    ngx.header.content_type = content_type
    ngx.status = ngx.HTTP_OK
    ngx.say(jsonFormat(code, msg, content))
    ngx.exit(ngx.status)
end

--[[
    @comment failed
    @param
    @return
]]
function _M.failed(code, msg)

    msg = msg or "Failed"
    ngx.header.content_type = content_type
    ngx.status = ngx.HTTP_BAD_REQUEST

    ngx.say(jsonFormat(code, msg))
    ngx.exit(ngx.status)
end

return _M