import request from '@/utils/http'

const prefix = '/users'

// 登录
export const login = (data) => {
  return request({
    url: `${prefix}/login`,
    method: 'post',
    data: data
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
// 分页查询
export const getAllArtList = (params) => {
  return request({
    url: `${prefix}/allArtList`,
    method: 'get',
    params
  })
}
// 获取用户信息
export const getInfoById = (params) => {
  return request({
    url: `${prefix}/infoById`,
    method: 'get',
    params
  })
}
// 重置密码
export const resetPassword = (params) => {
  return request({
    url: `${prefix}/resetPassword`,
    method: 'get',
    params
  })
}

// 退出登录
export const logout = () => {
  return request({
    url: `${prefix}/logout`,
    method: 'get'
  })
}


// 获取用户信息
export const getUserInfo = (id) => {
  return request({
    url: `${prefix}/info/${id}`,
    method: 'get'
  })
}

// 获取当前用户session信息
export const getCurrentUser = () => {
  return request({
    url: `${prefix}/session`,
    method: 'get'
  })
}

// 更新用户信息
export const updateUser = (data) => {
  return request({
    url: `${prefix}/update`,
    method: 'post',
    data
  })
}

/**
 * 新增用户*/
export const save = (data) => {
  return request({
    url: `${prefix}/save`,
    method: 'post',
    data
  })
}
// 删除用户
export const deleteUsers = (ids) => {
  return request({
    url: `${prefix}/delete`,
    method: 'post',
    data: ids
  })
}
