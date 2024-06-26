<template>
    <div>
        <Header :defaultActive="defaultActive" />
        <img src="../../assets/headerbg.png" alt="">
        <main>
            <div class="user-info">
                <div class="user-left">
                    <img src="../../assets/userlist.png" alt="">
                    <p>spirtie</p>
                </div>
                <div class="user-right">
                    <el-button style=" width: 200px;" type="warning">Booking</el-button>
                    <el-button style=" width: 200px;" type="primary">Add in my list</el-button>
                </div>
            </div>
            <div class="hs-info">
                <p>Artist Introduction</p>
                <p class="hstext">
                    I have many ideas and hope to achieve them. 
                    I will work diligently to complete each work.
                    ...
                    <span>More</span>
                </p>
            </div>
            <el-menu :default-active="activeIndex" class="el-menu-demo" mode="horizontal" @select="handleSelect">
                <el-menu-item index="1" style="margin-right: 50px;">Exhibition of works</el-menu-item>
                <el-menu-item index="2">Reputation evaluation</el-menu-item>
            </el-menu>
            <div class="good-pic-list" v-if="activeIndex === '1'">
                <ul v-for="item in 10">
                    <li>
                        <img src="../../assets/hs2.png" alt="">
                    </li>
                    <li>
                        <img src="../../assets/hs3.png" alt="">
                    </li>
                    <li>
                        <img src="../../assets/hs4.png" alt="">
                    </li>
                    <li>
                        <img src="../../assets/hs5.png" alt="">
                    </li>
                </ul>
            </div>
            <div class="evaluate-list" v-else-if="activeIndex === '2'">
                <div class="evaluate" v-for="item in 10">
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
        </main>
    </div>
</template>

<script>
import Header from '@/pages/Header/Header.vue'
export default {
    name: 'Profiles',
    components: { Header },
    data() {
        return {
            activeIndex: '1',
            rateVal: 5
        }
    },
    methods: {
        handleSelect(key) {
            this.activeIndex = key
        }
    }
}
</script>

<style scoped lang="scss">
main {
    padding: 0 150px;
    padding-bottom: 100px;
    background-color: #fff;
}

.user-info {
    display: flex;
    justify-content: space-between;
    align-items: center;

    .user-left {
        display: flex;

        img {
            transform: translateY(-50%);
            border-radius: 50%;
        }

        p {
            font-size: 24px;
            margin-left: 30px;
            padding-top: 20px;
        }
    }

}

.hs-info {
    padding-bottom: 60px;

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
        justify-content: space-between;

        li {
            margin: 10px;

            img {
                border-radius: 5px;
                border: 1px solid #eee;
            }
        }
    }
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