import request from '@/utils/http'

const prefix = '/artistNoDate'

// 保存艺术家不可用日期
export const saveArtistNoDate = (data) => {
    return request({
        url: `${prefix}/save`,
        method: 'post',
        data
    })
}

// 根据日期删除艺术家不可用日期
export const deleteArtistNoDateByDate = (data) => {
    return request({
        url: `${prefix}/deleteByDate`,
        method: 'post',
        data
    })
}

// 根据用户ID删除所有艺术家不可用日期
export const deleteArtistNoDateByUserId = () => {
    return request({
        url: `${prefix}/deleteByUserId`,
        method: 'get'
    })
}

// 获取当前用户的所有不可用日期列表
export const getArtistNoDateList = () => {
    return request({
        url: `${prefix}/list`,
        method: 'get'
    })
}
// 获取当前用户的所有不可用日期列表
export const getArtistNoDateListByUserId = (params) => {
    return request({
        url: `${prefix}/listByUserId`,
        method: 'get',
        params: params
    })
}
