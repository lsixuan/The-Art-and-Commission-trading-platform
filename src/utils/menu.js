const menu = {
    list() {
        return [{
            "backMenu": [{ "child": [{ "appFrontIcon": "cuIcon-vipcard", "buttons": ["newly added", "view", "modify", "delete"], "menu": "user", "menuJump": "list", "tableName": "yonghu" }], "menu": "user management " }, { "child": [{ "appFrontIcon": "cuIcon-album", "buttons": ["newly added", "view", "modify", "delete"], "menu": "artist", "menuJump": "list", "tableName": "shangjia" }], "menu": "Artist Management" }, { "child": [{ "appFrontIcon": "cuIcon-send", "buttons": ["newly added", "view", "modify","delete"], "menu": "Classification of Artworks", "menuJump": "List", "tableName": "shangpinfenlei" }], "menu": "Classification Management of Artworks" }, { "child": [{ "appFrontIcon": "cuIcon-pay", "buttons": ["Add", "View", "Change", "Delete", "Examine", "View comments"], "menu": "Artwork information", "menuJump": "List", "tableName": "shangpinxinxi" }], "menu": "Artwork information management" }, { "child": [{ "appFrontIcon": "cuIcon-discover", "buttons": ["Add", "View", "Change", "Delete"], "menu": "Knowledge sharing", "menuJump": "List", "tableName": "gonggaoxinxi" }], "menu": "Knowledge sharing management" }, { "child": [{ "appFrontIcon": "cuIcon-favor", "buttons": ["Add", "View", "Change", "Delete"], "menu": "My Collection Management", "tableName": "storeup" }], "menu": "My Collection Management" }, { "child": [{ "appFrontIcon": "cuIcon-cardboard", "buttons": ["View", "Change", "Reply", "Delete"], "menu": "Online forum management", "tableName": "messages" }], "menu": "Online forum management" }, { "child": [{ "appFrontIcon": "cuIcon-service", "buttons": ["Add", "View", "Change", "Delete"], "menu": "Online Service ", "tableName": "chat" }, { "appFrontIcon": "cuIcon-present", "buttons": ["Change", "Delete", "Add", "View"], "menu": "Carousel management", "tableName": "config" }], "menu": "system management" }], "frontMenu": [{ "child": [{ "appFrontIcon": "cuIcon-qrcode", "buttons": ["View"], "menu": "List of Artwork Information", "menuJump": "List", "tableName": "shangpinxinxi" }], "menu": "Artwork information module" }, { "child": [{ "appFrontIcon": "cuIcon-album", "buttons": ["View"], "menu": "Knowledge Sharing List", "menuJump": "List", "tableName": "gonggaoxinxi" }], "menu": "Knowledge sharing module" }], "hasBackLogin": "Yes", "hasBackRegister": "No", "hasFrontLogin": "No", "hasFrontRegister": "No", "roleName": "Admin", "tableName": "users"}, { "backMenu": [{ "child": [{ "appFrontIcon": "cuIcon-pay", "buttons": ["View", "View comments"], "menu": "Artwork Information", "menuJump": "List", "tableName": "shangpinxinxi" }], "menu": "Artwork information management" }, { "child": [{ "appFrontIcon": "cuIcon-discover", "buttons": ["查看"], "menu": "知识分享", "menuJump": "列表", "tableName": "gonggaoxinxi" }], "menu": "知识分享管理" }], "frontMenu": [{ "child": [{ "appFrontIcon": "cuIcon-qrcode", "buttons": ["查看"], "menu": "商品信息列表", "menuJump": "列表", "tableName": "shangpinxinxi" }], "menu": "商品信息模块" }, { "child": [{ "appFrontIcon": "cuIcon-album", "buttons": ["查看"], "menu": "知识分享列表", "menuJump": "列表", "tableName": "gonggaoxinxi" }], "menu": "知识分享模块" }], "hasBackLogin": "否", "hasBackRegister": "否", "hasFrontLogin": "是", "hasFrontRegister": "是", "roleName": "用户", "tableName": "yonghu" }, { "backMenu": [{ "child": [{ "appFrontIcon": "cuIcon-pay", "buttons": ["新增", "查看", "修改", "删除", "查看评论", "审核"], "menu": "商品信息", "menuJump": "列表", "tableName": "shangpinxinxi" }], "menu": "商品信息管理" }, { "child": [{ "appFrontIcon": "cuIcon-keyboard", "buttons": ["新增", "查看", "修改", "删除", "导出", "日销量", "月销量", "年销量", "品销量", "类销量", "日销额", "月销额", "年销额", "品销额", "类销额", "物流"], "menu": "已完成订单", "tableName": "orders/已完成" }, { "appFrontIcon": "cuIcon-goods", "buttons": ["新增", "查看", "修改", "删除", "导出", "日销量", "月销量", "年销量", "品销量", "类销量", "日销额", "月销额", "年销额", "品销额", "类销额", "确认收货", "物流"], "menu": "已发货订单", "tableName": "orders/已发货" }, { "appFrontIcon": "cuIcon-qrcode", "buttons": ["新增", "查看", "修改", "删除", "导出", "日销量", "月销量", "年销量", "品销量", "类销量", "日销额", "月销额", "年销额", "品销额", "类销额"], "menu": "未支付订单", "tableName": "orders/未支付" }, { "appFrontIcon": "cuIcon-qrcode", "buttons": ["新增", "查看", "修改", "删除", "导出", "日销量", "月销量", "年销量", "品销量", "类销量", "日销额", "月销额", "年销额", "品销额", "类销额"], "menu": "已取消订单", "tableName": "orders/已取消" }, { "appFrontIcon": "cuIcon-present", "buttons": ["新增", "查看", "修改", "删除", "导出", "日销量", "月销量", "年销量", "品销量", "类销量", "日销额", "月销额", "年销额", "品销额", "类销额", "发货", "物流", "核销"], "menu": "已支付订单", "tableName": "orders/已支付" }, { "appFrontIcon": "cuIcon-attentionfavor", "buttons": ["新增", "查看", "修改", "删除", "导出", "日销量", "月销量", "年销量", "品销量", "类销量", "日销额", "月销额", "年销额", "品销额", "类销额", "物流"], "menu": "已退款订单", "tableName": "orders/已退款" }], "menu": "订单管理" }], "frontMenu": [{ "child": [{ "appFrontIcon": "cuIcon-qrcode", "buttons": ["查看"], "menu": "商品信息列表", "menuJump": "列表", "tableName": "shangpinxinxi" }], "menu": "商品信息模块" }, { "child": [{ "appFrontIcon": "cuIcon-album", "buttons": ["查看"], "menu": "知识分享列表", "menuJump": "列表", "tableName": "gonggaoxinxi" }], "menu": "知识分享模块" }], "hasBackLogin": "是", "hasBackRegister": "是", "hasFrontLogin": "是", "hasFrontRegister": "否", "roleName": "商家", "tableName": "shangjia" }]
    }
}
export default menu;
