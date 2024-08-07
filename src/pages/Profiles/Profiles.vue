<template>
  <div class="profile-container">
    <Header :defaultActive="defaultActive" />
    <div class="background-container">
      <img :src="userInfo.homepageBackground" alt="Background" class="background-image">
    </div>
    <main>
      <div class="user-info">
        <div class="user-left">
          <img :src="userInfo.avatar" alt="Avatar" class="avatar">
          <p>{{ userInfo.name }}</p>
        </div>
        <div class="user-right">
<!--          <el-button style="width: 200px;" type="warning">Booking</el-button>-->
          <el-button style="width: 200px;" type="primary" @click="colllect()" v-if="role==1">Add in my list</el-button>
        </div>
      </div>
      <div class="hs-info">
        <p>Artist Introduction</p>
        <p class="hstext">
          {{ userInfo.introduction }}
        </p>
      </div>
      <el-menu :default-active="activeIndex" class="el-menu-demo" mode="horizontal" @select="handleSelect">
        <el-menu-item index="1" style="margin-right: 50px;">Exhibition of works</el-menu-item>
        <el-menu-item index="2">Reputation evaluation</el-menu-item>
        <el-menu-item index="3">NoDate</el-menu-item>
      </el-menu>
      <div class="good-pic-list" v-if="activeIndex === '1'">
        <ul>
          <li v-for="image in userInfo.albumImages" :key="image.id">
            <el-image
                :src="image.imageSrc"
                :preview-src-list="[image.imageSrc]"
                fit="cover"
                class="album-image">
            </el-image>
          </li>
        </ul>
      </div>
      <div class="evaluate-list" v-else-if="activeIndex === '2'">
        <div class="evaluate" v-for="item in 10" :key="item">
          <div class="evname">
            <div class="ev-left">
              <img src="../../assets/user.png" alt="">
              <span>ALICE</span>
              <el-tag>10th collaboration</el-tag>
            </div>
            <div class="ev-right">
              <el-rate v-model="rateVal"></el-rate>
            </div>
          </div>
          <div class="evprice">
            <h2>Chinese Style Project - Character Design</h2>
            <p>500-2000฿</p>
          </div>
          <p class="evtext">Patient and responsible，Smooth communication，nice！</p>
          <div class="evfooter">
            <p>2024-05-21</p>
            <p>...</p>
          </div>
        </div>
      </div>
      <div class="evaluate-list" v-else-if="activeIndex === '3'">
        <select-date
            :read-only="true"
        />
      </div>
    </main>
  </div>
</template>

<script>
import Header from '@/pages/Header/Header.vue'
import { getInfoById } from '@/api/user'
import { createArtistCollection } from '@/api/artistCollection'
import selectDate from "@/pages/Profiles/selectDate.vue";
export default {
  name: 'Profiles',
  components: {
    Header,
    selectDate
  },
  data() {
    return {
      activeIndex: '1',
      rateVal: 5,
      userInfo: {},
      defaultActive: '3',
      defaultRole: 1
    }
  },
  computed: {
    role(){
      const currentUser = JSON.parse(localStorage.getItem('currentUser'));
      return currentUser && currentUser.role ? currentUser.role : this.defaultRole;
    }
  },
  methods: {
    colllect(){
      createArtistCollection({artistId: this.$route.query.id}).then(res => {
        if(res.code === 0||res.code === 200){
          this.$message({
            message: 'Added successfully',
            type: 'success'
          })
        }else{
          this.$message({
            message: res.msg,
            type: 'error'
          })
        }
      })
    },
    handleSelect(key) {
      this.activeIndex = key
    },
    async fetchUserInfo() {
      try {
        const id = this.$route.query.id
        const response = await getInfoById({ id: id })
        if (response.code === 0) {
          this.userInfo = response.data
        } else {
          console.error('Failed to fetch user info')
        }
      } catch (error) {
        console.error('Error fetching user info:', error)
      }
    }
  },
  mounted() {
    this.fetchUserInfo()
  }
}
</script>

<style scoped lang="scss">
.profile-container {
  position: relative;
}

.background-container {
  height: 600px;
  overflow: hidden;
  position: relative;
  z-index: 1;
}

.background-image {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

main {
  position: relative;
  z-index: 2;
  background-color: #fff;
  margin-top: -50px;
  padding: 0 150px 100px;
  border-radius: 15px 15px 0 0;
}

.user-info {
  display: flex;
  justify-content: space-between;
  align-items: flex-end;
  padding-top: 20px;

  .user-left {
    display: flex;
    align-items: center;

    .avatar {
      width: 100px;
      height: 100px;
      border-radius: 50%;
      object-fit: cover;
      border: 3px solid #fff;
      box-shadow: 0 2px 4px rgba(0,0,0,0.1);
      margin-top: -50px;
    }

    p {
      font-size: 24px;
      margin-left: 30px;
    }
  }
}

.hs-info {
  padding: 30px 0 60px;

  .hstext {
    width: 500px;
    font-size: 14px;

    span {
      color: #00a8e9;
    }
  }
}

.good-pic-list {
  ul {
    display: flex;
    flex-wrap: wrap;
    gap: 20px;

    li {
      flex: 0 0 calc(25% - 15px);
      max-width: calc(25% - 15px);
    }
  }
}

.album-image {
  width: 100%;
  height: 200px;
  border-radius: 5px;
  cursor: pointer;
}

.evaluate-list {
  display: flex;
  justify-content: space-between;
  flex-wrap: wrap;
  margin-top: 20px;
}

.evaluate {
  width: 45%;
  padding: 15px;
  border-bottom: 1px solid #eee;

  .evname {
    display: flex;
    justify-content: space-between;
    align-items: center;

    .ev-left {
      display: flex;
      align-items: center;

      img {
        width: 40px;
        height: 40px;
        border-radius: 50%;
      }

      span {
        margin: 0 15px;
      }
    }
  }

  .evprice,
  .evfooter {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-top: 10px;
  }

  .evtext {
    margin-top: 10px;
    font-size: 14px;
  }

  .evfooter p {
    font-size: 14px;
    color: #555;
  }
}
</style>
