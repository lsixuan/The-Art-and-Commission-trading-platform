<template>
    <div>
        <Header :defaultActive="defaultActive" />
        <main>
            <div v-for="item in [1, 2, 3, 4, 5, 6, 7]">
                <ul>
                    <li class="hsbox">
                        <router-link to="/profiles">
                            <img src="../../assets/userlist.png" alt="">
                        </router-link>
                        <div>
                            <p>spirtie</p>
                            <p>218 comment 5.0</p>
                            <el-button type="primary" size="small">Small buttons</el-button>
                        </div>
                    </li>
                    <li>
                        <img src="../../assets/hs1.png" alt="">
                    </li>
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
                <hr color="#eee" size="1" style="margin: 20px 0;">
            </div>

        </main>
    </div>
</template>

<script>
import Header from '@/pages/Header/Header.vue'
export default {
    name: 'Artists',
    components: { Header },
    data() {
        return {
            defaultActive: '2'
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