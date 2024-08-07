<template>
  <div>
    <Header :defaultActive="defaultActive"/>
    <main>
      <div v-for="artist in artists" :key="artist.id">
        <ul>
          <li class="hsbox">
            <router-link :to="{ path: '/profiles', query: { id: artist.id } }">
              <img :src="artist.avatar" alt="">
            </router-link>
            <div>
              <p>{{ artist.userName }}</p>
              <p>{{ artist.count }} works {{ artist.introduction }}</p>
              <router-link :to="{ path: '/profiles', query: { id: artist.id } }">
                <el-button type="primary" size="small">View Profile</el-button>
              </router-link>
            </div>
          </li>
          <li v-for="(image, index) in artist.albumImages.slice(0, 5)" :key="index">
            <img :src="image.imageSrc" alt="">
          </li>
        </ul>
        <hr color="#eee" size="1" style="margin: 20px 0;">
      </div>

      <el-pagination
          @current-change="handleCurrentChange"
          :current-page.sync="currentPage"
          :page-size="pageSize"
          layout="prev, pager, next, jumper"
          :total="total">
      </el-pagination>
    </main>
  </div>
</template>

<script>
import Header from '@/pages/Header/Header.vue'
import {getAllArtList} from '@/api/user' // Assuming the API method is located at this position

export default {
  name: 'Artists',
  components: {Header},
  data() {
    return {
      defaultActive: '2',
      artists: [],
      currentPage: 1,
      pageSize: 10,
      total: 0
    }
  },
  created() {
    this.fetchArtists()
  },
  methods: {
    async fetchArtists() {
      try {
        const response = await getAllArtList({
          current: this.currentPage,
          size: this.pageSize
        })
        if (response.code === 0) {
          this.artists = response.data.records
          this.total = response.data.total
        } else {
          console.error('Failed to fetch artists:', response)
        }
      } catch (error) {
        console.error('Error fetching artists:', error)
      }
    },
    handleCurrentChange(val) {
      this.currentPage = val
      this.fetchArtists()
    }
  }
}
</script>


<style scoped lang="scss">
main {
  padding: 150px 100px;
  background-color: #fff;

  ul {
    display: flex;
    justify-content: space-between;

    li {
      img {
        width: 178px;
        height: 178px;
        border: 1px solid #eee;
        border-radius: 5px;
        transition: .2s;
      }

      &:hover {
        box-shadow: 0 0 10px #dbd9d9;
      }
    }
  }

  .hsbox {
    display: flex;
    align-items: center;
    margin-right: 20px;

    img {
      width: 64px;
      height: 64px;
      border-radius: 50%;
      margin-right: 20px;
    }

    &:hover {
      box-shadow: none;
    }

    p {
      margin-bottom: 10px;
      font-size: 14px;
      color: #555;
    }
  }
}
</style>
