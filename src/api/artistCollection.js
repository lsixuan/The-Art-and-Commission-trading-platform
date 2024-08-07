import request from '@/utils/http'

const prefix = '/artistCollection'

// Create a new artist collection
export const createArtistCollection = (data) => {
    return request({
        url: `${prefix}/save`,
        method: 'post',
        data
    })
}

// Update an existing artist collection
export const updateArtistCollection = (data) => {
    return request({
        url: `${prefix}/update`,
        method: 'put',
        data
    })
}

// Get artist collection information by ID
export const getArtistCollectionInfo = (id) => {
    return request({
        url: `${prefix}/info/${id}`,
        method: 'get'
    })
}

// Delete artist collections
export const deleteArtistCollections = (ids) => {
    return request({
        url: `${prefix}/delete`,
        method: 'delete',
        data: ids
    })
}

// Get paginated artist collections
export const getArtistCollectionsList = (params) => {
    return request({
        url: `${prefix}/list`,
        method: 'get',
        params
    })
}
