
import VueRouter from 'vue-router'

import Login from '../pages/Login/Login.vue'
import Register from '../pages/Register/Register.vue'
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
            path: '/register',
            component: Register,
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