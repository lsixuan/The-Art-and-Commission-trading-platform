<template>
    <div>
        <div class="page">
            <div class="page-left">
                <el-card class="user-card">
                    <div class="userinfo">
                        <img src="../../assets/user.png" alt="">
                        <span class="usertype">Customer</span>
                        <span>{{ userName }}</span>
                    </div>
                    <hr color="#eee" size="1">
                    <el-menu :default-active="menuActive" active-text-color="#00a8e9" class="el-menu-demo"
                        mode="vertical" @select="handleSelect">
                        <el-menu-item index="1" v-if="isHuaOrQih === '1'">
                            <i class="el-icon-user"></i>
                            <span slot="title">My Artist</span>
                        </el-menu-item>
                        <el-menu-item index="2" v-if="isHuaOrQih === '1'">
                            <i class="el-icon-folder-opened"></i>
                            <span slot="title">My Booking</span>
                        </el-menu-item>
                        <el-menu-item index="3">
                            <i class="el-icon-bell"></i>
                            <span slot="title">System notifications</span>
                        </el-menu-item>
                    </el-menu>
                </el-card>
                <el-card class="usersave-card">
                    <div class="box">
                        <i class="el-icon-folder-opened"></i>
                        <p>My collection of artists</p>
                    </div>
                </el-card>
                <el-card class="date-card">
                    <p>Deadline Calendar</p>
                    <el-calendar v-model="noeDate"></el-calendar>
                </el-card>
            </div>
            <div class="page-right">
                <el-card class="my-painter">
                    <div slot="header" class="clearfix">
                        <h2 v-if="menuActive === '1'">My Artist</h2>
                        <h2 v-else-if="menuActive === '2'">My Booking</h2>
                        <h2 v-else-if="menuActive === '3'">System notifications</h2>
                    </div>
                    <div class="painterbox" v-if="menuActive === '1'">
                        <img src="../../assets/touchfish.svg" alt="">
                        <div>
                            <h2>You haven't worked with any artists yet</h2>
                            <p>After you complete the collaboration with the artist, the artist will appear here.</p>
                        </div>
                    </div>
                    <div class="manubox" v-else-if="menuActive === '2'">
                        <img src="../../assets/manu.jpg" alt="">
                        <div>
                            <h2>Currently unavailable Booking</h2>
                        </div>
                    </div>
                    <div class="manubox" v-else-if="menuActive === '3'">
                        <p>There is currently no notification yet</p>
                    </div>
                </el-card>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    name: 'UserHome',
    data() {
        return {
            userName: 'xxxxxx',
            noeDate: new Date(),
            menuActive: '1',
            isHuaOrQih: ''
        }
    },
    mounted() {
        this.isHuaOrQih = this.$route.query.isHuaOrQih;
        if (this.$route.query.isHuaOrQih !== '1') { // Artist Login
            this.menuActive = '3'
        }
    },
    methods: {
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

/deep/.el-calendar-table thead th {
    text-align: center;
    font-size: 13px;
}

/deep/.el-calendar__header {
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