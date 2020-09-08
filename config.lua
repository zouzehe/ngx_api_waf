-- stardust gateway
-- config 配置

local _M = {
    RulePath = "/www/web/ngx_api_gateway/rule",
    BlockApi = "on",
    LogSwitch= "on",
    LogPath  = "/data/logs/nginx_log/gateway",
}

return _M