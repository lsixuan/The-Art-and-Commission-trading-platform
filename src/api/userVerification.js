import request from '@/utils/http'

const prefix = '/userVerification'

// 注册
export const register = (data) => {
  return request({
    url: `${prefix}/register`,
    method: 'post',
    data
  })
}

// 审核
export const audit = (data) => {
  return request({
    url: `${prefix}/audit`,
    method: 'put',
    data
  })
}

// 更新
export const update = (data) => {
  return request({
    url: `${prefix}/update`,
    method: 'put',
    data
  })
}

// 获取用户信息
export const getUserInfo = (id) => {
  return request({
    url: `${prefix}/info/${id}`,
    method: 'get'
  })
}

// 删除用户
export const deleteUsers = (ids) => {
  return request({
    url: `${prefix}/delete`,
    method: 'delete',
    data: ids
  })
}

// 分页查询
export const getPage = (params) => {
  return request({
    url: `${prefix}/page`,
    method: 'get',
    params
  })
}
