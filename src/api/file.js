import request from '@/utils/http'

const prefix = '/api/files' // 设置您的固定前缀

// 上传
export const upload = () => {
  return request({
    url: `${prefix}/upload`, // 在请求的URL前添加固定前缀
    method: 'get'
  })
}
