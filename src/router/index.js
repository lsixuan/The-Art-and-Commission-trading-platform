
import VueRouter from 'vue-router'

import Login from '../pages/Login/Login.vue'
import adminLogin from '../pages/Login/adminLogin.vue'
import Register from '../pages/Register/Register.vue'
import UserInfo from '../pages/userInfo/userInfo.vue'
import userVerification from '../pages/userVerification/userVerification.vue'
import userManage from '../pages/userManage/userManage.vue'
import albumInfo from '../pages/albumInfo/albumInfo.vue'
import albums from '../pages/albums/albums.vue'
import Home from '../pages/Home/Home.vue'
import UserHome from '../pages/UserHome/UserHome.vue'
import Artists from '../pages/Artists/Artists.vue'
import Profiles from '../pages/Profiles/Profiles.vue'


const router = new VueRouter({
    routes: [
        {
            path: '/',
            redirect: '/login',
            component: Login,
        },
        {
            path: '/login',
            component: Login,
        },
        {
            path: '/adminLogin',
            component: adminLogin,
        },
        {
            path: '/register',
            component: Register,
        },
        {
            path: '/albums',
            component: albums,
        },
        {
            path: '/userInfo',
            component: UserInfo,
        },
        {
            path: '/userVerification',
            component: userVerification,
        },
        {
            path: '/userManage',
            component: userManage,
        },
        {
            path: '/albumInfo',
            component: albumInfo,
        },
        {
            path: '/home',
            component: Home,
            children: [
                {
                    path: 'userhome',
                    component: UserHome,
                },
            ]
        },
        {
            path: '/artists',
            component: Artists,
        },
        {
            path: '/profiles',
            component: Profiles,
        },

    ]
})

export default router
