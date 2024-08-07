<template>
  <div>
    <div class="page">
      <div class="page-left">
        <el-card class="user-card">
          <div class="userinfo">
            <img :src="userAvatar" alt="">
            <span class="usertype">{{ userRole }}</span>
            <span>{{ userName }}</span>
          </div>
          <hr color="#eee" size="1">
          <el-menu :default-active="menuActive" active-text-color="#00a8e9" class="el-menu-demo"
                   mode="vertical" @select="handleSelect">

            <el-menu-item index="1" v-if="role==1">
              <i class="el-icon-user"></i>
              <span slot="title">My Artist</span>
            </el-menu-item>
            <el-menu-item index="2">
              <i class="el-icon-user"></i>
              <span slot="title">Personal Information</span>
            </el-menu-item>
          </el-menu>
        </el-card>
        <el-card class="usersave-card">
          <div class="box">
            <i class="el-icon-folder-opened"></i>
            <p>My collection of artists</p>
          </div>
        </el-card>
        <el-card class="date-card" v-if="role==2">

          <select-date
              ref="selectDate"
              :read-only="false"
              @update:selectedDates="updateSelectedDates"
          />
          <!--                    <el-calendar v-model="noeDate"></el-calendar>-->
        </el-card>
      </div>
      <div class="page-right">
        <el-card class="my-painter">
          <div slot="header" class="clearfix">
            <h2 v-if="menuActive === '1'">My Artist</h2>
            <h2 v-if="menuActive === '2'">Personal Information</h2>
          </div>
          <div v-if="menuActive === '1'">
            <artists-list/>
          </div>
          <div v-if="menuActive === '2'">
            <personInfo/>
          </div>
        </el-card>
      </div>
    </div>
  </div>
</template>

<script>
import personInfo from "@/pages/personInfo/personInfo.vue";
import ArtistsList from '@/pages/ArtistsList/ArtistsList.vue'
import selectDate from "@/pages/UserHome/selectDate.vue";
import {getArtistNoDateList} from "@/api/artistNoDate";
import {nextTick} from "vue";

export default {
  components: {
    personInfo,
    ArtistsList,
    selectDate
  },
  name: 'UserHome',
  data() {
    return {
      noeDate: new Date(),
      menuActive: '2',
      isHuaOrQih: '',
      defaultAvatar: '../../assets/user.png',
      selectedDates: [],
      defaultRole: 1
    }
  },
  computed: {
    updateSelectedDates(dates) {

      this.selectedDates = dates
    },
    currentUser() {
      return JSON.parse(localStorage.getItem('currentUser')) || {};
    },
    userAvatar() {
      return this.currentUser.avatar || this.defaultAvatar;
    },
    userName() {
      return this.currentUser.userName || 'Unknown User';
    },
    userRole() {
      switch (this.currentUser.role) {
        case '0':
          return 'Admin';
        case '1':
          return 'Customer';
        case '2':
          return 'Artist';
        default:
          return 'Unknown Role';
      }
    },
    role() {
      const currentUser = JSON.parse(localStorage.getItem('currentUser'));
      return currentUser && currentUser.role ? currentUser.role : this.defaultRole;
    }
  },
  mounted() {
    this.getArtistNoDateList()
    // this.isHuaOrQih = this.$route.query.isHuaOrQih;
    // if (this.$route.query.isHuaOrQih !== '1') { // 画师登录
    //   this.menuActive = '3'
    // }
  },
  methods: {
    getArtistNoDateList() {
      getArtistNoDateList().then(res => {

        if (res.code === 200 || res.code === 0) {
          let arr = []
          res.data.forEach(item => {
            arr.push(item.noDate)
          })
          debugger
          this.initialDates = arr
          nextTick(() => {
            this.$refs.selectDate.reloadData()
          })
          // this.$refs.selectDate.reloadData()
          // Mandatory update
        }
        // console.log(res)
      })
    },
    handleSelect(key, keyPath) {
      console.log(key, keyPath);
      this.menuActive = key
    }
  }
}
</script>

<style lang="scss" scoped>
.page {
  display: flex;
  justify-content: space-between;
  margin: 60px 120px;

  .page-left {
    flex: 0 0 280px;
  }

  .page-right {
    flex: 1;
    margin-left: 15px
  }
}

.user-card,
.usersave-card,
.date-card {
  width: 280px;
  padding: 30px 0;
  margin-bottom: 20px;
  text-align: left;
}

.userinfo {
  display: flex;
  align-items: center;
  justify-content: space-around;
  margin-bottom: 20px;

  .usertype {
    color: #00a8e9;
  }

  img {
    width: 50px;
    height: 50px;
    border-radius: 50%;
  }
}

.usersave-card {
  padding: 0;

  .box {
    text-align: center;

    i {
      font-size: 20px;
      margin-bottom: 5px;
    }
  }
}

.date-card {
  position: relative;
  padding: 0;

  p {
    position: absolute;
    top: 32px;
  }
}

.el-menu,
.el-menu.el-menu--horizontal {
  border-width: 0;
}

/deep/ .el-button-group {
  display: none !important;
}

/deep/ .el-calendar__body {
  padding: 0;
}

/deep/ .el-calendar-table .el-calendar-day {
  height: auto;
  box-sizing: border-box;
  padding: 5px 0;
  text-align: center;
  font-size: 13px;
}

/deep/ .el-calendar-table thead th {
  text-align: center;
  font-size: 13px;
}

/deep/ .el-calendar__header {
  justify-content: end;
  padding: 12px 0px;
}

.painterbox,
.manubox {
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 50px 0;

  img {
    width: 120px;
    height: 120px;
    margin-right: 20px;
  }
}
</style>
