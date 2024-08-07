<template>


    <el-row :gutter="20">
      <el-col :span="6" v-for="artist in artistList" :key="artist.id">
        <el-card :body-style="{ padding: '0px' }">
          <img :src="artist.avatar" class="image" alt="Artist Avatar">
          <div style="padding: 14px;">
            <span>{{ artist.userName }}</span>
            <div class="bottom">
              <el-button type="text" class="button" @click="viewDetails(artist.id)">View Details</el-button>
            </div>
          </div>
        </el-card>
      </el-col>
    </el-row>

</template>

<script>
import { getArtistCollectionsList } from '@/api/artistCollection' // Please ensure that the path is correct

export default {
  name: 'ArtistCollectionList',
  data() {
    return {
      artistList: []
    }
  },
  created() {
    this.fetchArtistCollections()
  },
  methods: {
    async fetchArtistCollections() {
      try {
        const response = await getArtistCollectionsList()
        if (response.code === 0) {
          this.artistList = response.data
        } else {
          this.$message.error('Failed to fetch artist collections')
        }
      } catch (error) {
        console.error('Error fetching artist collections:', error)
        this.$message.error('An error occurred while fetching artist collections')
      }
    },
    viewDetails(id) {
      // You can add logic to view details here, such as navigating to the details page
      this.$router.push({ path: '/profiles', query: { id:id } })
      console.log('View details for artist with id:', id)
    }
  }
}
</script>

<style scoped>
.artist-collection-list {
  padding: 20px;
}
.el-row {
  margin-bottom: 20px;
}
.el-col {
  margin-bottom: 20px;
}
.image {
  width: 100%;
  min-width: 200px;
  height: 200px;
  display: block;
}
.bottom {
  margin-top: 13px;
  line-height: 12px;
}

</style>
