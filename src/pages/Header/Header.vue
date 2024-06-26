<template>
    <div>
        <div class="header">
            <img style="height: 56px;" src="../../assets/logo.png" alt="">
            <el-menu :default-active="defaultActive" active-text-color="#00a8e9" mode="horizontal">
                <el-menu-item index="1">
                    <router-link to="/home/userhome">Home Page</router-link>
                </el-menu-item>
                <el-menu-item index="2">
                    <router-link to="/artists">Artist</router-link>
                </el-menu-item>
                <el-menu-item index="3">1</el-menu-item>
                <el-menu-item index="4">2</el-menu-item>
                <el-menu-item index="5">3</el-menu-item>
                <el-menu-item index="6">4</el-menu-item>
                <el-menu-item index="7">5</el-menu-item>
                <el-menu-item index="8">6</el-menu-item>
            </el-menu>
            <ul class="userinfo">
                <li><i class="el-icon-search"></i></li>
                <li><i class="el-icon-bell"></i></li>
                <li>

                    <el-dropdown>
                        <span class="el-dropdown-link">
                            <img src="../../assets/user.png" alt="">
                        </span>
                        <el-dropdown-menu slot="dropdown">
                            <el-dropdown-item>
                                <router-link to="/">Log out</router-link>
                            </el-dropdown-item>
                        </el-dropdown-menu>
                    </el-dropdown>
                </li>
                <li>
                    <el-button type="primary">Release requirements</el-button>
                </li>
            </ul>
        </div>
    </div>
</template>

<script>
export default {
    name: 'Header',
    props: ['defaultActive']
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