<template>
    <div>
        <div class="header">
            <img style="height: 56px;" src="../../assets/logo.png" alt="">


          <el-menu :default-active="defaultActive" active-text-color="#00a8e9" mode="horizontal">
                <el-menu-item index="1" v-if="role==1||role==2||role==0">
                    <router-link to="/home/userhome" >Home Page</router-link>
                </el-menu-item>
                <el-menu-item index="2">
                    <router-link to="/artists">Artist</router-link>
                </el-menu-item>
                <el-menu-item index="3" v-if="role==0">
                  <router-link to="/userVerification" >userVerification</router-link>
                </el-menu-item>
                <el-menu-item index="4" v-if="role==0">
                  <router-link to="/userManage" >userManage</router-link>

                </el-menu-item>
                <el-menu-item index="5">
                  <router-link to="/albums" v-if="role==2">myAlbums</router-link>
                  </el-menu-item>
            </el-menu>
            <ul class="userinfo">
                <li><i class="el-icon-search"></i></li>
                <li><i class="el-icon-bell"></i></li>
                <li>

                    <el-dropdown>
                        <span class="el-dropdown-link">
<!--                            <img src="../../assets/user.png" alt="">-->
                           <img :src="userAvatar" alt="">
                        </span>
                        <el-dropdown-menu slot="dropdown">
                            <el-dropdown-item>
                                <span @click="logout">Log out</span>
                            </el-dropdown-item>
                        </el-dropdown-menu>
                    </el-dropdown>
                </li>
                <li>
<!--                    <el-button type="primary">Release requirements</el-button>-->
                </li>
            </ul>
        </div>
    </div>
</template>

<script>
export default {
  name: 'Header',
  props: ['defaultActive'],
  data() {
    return {
      defaultAvatar: '../../assets/user.png',
      defaultRole: '1',
    }
  },
  computed: {
    userAvatar() {
      const currentUser = JSON.parse(localStorage.getItem('currentUser'));
      return currentUser && currentUser.avatar ? currentUser.avatar : this.defaultAvatar;
    },
    role(){
      const currentUser = JSON.parse(localStorage.getItem('currentUser'));
      debugger
      return currentUser && currentUser.role ? currentUser.role : this.defaultRole;
    }
  },
  methods:{
    logout(){
      // wipe cache 
      localStorage.clear();
      // Jump to login page
      this.$router.push({path: '/'})
    },
  }
}
</script>


<style lang="scss" scoped>
.header {
    display: flex;
    align-items: center;
    height: 80px;
    transition: .5s;
    background-color: #fff;
    position: fixed;
    top: 0;
    right: 0;
    left: 0;
    z-index: 1030;
    padding: 0 30px 0 40px;
    border-bottom: 1px solid #ececec;

    .container {
        display: flex;

    }

    .is-active {
        border-width: 0px;
    }

    .el-menu {
        margin-left: 20px;

        li {
            font-size: 16px;
        }

    }

    .el-menu,
    .el-menu.el-menu--horizontal {
        border-width: 0;
    }

    .userinfo {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-left: auto;

        li {
            margin-left: 50px;

            i {
                font-size: 20px;
            }

            img {
                width: 40px;
                height: 40px;
                border-radius: 50%;
            }
        }
    }
}
</style>
