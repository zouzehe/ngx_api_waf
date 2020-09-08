# ngx_api_waf

## 概述：
基于openresty开发

## 功能
- api接口关闭

## 安装
- [openresty](http://openresty.org/en/)
- nginx.conf

```
lua_package_path "/path/to/project/?.lua";
init_by_lua_file /path/to/project/init.lua;
access_by_lua_file /path/to/project/index.lua;
```

## 配置
- config.lua

`配置开关` 


## 规则配置 rule
- block_apis
- 
`接口uri按行分割`

## 拦截示例
```json
{
    "timestamp": 1594965362,
    "code": 10403,
    "data": {},
    "message": "Temporarily closed"
}
```
