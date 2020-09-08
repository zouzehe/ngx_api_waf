-- stardust gateway
-- init 初始化

local M = {}
local conf = require("config")
local say = require("core.say")
local logger  = require("core.log")
local utils  = require("core.utils")

local rule_path = conf.RulePath
local block_api = conf.BlockApi

local _M = {}

--[[
    @comment bolck api
    @param
    @return
]]
function _M.blockApi()
    if utils.optionIsOn(block_api) then
        local g_api_rules = utils.readRule(rule_path,"block_apis")
        if g_api_rules and type(g_api_rules) == 'table' then
            for _, rule in pairs(g_api_rules) do
                if ngx.var.uri == rule then
                    logger.log(rule, "api in block lists. ")
                    say.failed(10403,"Temporarily closed")
                    return true
                end
            end
        end
    end

    return false
end

return _M