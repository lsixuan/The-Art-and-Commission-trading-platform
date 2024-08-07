import request from '@/utils/http'

const prefix = '/albumImages'

// Create a new album image
export const createAlbumImage = (data) => {
  return request({
    url: `${prefix}/save`,
    method: 'post',
    data
  })
}

// Update an existing album image
export const updateAlbumImage = (data) => {
  return request({
    url: `${prefix}/update`,
    method: 'put',
    data
  })
}

// Get album image information by ID
export const getAlbumImageInfo = (id) => {
  return request({
    url: `${prefix}/info/${id}`,
    method: 'get'
  })
}

// Delete album images
export const deleteAlbumImages = (ids) => {
  return request({
    url: `${prefix}/delete`,
    method: 'delete',
    data: ids
  })
}

// Get paginated album images
export const getAlbumImagesPage = (params) => {
  return request({
    url: `${prefix}/list`,
    method: 'get',
    params:params
  })
}
