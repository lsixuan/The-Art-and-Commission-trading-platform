import request from '@/utils/http'

const prefix = '/albums'

// Create a new album
export const createAlbum = (data) => {
  return request({
    url: `${prefix}/save`,
    method: 'post',
    data
  })
}

// Update an existing album
export const updateAlbum = (data) => {
  return request({
    url: `${prefix}/update`,
    method: 'put',
    data
  })
}

// Get album information by ID
export const getAlbumInfo = (id) => {
  return request({
    url: `${prefix}/info/${id}`,
    method: 'get'
  })
}

// Delete albums
export const deleteAlbums = (ids) => {
  return request({
    url: `${prefix}/delete`,
    method: 'delete',
    data: ids
  })
}

// Get paginated albums
export const getAlbumsPage = (params) => {
  return request({
    url: `${prefix}/page`,
    method: 'get',
    params
  })
}
