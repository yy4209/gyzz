### 接口返回格式

## 单条数据:
> 异常:
```javascript
{ 
    "status":1,
    "msg":"错误原因",
    "data":{}
}
```
> 正常:
```javascript
{
    "status":0,
    "msg":"",
    "data":{
        "id":"1",
        "name":"wb"
    }
}
```
## 多条数据:
> 异常:
```javascript
{
    "status":1,
    "msg":"错误原因",
    "data":{}
}
```
> 正常:
```javascript
{
    "status":0,
    "msg":"",
    "data":{
        "page":{
            "totalNum":4,
            "totalPage":2,
            "currentPage":1
        },
        "list":[
            {
                "id":267,
                "city":"Wuhan"
            },
            {
                "id":266,
                "city":"Nanjin"
            }
        ]
    }
}
```